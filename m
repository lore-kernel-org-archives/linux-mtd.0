Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DeDBU-0001YX-QF
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 10:30:08 -0400
Date: Fri, 3 Jun 2005 16:29:30 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Clemens Koller <clemens.koller@anagramm.de>
Message-ID: <20050603142930.GB18748@wohnheim.fh-wedel.de>
References: <42A05775.3010102@anagramm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42A05775.3010102@anagramm.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD for FPGA framegrabber
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 June 2005 15:13:25 +0200, Clemens Koller wrote:
> 
> Then I tried to start the MTD stuff:
> # modprobe mtdchar
> 	loads mtdcore also... okay!
> # modprobe map_rom
> 	loads chipreg also... okay!

Bullshit!

> # modprobe physmap
> 	probes my SRAM area via map_rom and adds mtd_to mtdcore, so I get
> 	two devices: /dev/mtd/0 and /dev/mtd/0ro

Bullshit!

Since you want to access sram, you want to create a standalone mtd
driver, similar to phram.  As a starter, you can simply use phram and
switch from memcpy() to dma later.

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
