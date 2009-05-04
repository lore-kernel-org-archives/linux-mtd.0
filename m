Received: from smtp117.sbc.mail.sp1.yahoo.com ([69.147.64.90])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M15Wb-00083E-8z
	for linux-mtd@lists.infradead.org; Mon, 04 May 2009 21:16:39 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH] RFC: nand: move layout structure into nand_ecc_ctrl
Date: Mon, 4 May 2009 14:16:29 -0700
References: <>
	<1241469762-7255-1-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1241469762-7255-1-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905041416.29292.david-b@pacbell.net>
Cc: Snehaprabha Narnakaje <nsnehaprabha@ti.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 04 May 2009, Troy Kisky wrote:
> This saves lines of code by having nand_base
> calculate oob_free entries.

I *like* the model of letting drivers not do that.
IMO it should at least be an easy option ... so the
NAND drivers don't need to do it, in the not-rare
case that the defaults don't suffice.

I'll see if your patch does things I like later;
gotta read it first!


> It also changes 
> some of the boards oob_free entries, such
> as bf5xx_nand which seems to include the
> bad block marker in the free list.

Compatibility there will be an issue; likely that
part won't fly for existing systems.

 
> Also boards that use 512 byte eccsize groups like
> (I hope only) davinci will have the ecc moved
> to the end of the oob and have a longer free list.

What I'd like to see is that the *default* be as you
suggest:  all the ECC bytes at the end of the OOB.
Let boards override it if they need to, though.

A related issue is that "struct nand_ecclayout" has
some severe weaknesses ... one way to cope with it
would be to just not need that struct at all.
See below.

(And then there's the issue that with ECC_HW_SYNDROME
nothing ensures the nand_ecclayout struct matches
the prepad/postpad/... values which actually get used
during page read/write.)

 
> This davinci changes is the reason I want this patch.
> But, as it is a dangerous patch, it will need lots
> of Acks.
> 
> This patch also makes a future 4 bit software ecc
> easier.

For folk on the MTD list who aren't thinking about it,
let me highlight a few points with respect to DaVinci
4-bit ECC hardware.  Two numbers to remember:  10 bytes
of ECC data, every 512 bytes of data.

 - 2K pages ... current stack can cope, painfully,
   although ECC_HW_SYNDROME will clobber bad block
   markers and ECC_HW isn't appropriate.  Ergo the
   work to come up with a new ECC_HW_something.

 - 4K pages ... current stack CAN NOT COPE since
   nand_ecclayout.eccpos[] is 64 bytes but there
   will be 80 bytes ECC to store. (!!)

If nand_ecclayout were not used, it would be easy
to write code that knows those 80 bytes go at the
end of the 128 bytes of OOB.  (Or 40 at the end
of 64 bytes OOB, for 2K pages.)

- Dave
