Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=ocean.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bq2yh-0006IB-HG
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2004 00:57:17 -0400
Message-ID: <41088381.80702@magellan-technology.com>
Date: Thu, 29 Jul 2004 14:56:33 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: Brock Denson <bdenson@wa-ventures.com>,
	MTD-LIST <linux-mtd@lists.infradead.org>
References: <017e01c473f4$580789c0$6400a8c0@BDENSONLAPTOP>
In-Reply-To: <017e01c473f4$580789c0$6400a8c0@BDENSONLAPTOP>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: uboot-1.1.1 on at91rm9200dk problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use these scripts to reflash my uboot on my AT91RM9200DK:

Uboot> printenv
...
prooff=protect off 10000000 10007fff; protect off 10010000 1002ffff
proon=protect on 10000000 10007fff; protect on 10010000 1002ffff
ubootgz2flash=loadb 20000000; cp.b 20000000 10010000 ffff
bootbin2flash=loadb 20000000; cp.b 20000000 10000000 5fff
eraseuboot=erase 10000000 10007fff; erase 10010000 1002ffff
upgradeuboot=run prooff; run eraseuboot; run bootbin2flash; run ubootgz2flash; 
run proon


* prooff - PROtect OFF - unprotects the section of flash that holds uboot.

* eraseuboot - erases ONLY the uboot sections of the flash. it leaves the 
environment stuff alone. this saves much typing!

* ubootgz2flash - loads the uboot.gz file over the serial port and copies it to 
flash

* bootbin2flash - loads the boot.bin file over the serial port and copies it to 
flash

* proon - PROtect ON - protects the section of flash that holds uboot

* upgradeuboot - runs all the scripts in the correct order!

to reflash:

Uboot> run upgradeuboot
  ... send boot.bin by KERMIT
  ... send u-boot.gz by KERMIT
Uboot> saveenv   (just in case!)
  ... press reset and hope it works.

If it doesn't work, then you have to get those files in there another way. On 
the AT91RM9200DK, I used the CPU's built in bootloader to load an image of 
u-boot into RAM and execute it.

Aras

Brock Denson wrote:
>>I've had to reflash my old version of u-boot (0.3.2) on a few 
>>occasions,
> 
> 
> Can you explain the steps you used to reflash uboot?
> 
> Thanks,
> Brock Denson
> 
