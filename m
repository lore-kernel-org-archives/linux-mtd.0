Received: from pc3-stap1-6-cust96.nott.cable.ntl.com ([81.98.145.96] helo=server)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YJOk-0008V6-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 05:14:02 +0000
Received: from [10.0.0.2] (helo=linux)
	by server with esmtp (Exim 3.35 #1 (Debian))
	id 18YJrx-0003KB-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 05:44:13 +0000
Content-Type: text/plain;
  charset="us-ascii"
From: Marcus Birkin <marcus.birkin@bigfooot.com>
To: linux-mtd@lists.infradead.org
Subject: Grub on DiskOnChip2000
Date: Tue, 14 Jan 2003 05:44:33 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200301140544.33267.marcus.birkin@bigfooot.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi

Basicly i'm stuck, i've read the HowTo=20
(http://lists.infradead.org/pipermail/linux-mtd/2002-October/006166.html)

I've got to the stage where i compile grub, it compiles with out error. B=
ut=20
theres no grub_firmware in /stage1.

After reading the documention with MTD, i find out how to create a=20
grub_firmware file from pre_stage2, this compiles fine and i'm then able =
to=20
flash it to my DiskOnChip2000.
I reboot, and grub loads, but it can only access hd0 (not dc0).
The diskonchip has a valid ext2 partion (with a copy of the /boot from hd=
0).

Any ideas what i'm doing wrong?

Regards
Marcus
