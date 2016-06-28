Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHt8B-0007Hp-D6
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 13:32:48 +0000
Subject: Re: [PATCH v2] UBI: only read necessary size when reading the VID
 header
To: dedekind1@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org
References: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
 <1467118829.2456.40.camel@gmail.com>
Cc: boris.brezillon@free-electrons.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <57727C65.8060100@nod.at>
Date: Tue, 28 Jun 2016 15:32:21 +0200
MIME-Version: 1.0
In-Reply-To: <1467118829.2456.40.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.06.2016 um 15:00 schrieb Artem Bityutskiy:
> On Tue, 2016-06-28 at 13:51 +0200, Sascha Hauer wrote:
>> When reading the vid hdr from the device UBI always reads a whole
>> page. Instead, read only the data we actually need and speed up
>> attachment of UBI devices by potentially making use of reading
>> subpages if the NAND driver supports it.
>>
>> Since the VID header may be at offset vid_hdr_shift in the page and
>> we can only read from the beginning of a page we have to add that
>> offset to the read size.
>>
>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>> ---
>>
>> change since v1:
>> - properly handle vid_hdr_shift != 0
>>
>>  drivers/mtd/ubi/io.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
>> index 10cf3b5..ff8cafe 100644
>> --- a/drivers/mtd/ubi/io.c
>> +++ b/drivers/mtd/ubi/io.c
>> @@ -1019,7 +1019,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi,
>> int pnum,
>>  
>>  	p = (char *)vid_hdr - ubi->vid_hdr_shift;
>>  	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
>> -			  ubi->vid_hdr_alsize);
>> +			  ubi->vid_hdr_shift + UBI_VID_HDR_SIZE);
> 
> There are pages and subpages underneath. Let me use old sizes. Say,
> 2KiB pages, and 512KiB subpages.
> 
> If the VID header is in the first subpage, the MTD level probably needs
> to read the entire subpage anyway, because of per-subpage ECC. This is
> why we give it a buffer of subpage size.
> 
> Now if you give it a buffer of smaller size, say, 256 bytes, MTD will
> have to read the subpage into its own buffer first, validate ECC, then
> copy 256 bytes from the internal buffer to your buffer. Compare this
> with MTD copying data directly to your buffer.
> 
> This was the original idea, and there was measurable difference on real
> setups. So this is actually a read speed optimization for those old
> setups.
> 
> Therefore, unless I misunderstood this patch - it introduces a
> regression to those old setups at least (forces MTD to use an
> intermediate buffer rather than copy data from NAND directly to the
> buffer supplied by UBI)
> 
> Now, one can argue this depends on how the underlying MTD driver works,
> this is true. One may argue that UBI should not make assumptions about
> the aspects of the MTD level like that - true as well. But that would
> need a bit better fix then.
> 
> I am inclined to Nack, but I feel like I may miss something, so just
> letting you know instead.

Artem,

you raise an interesting point.
So, we need to analyze this more before it can be merged.

Thanks,
//richard
