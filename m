Received: from host-84-9-202-225.bulldogdsl.com ([84.9.202.225]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIpaU-0006Yc-GO
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2006 11:08:11 -0500
Date: Mon, 13 Mar 2006 15:41:29 +0000
From: Ben Dooks <ben-linux@fluff.org>
To: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
Message-ID: <20060313154129.GA7957@home.fluff.org>
References: <38F58D7B92CB20438DF49D28B572CC6F23BBEA@budgw09a.ww300.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38F58D7B92CB20438DF49D28B572CC6F23BBEA@budgw09a.ww300.siemens.net>
Sender: Ben Dooks <ben@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SMC+vivi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 13, 2006 at 04:24:56PM +0100, Selmeci, Tamas wrote:
> Hello!
> 
> Is anybody here who has some experience with SmartMedia Cards and Vivi?
> (Especially on S3C2410?)

Do you have the following:

1) The S3C2410 NAND driver compiled into the kernel
2) Your board code adding the platform device for the NAND

> My boot device is a 64MB SMC. This is partitioned with Vivi, which is
> also the boot manager. These are the partitions:
> 1. Vivi program code
> 2. Vivi data
> 3. Kernel image
> 4. Root FS
> 
> Data is downloaded to the card via the developer board, using it's
> specific download tool. 
> 
> Everything is OK until the point where I want to mount root fs. It seems
> that the SMC is partitioned in the standard MTD-manner, but currently I
> can't make my kernel mount the rootfs.I don't know if I have to enable
> NFTL and FTL in 2.6.15-5 kernel in order to be able to mount the root fs
> located on SMC. Currently they're enabled, but during the boot, the
> kernel displays no message at all about MTD devices - I think it should,
> because SMC is an MTD too... That's why the given kernel root parameters
> (root=/dev/mtdblock/3, mtdblock3) are all useless.
> 
> What should I do? Does anybody has any idea?
> 
> Regards:
> --
> Tamas Selmeci
> Siemens PSE HU
> Tel.:    +36-1-471-3861
> Email:   tamas.selmeci@siemens.com
> Address: H-1143 Budapest, Gizella ut 51-59 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
