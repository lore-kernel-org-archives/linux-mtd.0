Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JQJNY-0003rC-PG
	for linux-mtd@lists.infradead.org; Sat, 16 Feb 2008 09:30:46 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1509851wah.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Feb 2008 01:30:39 -0800 (PST)
Message-ID: <d50b16a50802160123u35507765h83524d52ff21c3e4@mail.gmail.com>
Date: Sat, 16 Feb 2008 18:23:20 +0900
From: "Hyojeong Lee" <hj.lee.0215@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: I want to mount nandsim as vfat using nftl
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_1687_27221353.1203153800907"
Reply-To: hjlee0215@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_1687_27221353.1203153800907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I want to mount nandsim as vfat using nftl.
For the reason of my board, I should use linux 2.6.11.9.
And in that version, nftl_format utility is not available.

I compiled MTD, nftl, nandsim and so on.
(nandsim is not tristate in the version of 2.6.11.9 so I couldn't make it as
a module)

I can see
dev:        size     erasesize  name
mtd0:  00800000 0020000 "NAND simulator partition"
in /proc/mtd

and I can see /dev/mtdblock0

I want to make a situation as follows

FAT
-------
NFTL
-------
MTD
-------
NANDSIM


I tried
mknod /dev/nftla b 93 0
mknod /dev/nftla1 b 93 1
fdisk /dev/nftla

but the kernel says that
"Unable to open /dev/nftla"

I tried insmod nftl.ko on every point I could try.
But same error occurs.

What I should do to achieve my goal?
Or where can I get information?

regards,
Hyojeong.

------=_Part_1687_27221353.1203153800907
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I want to mount nandsim as vfat using nftl.<br>For the reason of my board, I should use linux <a href="http://2.6.11.9">2.6.11.9</a>.<br>And in that version, nftl_format utility is not available.<br><br>I compiled MTD, nftl, nandsim and so on.<br>
(nandsim is not tristate in the version of <a href="http://2.6.11.9">2.6.11.9</a> so I couldn&#39;t make it as a module)<br><br>I can see <br>dev:&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; size &nbsp; &nbsp; erasesize&nbsp; name<br>mtd0:&nbsp; 00800000 0020000 &quot;NAND simulator partition&quot;<br>
in /proc/mtd<br><br>and I can see /dev/mtdblock0<br><br>I want to make a situation as follows<br><br>FAT<br>-------<br>NFTL<br>-------<br>MTD<br>-------<br>NANDSIM<br><br><br>I tried<br>mknod /dev/nftla b 93 0<br>mknod /dev/nftla1 b 93 1<br>
fdisk /dev/nftla<br><br>but the kernel says that<br>&quot;Unable to open /dev/nftla&quot;<br><br>I tried insmod nftl.ko on every point I could try.<br>But same error occurs.<br><br>What I should do to achieve my goal?<br>
Or where can I get information?<br><br>regards,<br>Hyojeong.<br>

------=_Part_1687_27221353.1203153800907--
