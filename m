Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REiYI-0005n1-A2
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:15:59 +0000
Received: by wwg9 with SMTP id 9so838536wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 07:15:55 -0700 (PDT)
Subject: Re: [PATCH] ubi: Add support for UBI PEB sizes that are a multiple
	of the erase size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Paul Herbert <kevin.herbert@meraki.com>
Date: Fri, 14 Oct 2011 17:15:09 +0300
In-Reply-To: <20111014011436.2E298A1DDB@snowflake>
References: <20111014011436.2E298A1DDB@snowflake>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318601716.12351.137.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-10-13 at 18:14 -0700, Kevin Paul Herbert wrote:
> Add support for UBI PEB sizes that are a multiple of the erase size.
> This allows for portability between UBI volumes on FLASH devices,
> as long as a common multiple of the erase size is used on all FLASH
> devices.
> 
> In order to implement this feature, a new field was added to the
> erase block header, which must be initialized by the ubinize tool.
> This new peb_size field in the ubi_ec_hdr was previously initialized
> as zero, so existing PEBs with this field containing zero are assumed
> to be using a PEB which is equal to the erase size. At attach time,
> the first erase block without errors is scanned for, looking for a
> PEB size field. If this field is non-zero, it is required to be a
> multiple of the erase size, and all subsequent PEBs are required to
> have the same value.
> 
> PEBs are required to be aligned on boundaries that are a multiple
> of the PEB size. This means that in the case of a bad block in NAND,
> rather than skipping to the next block, one must skip to the next
> properly aligned block. All checks for bad blocks now consider
> any bad block in the cluster to make the entire cluster bad.
> Otherwise, it would be impossible to determine boundaries when
> a block became bad.
> 
> Signed-off-by: Kevin Paul Herbert <kph@meraki.net>

Sorry, but why you decided to do this in UBI instead of trying to do
this in MTD level? I think it would require a bit more work mainly
because of strange MTD interface, which would need to be changed, but
that would mean that JFFS2 and other users would benefit.

I really did not think hard about this, but off the top of my head it
looks like you need:

1. Add new MTD interface and introduce stuff like:

mtd_read()
mtd_write()
mtd_mark_bad()
etc

which will just call mtd->read(), etc.

2. Add a new interface: mtd_concat_eraseblocks(2) or you name it, I can
use this function to tell MTD that I want it to make erasblocks to be
double size.

3. Modify mtd_read() etc to handle double erasblock sizes.

Wouldn't this be cleaner?

-- 
Best Regards,
Artem Bityutskiy
