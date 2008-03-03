Received: from web37912.mail.mud.yahoo.com ([209.191.91.174])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWIhw-0006UA-Gn
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 22:00:28 +0000
Date: Mon, 3 Mar 2008 14:00:24 -0800 (PST)
From: syed khader <sk.syed@yahoo.com>
Subject: mtd for m25p16 on an arm (lpc2468) board
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <967832.18826.qm@web37912.mail.mud.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  Got a
a. lpc2468 arm7 board
b. it has a m25p16 16Mbit serial flash.
   I enabled spi, m25p80 driver in the kernel and I
registered with spi using spi_register_board_info.

  Reading spi_summary tells me further I need to
provide spi master controller interface as well for
this(spi_register_master).
  This is where i need some assistance. How should I
write this for my board? What exactly does transfer
function does?
  Also i dont see m25probe getting called, even after
i registered a dummy spi_register_master)

Thanks
Syed
trumpBox.co.in


      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
