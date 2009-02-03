Received: from mail-qy0-f17.google.com ([209.85.221.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUUCe-00049H-EP
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 22:57:15 +0000
Received: by qyk10 with SMTP id 10so3153140qyk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 14:57:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <70F6AAAFDC054F41B9994A9BCD3DF64E085309BC@exch01-aklnz.MARINE.NET.INT>
References: <70F6AAAFDC054F41B9994A9BCD3DF64E085309BC@exch01-aklnz.MARINE.NET.INT>
Date: Tue, 3 Feb 2009 16:57:11 -0600
Message-ID: <782515bb0902031457m58ed45c2yb0045b6fbf4896bd@mail.gmail.com>
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

On Tue, Feb 3, 2009 at 2:04 PM, Reuben Dowle <Reuben.Dowle@navico.com> wrote:
> As far as I can see, the NAND code is assuming that the bad block marker
> is always in the first byte of the oob area in the FIRST page of each
> block.
>
> This is not true for MLC nand from most manufacturers. As far as I can
> tell, only Micron actually place their bad block markers at this
> location in MLC nand.
>
> For other manufacturers, the bad block markers are being placed in the
> first byte of the oob in the LAST page of a bad block. I have seen this
> in the datasheets for NAND from Samsung (eg. K9G8G08UOA) or Numonyx (eg
> NAND08GW3C2B).
>
I thought we can override the defaults by using nand_bbt_descr and
passing it to  nand->badblock_pattern ?
I had a similar question based on
http://lists.infradead.org/pipermail/linux-mtd/2009-January/024138.html
Regards,
Nishanth Menon
