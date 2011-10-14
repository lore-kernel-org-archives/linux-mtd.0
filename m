Received: from na3sys009aog119.obsmtp.com ([74.125.149.246])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1REnLb-00034M-Te
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 19:23:13 +0000
Received: by mail-pz0-f44.google.com with SMTP id 4so2065455pzk.3
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 12:23:08 -0700 (PDT)
Subject: Re: [PATCH] ubi: Add support for UBI PEB sizes that are a multiple of
	the erase size
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset=us-ascii
From: Kevin Paul Herbert <kevin.herbert@meraki.net>
In-Reply-To: <1318601716.12351.137.camel@sauron>
Date: Fri, 14 Oct 2011 12:23:02 -0700
Content-Transfer-Encoding: 7bit
Message-Id: <690F2BC3-036A-4E7B-8146-69F31DC2D8C1@meraki.net>
References: <20111014011436.2E298A1DDB@snowflake>
	<1318601716.12351.137.camel@sauron>
To: dedekind1@gmail.com
Cc: Kevin Paul Herbert <kevin.herbert@meraki.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Doing it in MTD is a great suggestion. I'll see what I can come up with.

Kevin

On Oct 14, 2011, at 7:15 AM, Artem Bityutskiy wrote:

> On Thu, 2011-10-13 at 18:14 -0700, Kevin Paul Herbert wrote:
>> Add support for UBI PEB sizes that are a multiple of the erase size.
>> This allows for portability between UBI volumes on FLASH devices,
>> as long as a common multiple of the erase size is used on all FLASH
>> devices.
>> 
>> In order to implement this feature, a new field was added to the
>> erase block header, which must be initialized by the ubinize tool.
>> This new peb_size field in the ubi_ec_hdr was previously initialized
>> as zero, so existing PEBs with this field containing zero are assumed
>> to be using a PEB which is equal to the erase size. At attach time,
>> the first erase block without errors is scanned for, looking for a
>> PEB size field. If this field is non-zero, it is required to be a
>> multiple of the erase size, and all subsequent PEBs are required to
>> have the same value.
>> 
>> PEBs are required to be aligned on boundaries that are a multiple
>> of the PEB size. This means that in the case of a bad block in NAND,
>> rather than skipping to the next block, one must skip to the next
>> properly aligned block. All checks for bad blocks now consider
>> any bad block in the cluster to make the entire cluster bad.
>> Otherwise, it would be impossible to determine boundaries when
>> a block became bad.
>> 
>> Signed-off-by: Kevin Paul Herbert <kph@meraki.net>
> 
> Sorry, but why you decided to do this in UBI instead of trying to do
> this in MTD level? I think it would require a bit more work mainly
> because of strange MTD interface, which would need to be changed, but
> that would mean that JFFS2 and other users would benefit.
> 
> I really did not think hard about this, but off the top of my head it
> looks like you need:
> 
> 1. Add new MTD interface and introduce stuff like:
> 
> mtd_read()
> mtd_write()
> mtd_mark_bad()
> etc
> 
> which will just call mtd->read(), etc.
> 
> 2. Add a new interface: mtd_concat_eraseblocks(2) or you name it, I can
> use this function to tell MTD that I want it to make erasblocks to be
> double size.
> 
> 3. Modify mtd_read() etc to handle double erasblock sizes.
> 
> Wouldn't this be cleaner?
> 
> -- 
> Best Regards,
> Artem Bityutskiy
> 
