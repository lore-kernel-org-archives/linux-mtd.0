Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5a7e-0007ZC-OF
	for linux-mtd@lists.infradead.org; Wed, 04 Nov 2009 07:17:43 +0000
Subject: Re: Corrupted ubifs after reboot (from the debugger)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricardo <ricardo.ribalda@gmail.com>
In-Reply-To: <aa76a2be0911030732n74406409v62ae64244ef358a6@mail.gmail.com>
References: <aa76a2be0911030732n74406409v62ae64244ef358a6@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Nov 2009 09:17:28 +0200
Message-Id: <1257319048.21596.74.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 16:32 +0100, Ricardo wrote:
> Hello
> 
>    I am using ubifs on a custom board with a Spansion 128 MB NOR
> flash. I am using the last kernel sources and the patch from Eric
> Holmberg to reduce the MaxBufWriteSize to 8 (
> http://lists.infradead.org/pipermail/linux-mtd/2009-May/025657.html ).
> 
>    After rebooting the board with the debug cable I could not bring
> back the rfs again. Attach you will find the log from the kernel.
> 
>    This is the first corruption in months of normal use, after
> applying the MaxBufWriteSize patch.  Any idea about how can I do to
> solve this problem? Do you need more info from the flash?

Please, inform which exactly kernel you use. Judging from your log, you
do not have the latest UBIFS. Please update it if that is true.

Please, check whether your UBI is fresh enough and has the following
patches:

commit de75c771b4cc4da963164a538a8448128301bc35
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Fri Jul 24 16:18:04 2009 +0300

    UBI: improve NOR flash erasure quirk

    More testing of NOR flash against power cuts showed that sometimes
    eraseblocks may be unwritable, and we cannot really invalidate
    them before erasure. But in this case the eraseblock probably
    contains garbage anyway, and we do not have to invalidate the
    headers. This assumption might be not true, but this is at least
    what I have observed. So if we cannot invalidate the headers,
    we make sure that the PEB does not contain valid VID header.
    If this is true, everything is fine, otherwise we panic.

commit 5b289b562f6d236108569a880cb38cc03d17a50d
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Sun Jul 19 14:09:46 2009 +0300

    UBI: amend NOR flash pre-erase quirk

    In case of NOR flash, UBI zeroes EC and VID headers' magic,
    in order to detect interrupted erasures. It first zeroes out
    the EC magic, then VID magic. However, if a power cut happens
    in between, we'll end up with a corrupted EC header and a valid
    VID header, in which case UBI accepts the PEB, but prints a
    warning. This patch makes sure we first zero out the VID
    magic, then the EC magic, not vice versa. This is just a
    small amendment to prevent warning messages.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

commit ebf53f421308c2f59c9bcbad4c5c297a0d00199a
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Mon Jul 6 08:57:53 2009 +0300

    UBI: fix NOR flash recovery

    This commit fixes NOR flash recovery issues observed with Spansion
    S29GL512N NOR.

    When NOR erases, it first fills PEBs with zeroes, then sets all bytes
    to 0xFF. Filling with zeroes starts from the end of the PEB. And when
    power is cut, this results in PEBs containing correct EC and VID headers
    but corrupted with zeros at the end. This confuses UBI and it mistakinly
    accepts these PEBs and associate them with LEBs.

    Fis this issue by zeroing EC and VID magics before erasing PEBs, to
    make UBI later refuse zem.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

and the following UBIFS patches:

commit 0dcd18e4073454daf591e7127247e32ec942b4f3
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Tue Aug 25 16:22:53 2009 +0300

    UBIFS: check ubifs_scan error codes better

    The 'ubifs_scan()' function returns -EUCLEAN if something is corrupted
    and recovery is needed, otherwise it returns other error codes. However,
    in few places UBIFS does not check the error codes and runs recovery.
    This patch changes this behavior and makes UBIFS start recovery only
    on -EUCLEAN errors.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
    Reviewed-by: Adrian Hunter <Adrian.Hunter@nokia.com>

commit 348709bad348d2fd013e1529b4cf5f220717c328
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Tue Aug 25 15:00:55 2009 +0300

    UBIFS: do not print scary error messages needlessly

    At the moment UBIFS print large and scary error messages and
    flash dumps in case of nearly any corruption, even if it is
    a recoverable corruption. For example, if the master node is
    corrupted, ubifs_scan() prints error dumps, then UBIFS recovers
    just fine and goes on.

    This patch makes UBIFS print scary error messages only in
    real cases, which are not recoverable. It adds 'quiet' argument
    to the 'ubifs_scan()' function, so the caller may ask 'ubi_scan()'
    not to print error messages if the caller is able to do recovery.

    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
    Reviewed-by: Adrian Hunter <Adrian.Hunter@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
