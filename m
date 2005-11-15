Received: from cnxtsmtp9.conexant.com ([198.62.9.206] helo=nbmime1.bbnet.ad)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ec0RT-0003aa-3s
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 08:01:51 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Nov 2005 18:32:34 +0530
Message-ID: <4D6E93075B31154298572E6B73CA849D02DBC3A5@noida-mail.bbnet.ad>
From: "Achin Gupta" <achin.gupta@conexant.com>
To: "MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: MTD build broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am trying to add support for an Intel NOR Flash device on an ARM
1026-EJS platform. As mentioned in the "mtd-jffs-HOWTO.txt" I checked
out the latest code from CVS. However, the build breaks while trying to
compile the file "fs/jffs2/background.c" as follows :-

>>>>>
fs/jffs2/background.c:95:22: macro "try_to_freeze" passed 1 arguments,
but takes just 0
fs/jffs2/background.c: In function `jffs2_garbage_collect_thread':
fs/jffs2/background.c:95: warning: the address of `try_to_freeze', will
always evaluate as `true'
make[2]: *** [fs/jffs2/background.o] Error 1
make[1]: *** [fs/jffs2] Error 2
make: *** [fs] Error 2
>>>>>

After diffing "background.c" with a previous version I found that the
problem lies in a call to "try_to_freeze". While it was
"try_to_freeze(0)" earlier, its become "try_to_freeze()" now.
I suppose this is a typo. If so kindly fix it at the earliest.

Thanks,
Achin


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Bernhard
Priewasser
Sent: Tuesday, November 15, 2005 3:58 PM
To: MTD mailing list
Subject: Strange NOR read/write throughput behaviour

Hi all,

can anybody help me explaining this diagram of NOR read throughput?

	http://files.lamark.de/nor_read.png

As soon as a file, read from a StrataFlash containing only this file,
exceeds erase block size (128KiB), file reading lasts a portion of time
longer and read throughput stagnates...

Write throughput seems to be constant around erase block size:

	http://files.lamark.de/nor_write.png

Best regards,
Bernhard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/




********************** Legal Disclaimer ****************************
"This email may contain confidential and privileged material for the sole u=
se of the intended recipient.  Any unauthorized review, use or distribution=
 by others is strictly prohibited.  If you have received the message in err=
or, please advise the sender by reply email and delete the message. Thank y=
ou."
**********************************************************************
