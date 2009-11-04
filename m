Received: from mail-ew0-f228.google.com ([209.85.219.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N5igz-0008TA-Dx
	for linux-mtd@lists.infradead.org; Wed, 04 Nov 2009 16:26:45 +0000
Received: by ewy28 with SMTP id 28so7298372ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Nov 2009 08:26:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1257319048.21596.74.camel@localhost>
References: <aa76a2be0911030732n74406409v62ae64244ef358a6@mail.gmail.com>
	<1257319048.21596.74.camel@localhost>
From: Ricardo <ricardo.ribalda@gmail.com>
Date: Wed, 4 Nov 2009 17:26:19 +0100
Message-ID: <aa76a2be0911040826w5e5ce3bah7afa3fdbf92ae8a2@mail.gmail.com>
Subject: Re: Corrupted ubifs after reboot (from the debugger)
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

  I am using the 2.6.31 from linus tree. I will merge the tree from
infreadead.org/mtd-2.6 right now. Will this version be able to restore
the broken partition or it wont corrupt future partitions?


        Thanks and best regards

On Wed, Nov 4, 2009 at 08:17, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2009-11-03 at 16:32 +0100, Ricardo wrote:
>> Hello
>>
>> =C2=A0 =C2=A0I am using ubifs on a custom board with a Spansion 128 MB N=
OR
>> flash. I am using the last kernel sources and the patch from Eric
>> Holmberg to reduce the MaxBufWriteSize to 8 (
>> http://lists.infradead.org/pipermail/linux-mtd/2009-May/025657.html ).
>>
>> =C2=A0 =C2=A0After rebooting the board with the debug cable I could not =
bring
>> back the rfs again. Attach you will find the log from the kernel.
>>
>> =C2=A0 =C2=A0This is the first corruption in months of normal use, after
>> applying the MaxBufWriteSize patch. =C2=A0Any idea about how can I do to
>> solve this problem? Do you need more info from the flash?
>
> Please, inform which exactly kernel you use. Judging from your log, you
> do not have the latest UBIFS. Please update it if that is true.
>
> Please, check whether your UBI is fresh enough and has the following
> patches:
>
> commit de75c771b4cc4da963164a538a8448128301bc35
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: =C2=A0 Fri Jul 24 16:18:04 2009 +0300
>
> =C2=A0 =C2=A0UBI: improve NOR flash erasure quirk
>
> =C2=A0 =C2=A0More testing of NOR flash against power cuts showed that som=
etimes
> =C2=A0 =C2=A0eraseblocks may be unwritable, and we cannot really invalida=
te
> =C2=A0 =C2=A0them before erasure. But in this case the eraseblock probabl=
y
> =C2=A0 =C2=A0contains garbage anyway, and we do not have to invalidate th=
e
> =C2=A0 =C2=A0headers. This assumption might be not true, but this is at l=
east
> =C2=A0 =C2=A0what I have observed. So if we cannot invalidate the headers=
,
> =C2=A0 =C2=A0we make sure that the PEB does not contain valid VID header.
> =C2=A0 =C2=A0If this is true, everything is fine, otherwise we panic.
>
> commit 5b289b562f6d236108569a880cb38cc03d17a50d
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: =C2=A0 Sun Jul 19 14:09:46 2009 +0300
>
> =C2=A0 =C2=A0UBI: amend NOR flash pre-erase quirk
>
> =C2=A0 =C2=A0In case of NOR flash, UBI zeroes EC and VID headers' magic,
> =C2=A0 =C2=A0in order to detect interrupted erasures. It first zeroes out
> =C2=A0 =C2=A0the EC magic, then VID magic. However, if a power cut happen=
s
> =C2=A0 =C2=A0in between, we'll end up with a corrupted EC header and a va=
lid
> =C2=A0 =C2=A0VID header, in which case UBI accepts the PEB, but prints a
> =C2=A0 =C2=A0warning. This patch makes sure we first zero out the VID
> =C2=A0 =C2=A0magic, then the EC magic, not vice versa. This is just a
> =C2=A0 =C2=A0small amendment to prevent warning messages.
>
> =C2=A0 =C2=A0Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>
> commit ebf53f421308c2f59c9bcbad4c5c297a0d00199a
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: =C2=A0 Mon Jul 6 08:57:53 2009 +0300
>
> =C2=A0 =C2=A0UBI: fix NOR flash recovery
>
> =C2=A0 =C2=A0This commit fixes NOR flash recovery issues observed with Sp=
ansion
> =C2=A0 =C2=A0S29GL512N NOR.
>
> =C2=A0 =C2=A0When NOR erases, it first fills PEBs with zeroes, then sets =
all bytes
> =C2=A0 =C2=A0to 0xFF. Filling with zeroes starts from the end of the PEB.=
 And when
> =C2=A0 =C2=A0power is cut, this results in PEBs containing correct EC and=
 VID headers
> =C2=A0 =C2=A0but corrupted with zeros at the end. This confuses UBI and i=
t mistakinly
> =C2=A0 =C2=A0accepts these PEBs and associate them with LEBs.
>
> =C2=A0 =C2=A0Fis this issue by zeroing EC and VID magics before erasing P=
EBs, to
> =C2=A0 =C2=A0make UBI later refuse zem.
>
> =C2=A0 =C2=A0Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>
> and the following UBIFS patches:
>
> commit 0dcd18e4073454daf591e7127247e32ec942b4f3
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: =C2=A0 Tue Aug 25 16:22:53 2009 +0300
>
> =C2=A0 =C2=A0UBIFS: check ubifs_scan error codes better
>
> =C2=A0 =C2=A0The 'ubifs_scan()' function returns -EUCLEAN if something is=
 corrupted
> =C2=A0 =C2=A0and recovery is needed, otherwise it returns other error cod=
es. However,
> =C2=A0 =C2=A0in few places UBIFS does not check the error codes and runs =
recovery.
> =C2=A0 =C2=A0This patch changes this behavior and makes UBIFS start recov=
ery only
> =C2=A0 =C2=A0on -EUCLEAN errors.
>
> =C2=A0 =C2=A0Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> =C2=A0 =C2=A0Reviewed-by: Adrian Hunter <Adrian.Hunter@nokia.com>
>
> commit 348709bad348d2fd013e1529b4cf5f220717c328
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: =C2=A0 Tue Aug 25 15:00:55 2009 +0300
>
> =C2=A0 =C2=A0UBIFS: do not print scary error messages needlessly
>
> =C2=A0 =C2=A0At the moment UBIFS print large and scary error messages and
> =C2=A0 =C2=A0flash dumps in case of nearly any corruption, even if it is
> =C2=A0 =C2=A0a recoverable corruption. For example, if the master node is
> =C2=A0 =C2=A0corrupted, ubifs_scan() prints error dumps, then UBIFS recov=
ers
> =C2=A0 =C2=A0just fine and goes on.
>
> =C2=A0 =C2=A0This patch makes UBIFS print scary error messages only in
> =C2=A0 =C2=A0real cases, which are not recoverable. It adds 'quiet' argum=
ent
> =C2=A0 =C2=A0to the 'ubifs_scan()' function, so the caller may ask 'ubi_s=
can()'
> =C2=A0 =C2=A0not to print error messages if the caller is able to do reco=
very.
>
> =C2=A0 =C2=A0Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> =C2=A0 =C2=A0Reviewed-by: Adrian Hunter <Adrian.Hunter@nokia.com>
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>



--=20
Ricardo Ribalda
http://www.eps.uam.es/~rribalda/
