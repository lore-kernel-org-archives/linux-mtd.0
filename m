Received: from [210.245.1.55] (helo=fsoft-email01.fsoft.fpt.vn)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHvW4-0004Gq-He
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 23:44:40 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Sep 2005 10:20:27 +0700
Message-ID: <BD3D9FF82608A74BA5407250FF83ACB7023368@fsoft-email01.fsoft.fpt.vn>
From: "Nguyen Manh Dung \(G7\)" <DungNM2@fsoft.com.vn>
To: <linux-mtd@lists.infradead.org>
Subject: System Memory Layout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all !
I'm building Embedded Linux System.
My board has 16M of RAM and 8M of Flash.The RAM is mapped from address =
0x0000000 to address 0x00FFFFFF, and the flash is mapped from address =
0x40000000 to address 0x407FFFFF
I use u-boot, kernel 2.6.12.5, JFFS2 root filesystem for my board.

can you help me :
1. How to layout system memory?
2. how to store u-boot image, Kernel image, root filesystem in flash.

thanks!
