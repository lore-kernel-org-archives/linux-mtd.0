Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T2OU-0007Z0-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 14:59:26 +0000
Received: from gad ([10.10.11.10]) by sphere.barak.net.il
          (InterMail vK.4.03.00.00 201-232-121 license 5444ddd44659357c6c93343e0ce38507)
          with SMTP id <20020122150832.IOUE2403.sphere@gad>
          for <linux-mtd@lists.infradead.org>;
          Tue, 22 Jan 2002 17:08:32 +0200
Message-ID: <173a01c1a356$e3ed01c0$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Subject: BSE MediaEngine - booting from flash problems
Date: Tue, 22 Jan 2002 17:10:02 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

i'm using mediaEngine with bank0 of 4 mb, and bank 1 of 16 mb flash.
kernel: 2.4.17-rmk2-bse patch to support mediaEngine.
but when the kernel boots(nfs boot), i see it recognizes only the
first flash bank.
what shall i do in order to recognize also the second ?
(i tried to alter sa1100-flash.c partitions but no use.)

Gad
