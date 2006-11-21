Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gmeg8-0007WQ-UP
	for linux-mtd@lists.infradead.org; Tue, 21 Nov 2006 18:05:29 -0500
Received: by ug-out-1314.google.com with SMTP id m2so15728uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Nov 2006 15:05:22 -0800 (PST)
Message-ID: <79ac09b60611211505h6682e31ay46ecc5b8fe160b0@mail.gmail.com>
Date: Tue, 21 Nov 2006 17:05:21 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd_debug usage
In-Reply-To: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60611210826j33b6b2aeh95d9259ddd3f0481@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've added a few comments and results below:

On 11/21/06, Duke <ezbonites@gmail.com> wrote:
> Hi All,
> I'm having a bit of trouble understanding the usage to mtd_debug.
>
> With the usage format below, why would I need <offset> and <len> if
> the mtdblock sizes are already known? (i.e at boot)
> I always thought if I write "mtd_debug erase /dev/mtdblock2" it will
> erase the entire /dev/mtdblock2 device. not so?
> If not, do I specify "mtd_debug erase /dev/mtdblock2 0x0 0x600000" for
> mtdblock2 where 0x0 indicated the start of the block?
>
> When I do a write "mtd_debug write /dev/mtdblock2 0x0 0x600000 myfs.cramfs"
> would it do just this?
>
> I've seen usage where /dev/mtd2 is used instead of /dev/mtdblock2,
> what is the difference here? which should it be. It seems to me that
> /dev/mtd2 simply gives the node info (mtd_debug info )and
> /dev/mtdblock2 is really what you want to used. Do I have this
> correct?
>
> usage: mtd_debug info <device>
>        mtd_debug read <device> <offset> <len> <dest-filename>
>        mtd_debug write <device> <offset> <len> <source-filename>
>        mtd_debug erase <device> <offset> <len>
>

cfi_cmdset_0001: Erase suspend on write enabled
3 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 3 MTD partitions on "physmap-flash.0":
0x00000000-0x00040000 : "boot"
0x00040000-0x00200000 : "kernel"
0x00200000-0x00800000 : "cramfs"

When I ran mtd_debug I get the following from the above mapping:

# mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 1835008 (1M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

# mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 262144 (256K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

# mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 262144 (256K)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

# mtd_debug info /dev/mtd3
mtd.type = MTD_NORFLASH
mtd.flags =
mtd.size = 1835008 (1M)
mtd.erasesize = 262144 (256K)
mtd.oobblock = 1
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

# mtd_debug erase /dev/mtdblock2 0 0x600000
MEMERASE: Inappropriate ioctl for device
# mtd_debug erase /dev/mtd2 0 0x600000
Erased 6291456 bytes from address 0x00000000 in flash
# mtd_debug write /dev/mtd2 0 0x600000 myfs_cramfs
file_to_flash: fread, size 0x600000, n 0x600000
fread(): Success

However, I expected mtd3 to show no info, but it did.
Even though it said a successful write, it did not as I could not
mount from that partition.

Clearly I'm missing something here. Could someone help me understand this?

much thanks
