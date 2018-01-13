Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eaMcG-00044n-Jl
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 14:17:02 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Bogdan Harjoc <harjoc@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Handle eraseblocks containing the bad-block table in UBI
Date: Sat, 13 Jan 2018 15:17:34 +0100
Message-ID: <5069949.lP7kaqOdCT@blindfold>
In-Reply-To: <CAF4+tmpcv-zTJKj++AwRfU=vf3OjhK2_jDvJS-KyNX3mZW_uNg@mail.gmail.com>
References: <CAF4+tmq0km-HXGkmWtHMA_rtzYYtok6W_suTVwgJnz5qPK6ZGw@mail.gmail.com>
 <CAFLxGvxnEszGhC96=MB+Xmvv02A0A0WLY45Mf_dmWUKg2iKgfA@mail.gmail.com>
 <CAF4+tmpcv-zTJKj++AwRfU=vf3OjhK2_jDvJS-KyNX3mZW_uNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Samstag, 13. Januar 2018, 13:44:54 CET schrieb Bogdan Harjoc:
> On Fri, Jan 12, 2018 at 10:52 PM, Richard Weinberger
> 
> <richard.weinberger@gmail.com> wrote:
> > Usually blocks containing the BBT are also marked as bad to avoid the
> > problem you're facing.
> > So, yes UBI should not see these PEBs because they should look like bad
> > blocks.
> > 
> > Is this a kernel with vendor hackery?
> 
> It is, at least the nand probing code adds its own nand_bbt_descr
> structs. Since the issue goes away by adding an
> 
> if (ec_hdr->magic == 'Bbt0' or '1bbT')
>    treat_it_as_bad_block()
> 
> in ubi_io_read_ec_hdr(), I will see where the bad-block status for the
> bbt PEBs gets lost.

UBI is the wrong layer to address this.
Please make sure that these blocks are handled in the NAND core.
BBT_BLOCK_RESERVED is the flag you need for them.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
