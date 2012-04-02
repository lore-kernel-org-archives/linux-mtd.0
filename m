Received: from x9703.hospira.com ([12.144.124.6] helo=HQAX9703.hospira.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SEj2m-0004HD-8q
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 15:19:44 +0000
Received: from HQSX5762.Hospira.corp ([10.23.45.240]) by HQAX9703.hospira.com
 with ESMTP id YNmwxNU1Nnz29Qdt (version=TLSv1 cipher=AES128-SHA bits=128
 verify=NO) for <linux-mtd@lists.infradead.org>;
 Mon, 02 Apr 2012 10:19:42 -0500 (CDT)
From: "Walden, Gerald" <Gerald.Walden@hospira.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Apr 2012 10:19:40 -0500
Subject: jffs2 file corruption shows up in linux kernel but not u-boot
Message-ID: <E27A5536A95F1943B6E938D32A37417E02F43C1B77@USNBSX5710.Hospira.corp>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using the 2.6.33 kernel.

I am also using the latest version of u-boot.

Our devices have the jffs2 filesystem on flash - mounted at /mnt/jffs2

We write a file which is about 64k to /mnt/jffs2/lib/filename.xml

On 50 out of some 500 boards, we get the error "requestied to read an nonex=
istent ino #25" after I do
an "ls -al /mnt/jffs2/lib"

Subsequent mounts will mount the file system - the error message above is s=
till printed out during mounting.

The reason I bring up u-boot is that I can halt the boot process to get to =
the u-boot prompt, and I can
execute the command "ls".  The ls command scans the jffs2 filesystem.  The =
u-boot jffs2 scan process shows no=20
errors and completes printing out the filesystem listing.

It seems that u-boot has validated the filesystem, yet when I load the linu=
x kernel and interact with the filesystem
at the /mnt/jffs2/lib the readinode.c routine in the jffs2 subsystems finds=
 an error.

Any advice on these results??

Thanks

Jerry

CONFIDENTIALITY STATEMENT. This email and any attachment is for the sole us=
e of the intended recipient and may contain private, confidential and/or pr=
ivileged information that may be subject to Hospira internal policies. If y=
ou are not the intended recipient, any dissemination, distribution or copyi=
ng is strictly prohibited. If you have received this transmission in error,=
 please notify Hospira immediately by return email or by email to privacypo=
stmaster@hospira.com and delete the message and all copies and attachments =
from your system.
