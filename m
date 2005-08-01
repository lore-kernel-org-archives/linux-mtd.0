From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Mon, 1 Aug 2005 15:03:50 +0200
Message-ID: <000001c59699$76528790$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1122899802.8317.106.camel@baythorne.infradead.org>
Cc: 
Subject: Re: Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> You lie -- it didn't say that. It would never say 'xxxx', and 
> the numbers it _did_ print will often give some clue as to 
> what went wrong. Why do you ask for help but not actually 
> give us all the available information?

David,

	the complete messages after "/>mount -t jffs2 /dev/mtdblock5 /mnt"
are :

/>Newly-erased block contained word 0x4c004c at offest 0x00040000
Newly-erased block contained word 0x4c004c at offest 0x00030000


And this is my flash configuration:

  snds100map flash device: 200000 at 1000000
  Search for id:(01 2249) interleave(1) type(2) 
  Found: AMD AM29LV160DB
  Physically mapped flash of SNDS100: Found 1 x16 devices at 0x0 in 16-bit
mode
  number of JEDEC chips: 1
  Creating 6 MTD partitions on "Physically mapped flash of SNDS100":
  0x00000000-0x00010000 : "boot loader (64K)"
  0x00010000-0x00020000 : "boot data (64K)"
  0x00020000-0x000e0000 : "kernel (768K)"
  0x000e0000-0x00100000 : "user data 00 (128K)"
  0x00100000-0x001a0000 : "root fs (512K)"
  0x001a0000-0x00200000 : "user Jffs2 (512K)"

Thanks,

	Massimo.
