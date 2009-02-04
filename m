Received: from mail-qy0-f17.google.com ([209.85.221.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUWzD-0000ql-MX
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 01:55:34 +0000
Received: by qyk10 with SMTP id 10so3249208qyk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 17:55:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <70F6AAAFDC054F41B9994A9BCD3DF64E08611D43@exch01-aklnz.MARINE.NET.INT>
References: <70F6AAAFDC054F41B9994A9BCD3DF64E085309BC@exch01-aklnz.MARINE.NET.INT>
	<782515bb0902031457m58ed45c2yb0045b6fbf4896bd@mail.gmail.com>
	<70F6AAAFDC054F41B9994A9BCD3DF64E08611D43@exch01-aklnz.MARINE.NET.INT>
Date: Tue, 3 Feb 2009 19:55:31 -0600
Message-ID: <782515bb0902031755w5ba61d68i7b2035ca8880593e@mail.gmail.com>
Subject: Re: Bad blocks in MLC NAND
From: Nishanth Menon <menon.nishanth@gmail.com>
To: Reuben Dowle <Reuben.Dowle@navico.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 3, 2009 at 6:15 PM, Reuben Dowle <Reuben.Dowle@navico.com> wrote:
>> I thought we can override the defaults by using nand_bbt_descr and
> passing it to  nand->badblock_pattern ?
>> I had a similar question based on
>>
> http://lists.infradead.org/pipermail/linux-mtd/2009-January/024138.html
>
> This is not related to the 8x/16x interface differences, rather it is
> the difference between BB handling of SLC and (most) MLC nand devices.
>
> The nand_bbt_descr struction contains information on the location of the
> bad block marker within a given page, not which page inside a block
> contains the bad block marker.
>
> Also, this structure is not used by the nand_block_bad function in
> nand_base.c anyway. It would be possible for a driver to override the
> nand_chip -> block_bad function to re-impliment nand_block_bad, however
> I don't think this should happen at the nand driver level.
>
> Supporting the majority of MLC nand should be something that the nand
> layer should do as standard.

True.. Hmm..
create_bbt: (bd->options & NAND_BBT_SCANALLPAGES) might help as a work
around, since we ignore the bb marker on every page anyways.. but,
that is not too good performance wise..

just random thought if  nand_bbt_descr could encompass the bbt page
offset and num pages to check? We could handle all kind of devices in
such a case..

Regards,
Nishanth Menon
