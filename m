Received: from web36708.mail.mud.yahoo.com ([209.191.85.42])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jyzdm-00036k-ED
	for linux-mtd@lists.infradead.org; Thu, 22 May 2008 01:30:46 +0000
Date: Wed, 21 May 2008 18:30:44 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080521084144.GA20195@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <612512.56176.qm@web36708.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> So here is a lightly modified version of your mtd_request bits.  Apart
> from reformatting and adding some documentation, the changes are:
> 
> - No flag for MTD_DATA, as this should be the default

# Nope. What about the case where you only want to read the oob (block scan) or
have no data to transfer (block invalidate)? Of course, this "flags" field may
be omitted outright, and the drivers could rely on error returned from
mtd_get_buf/mtd_get_oob, but this may turn out awkward.

> 
> enum mtd_command {
> 	MTD_READ,
> 	MTD_WRITE,
> 	MTD_ERASE,
> 	MTD_COPY,
> 	MTD_INVALIDATE
> };
> 
> /**
>  * @block_no:	physical eraseblock number
>  * @block_ofs:	offset within physical eraseblock
>  */
> struct mtd_address {
> 	u32	block_no;
> 	u32	block_ofs;
> };
> 
> #define MTD_FLAG_OOB	0x01
> /**
>  * @mtd:	underlying memory technology device
>  * @command:	read, write, erase, etc.
>  * @flags:	additional flags to modify commands
>  * @dst:	destination address
>  * @len:	length for read/write
>  * @src:	source address - only used for MTD_COPY
>  */
> struct mtd_request {
> 	struct mtd_device  *mtd;
> 	enum mtd_command   command;
> 	int		   flags;
>

        u32                log_block;

	struct mtd_address dst;

> 	u32		   len;

 	struct mtd_address src;
> };
> 

# You have to retain logical block address when using FTLs. This also makes
"struct mtd_address" confusing - the offset applies the same both to physical
and logical block. User level driver may want to fill in only logical block
address + offset, FTL will put in the actual physical block.

# And it's not clear to me why would you need pointer to data in the request
struct. Data is delivered through the additional (quite often more than one)
call to mtd_get_buf. I think, it's imperative to support fragmented buffers -
block device often submits requests that are larger than eraseblock (can be
read/written in one go) but fragmented across several memory buffers.


By the way, my bias toward block device emulation is caused by the obvious fact
that overwhelming majority of flash devices in existence are used as such, and
not without much success (I don't see many people complaining about their usb
sticks and mmc cards, and those may run linux inside one day).



      
