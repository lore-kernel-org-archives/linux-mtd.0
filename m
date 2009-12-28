Message-ID: <4B3884AF.1020204@nokia.com>
Date: Mon, 28 Dec 2009 12:13:03 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: twebb <taliaferro62@gmail.com>
Subject: Re: confusion UBI overhead and volume size calculations
References: <dbdb2ea60912210757q22ee209fi24363e9f236c3597@mail.gmail.com>
In-Reply-To: <dbdb2ea60912210757q22ee209fi24363e9f236c3597@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

twebb wrote:
> I'm very confused about the calculations for determining max-leb-cnt
> argument for mkfs.ubifs and vol_size for ubinize cfg file.
> 
> I have a 4GiB MLC nand device that has a 64M reserved area from
> 0x0-0x04000000.  The rest, 0x04000000-0x100000000 (4032M), is
> dedicated to a single MTD partition.  A single UBI device will attach
> to the single MTD partition and have 4 volumes.  I'm using mkfs.ubifs
> and ubinize at build time to create a single UBI image to be flashed
> to the MTD device.
> 
> The four volumes are...
> vol1 = 352M
> vol2 = 352M
> vol3 = 352M
> vol4 = 2976M
> 
> The device data sheet specifies that the minimum valid block count is
> 7992 (of 8192 possible), so it seems like I should reserve 200 blocks
> (100M) to allow for this.
> 
> My questions are:
> 1.  How does the 100M reserved for "potentially bad blocks" get
> handled when calculating the vol_size for each volume in the .cfg
> file?  I'd like to leave vol1-3 intact and only take space from vol4.
> Would the vol_sizes be as follows?
> 
> vol1 vol_size = 352M
> vol2 vol_size = 352M
> vol3 vol_size = 352M
> vol4 vol_size = 2976M-100M = 2876M
> 
> 

You must tell UBI that you want the last volume automatically resized
to fit the available space.

This is covered in the documentation:

http://linux-mtd.infradead.org/doc/ubi.html#L_autoresize


> 2.  How is the overhead calculation from the linux-mtd site used in
> determining the vol_sizes?  ("The UBI overhead is (B + 4) * SP + O *
> (P - B - 4) i.e., this amount of bytes will not be accessible for
> users.")
> 
> 3.  Is max-leb-cnt simple the vol_size/LEB_size?

max-leb-cnt stands for maximum LEB count.  It is the maximum number of
LEBs that UBIFS will use.  It must be more than the number of LEBs you
will ever have.  So the number of PEBs is a reasonable choice, although
it also makes sense to round up to a power of 2.  For example:

352M => 704 PEBS @ 512K / PEB => max_leb_cnt=1024 is a good choice

2976M => 5952 PEBS @ 512K / PEB => max_leb_cnt=8192 is a good choice


There is some documentation here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt
