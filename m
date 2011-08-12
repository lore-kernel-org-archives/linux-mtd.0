Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qrtdg-0003Ky-1T
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 15:27:12 +0000
Message-ID: <4E454645.7060802@parrot.com>
Date: Fri, 12 Aug 2011 17:27:01 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Nataraj S Narayan <nataraj@vaaraahi.com>
Subject: Re: Ubifs issues on Samsung Nand versus Micron
References: <4E458415.7040005@vaaraahi.com>
In-Reply-To: <4E458415.7040005@vaaraahi.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nataraj S Narayan a écrit :
> Hi
> 
> Using Samsung Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
> 3,3V 8-bit), on at91sam9263 board, with Arm-linux.
> 
> Getting the following errors intermittently:-
> 
> 
> UBI error: ubi_io_read: error -74 (ECC error) while reading 129024 bytes
> from PEB 517:2048, read 129024 bytes
> usb 1-1: new full speed USB device number 2 using at91_ohci
> UBIFS: recovery needed
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> uncorrectable error :
> UBI error: ubi_io_read: error -74 (ECC error) while reading 106496 bytes
> from PEB 782:2048, read 106496 bytes
> UBIFS error (pid 1): ubifs_recover_leb: LEB 225 scanning failed
> VFS: Cannot open root device "ubi0:root" or unknown-block(0,0)
> ~
> 
> 
> Same issue when on kernel 2.6.30 and also on "commit
> d6c9836c1114242aa89ea228bb1c43c17752b76c" of  ubifs-2.6.
> 
> I don't have the said problem with Mircon Nand.
> 
> Please help to find a solution to this issue. Is it the nand driver
> which is the culprit?
> 
Are you sure your timming are correct ?

Try to see if you reproduce the problem with slower timming.


Matthieu
