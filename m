Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7Rti-0006Jn-CB
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 04:55:30 +0100
Message-ID: <3F84DBE4.6030602@hectrix.com>
Date: Thu, 09 Oct 2003 11:54:12 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	<3F7CD9CA.5090805@hectrix.com>
	<1065160480.16088.0.camel@imladris.demon.co.uk>
	<3F7D31B7.7020400@hectrix.com>
	<1065171167.22491.53.camel@hades.cambridge.redhat.com>
	<3F83DCED.8090206@hectrix.com>
	<1065607132.22298.88.camel@hades.cambridge.redhat.com>
	<3F83E3E6.3070308@hectrix.com>
	<1065608571.22298.92.camel@hades.cambridge.redhat.com>
In-Reply-To: <1065608571.22298.92.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/08/2003 06:22 PM, David Woodhouse wrote:
>        noatime
>               Access timestamps are not updated when a file is read.
>  
> With atime enabled, every _read_ of a file or directory causes a write
> to the flash, because the 'access timestamp' is updated.
> 
> On flash, this is a Bad Thing(tm).

I now set fstab to mount it with noatime, but it doesn't help the problem.

Besides, I added a printk to each function in nftlcore.c, printing the
name of the function when it is called, eg. "mtdcore: init_mtd". Then in
boot up, I got the followings:

/**** begin ****/
mtdcore: init_mtd
mtdcore: register_mtd_user
NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
DiskOnChip 2000 found at address 0xD4000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba:NAND 16MiB 3,3V)
1 flash chips found. Total DiskOnChip size: 16 MiB
mtdcore: add_mtd_device
mtd: Giving out device 0 to DiskOnChip 2000
NFTL: add_mtd for DiskOnChip 2000
NFTL: UnitSizeFactor 0x00 detected. This violates the spec but we think
we know what it means...
 nftla: nftla1
/**** end ****/

There are only three mtdcore printk messages here: init_mtd,
register_mtd_user and add_mtd_device. Then I cat'd /proc/kmsg and ls'd
/mnt/doc. nftld immediately held all my cpu time, and /proc/kmsg didn't
give me any messages.

Where should I add printk to to get more clues?

Selwyn
