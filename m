Received: from casablanca.magic.fr ([195.154.101.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15C2IT-0002gr-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 17:54:41 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by casablanca.magic.fr (8.9.3/8.9.3) with ESMTP id TAA10913
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 19:00:13 +0200 (CEST)
Message-ID: <3B2E3326.41CDE263@inventel.fr>
Date: Mon, 18 Jun 2001 18:58:14 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Abraham vd Merwe <abraham@2d3d.co.za>,
        Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
References: <3B2E2C7A.F997FDEE@inventel.fr>  <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl> <20010618143104.A3715@crystal.2d3d.co.za> <29895.992882600@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

David Woodhouse a écrit :
> 
> xde@inventel.fr said:
> >  Does it mean that I can not use do_map_probe("cfi", ...) with
> > 28F160B3 chips ?
> 
> ISTR there are some versions of the 28F160 which are CFI-compliant. But if
> you've got the version which isn't, then no, you'll have to implement an
> Intel-specific probe routine for it. You can still hook into the
> cfi_cmdset_0001 back end code to actually _drive_ it though - you only have
> to do a probe routine.
> 
> --
> dwmw2

when using cfi :
clep7211 flash: probing for 2 partitions (buswidth = 4)
clep7211: Found 2 x16 devices at 0x0 in 32-bit mode

when using cfi_intel :
clep7211 flash: probing for 2 partitions (buswidth = 4)
request_module[cfi_intel]: Root fs not
mounted                                                                                                

seems that I have to write a piece of code or simply add a configuration
to amd_flash.c corresponding to that flash.

Xavier
