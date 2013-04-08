Received: from mail-oa0-f51.google.com ([209.85.219.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UP6PU-0000oZ-DG
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2013 07:22:36 +0000
Received: by mail-oa0-f51.google.com with SMTP id g12so5865650oah.10
 for <linux-mtd@lists.infradead.org>; Mon, 08 Apr 2013 00:22:35 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 Apr 2013 12:52:35 +0530
Message-ID: <CAGhJ=78a7PYnr8J6hAXFXMywV9FGtburc2r-LaJv8d44yxFT6A@mail.gmail.com>
Subject: Need to add MTD partition support for SPI NOR flash in Uboot
From: Abhijit Lamsoge <avlamsox@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I need to make the partitions available on my SPI NOR flash(m25p80),
as MTD devices, in uboot itself.
So that i can see them using the command "mtdparts" in uboot.
If this possible and have a patch or so, then it would be very
helpful, otherwise any suggestions on how to do this are welcome .
I am using uboot version, that comes along with TI SDK for Beagle
boards.(sitara-board-port-uboot).
I tried by adding MTD options in the respective config file, the
command "mtdparts" is then available, but, it gives me an error of
"mtdids not found".


Abhijit
