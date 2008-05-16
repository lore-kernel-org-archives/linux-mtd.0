Received: from mail06.syd.optusnet.com.au ([211.29.132.187])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwpnQ-00082J-1w
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 02:35:48 +0000
Subject: Re: New thread [BUG] JFFS2 usage of write_begin and write_end
	functions causes kernel panic
From: James <jamessteward@optusnet.com.au>
To: Jason Liu <liu.h.jason@gmail.com>
In-Reply-To: <e8775dd00805150201t12448ec5x452425039abc18de@mail.gmail.com>
References: <1210312276.28139.19.camel@Ubuntu-Desktop>
	<1210320731.25560.1193.camel@pmac.infradead.org>
	<1210545077.6235.10.camel@Ubuntu-Desktop>
	<1210545663.2861.1.camel@shinybook.infradead.org>
	<1210550476.6235.30.camel@Ubuntu-Desktop>
	<1210562680.6235.55.camel@Ubuntu-Desktop>
	<1210747104.6158.41.camel@Ubuntu-Desktop>
	<e8775dd00805150201t12448ec5x452425039abc18de@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 16 May 2008 12:35:33 +1000
Message-Id: <1210905333.6100.72.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-15 at 17:01 +0800, Jason Liu wrote:
> Maybe, you need pay attention to the BBM

Not knowing offhand what "BBM" is, I'm guess it is bad block management?
I only see reference to this in the onenand driver.

I've now cross compiled the mtd-utils, as I couldn't get the Debian ARM
package for the same to run on my AT91SAM9263-EK board.  I have 2
partitions, the first starting at 0x100000 and finishing 504 blocks
later, i.e. 128kB * 504 = 63MB, 1MB is reserved at the beginning for
U-boot and it's env.  There were no bad blocks detected on the device as
it was shipped from the factory.

Running an ext3 fs on a USB stick as the RFS with noatime and nodiratime
options, I can test the NAND interface.

So I tried this...

root@at91sam9263ek:~/mtd-tools$ ./flash_eraseall  /dev/mtd0 0 504
Erasing 128 Kibyte @ 3ee0000 -- 99 % complete.
root@at91sam9263ek:~/mtd-tools$ ./nandtest -p 5 -o 0 /dev/mtd0
ECC corrections: 0
ECC failures   : 3
Bad blocks     : 0
BBT blocks     : 0
00000000: reading... 
ECC failed at 00000000
00000000: checking...
compare failed. seed 1804289383
Byte 0x7c40 is 0c should be ff
Byte 0xa58f is 0c should be ff
Byte 0xd010 is 55 should be 83
Byte 0xd011 is 38 should be fb
Byte 0xd050 is 12 should be a8
Byte 0xd051 is 74 should be 90
Byte 0xd090 is c8 should be 89
Byte 0xd091 is 86 should be c9
Byte 0xd0d0 is 41 should be 48
Byte 0xd0d1 is b3 should be c3
Byte 0xd110 is c3 should be 09
Byte 0xd111 is d1 should be 73

Hmm.  This does not look good to me.  Does this indicate a hardware or
software problem?  Or did I misuse the tools?  What tests should/could I
perform?

Regards,
James.
