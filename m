Received: from tiku.hut.fi ([130.233.228.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jG0S-0000CJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 09:13:24 +0100
Date: Tue, 18 Sep 2001 11:19:27 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Cc: Kugan <kugan@mediasolv.com>
Subject: Re: jffs & amd_flash.c
Message-ID: <20010918111926.A22357@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000e01c13f27$2f029f60$941373cb@mediasolv.com>; from kugan@mediasolv.com on Sun, Sep 16, 2001 at 08:16:38PM -0700
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

> have ATMEL AT491604 90 TC flash.  I have partitioned the flash with pnc2000.
> after mounting the jffs when i try to create a file on the partitione it is
> going into this function and adding the task to waiq and calling and

I am using happily the amd_flash.c driver with AMD 64mbit non-CFI
flash chip.  I haven't experienced this problem.  I am using 
arm-linux kernel, which is based on Alan Cox's 2.4.8-ac8.

Your problem seems not to be failing erase or programming, or is it?
Surely the debugging message would nag about timeout errors?

There were problems in sector erase and word writing code in amd_flash.c. 
The problem was that the operation status query was not made form the 
same bank and sector as being erased or written into. This was an issue 
only with chips supporting simultaneous read & write on separate banks.
I've committed a fixes for these problems into CVS.

The Amd driver works nicely for me and I although I had initially
hardware configuration related speed problems they have been now
resolved. Using the command

  dd if=/dev/zero of=/dev/mtd0 bs=1k

to test the writing speed, I get an average speed of 24 us / word.
The chip datasheet claims 12 us typical. My initial writing speed
was 210 us/word until I found out the proper hardware configuration.

Jarkko Lavinen
