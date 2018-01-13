Received: from mail-yb0-x233.google.com ([2607:f8b0:4002:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eaLD8-0001Lm-9x
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 12:46:59 +0000
Received: by mail-yb0-x233.google.com with SMTP id b132so3885812yba.5
 for <linux-mtd@lists.infradead.org>; Sat, 13 Jan 2018 04:46:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxnEszGhC96=MB+Xmvv02A0A0WLY45Mf_dmWUKg2iKgfA@mail.gmail.com>
References: <CAF4+tmq0km-HXGkmWtHMA_rtzYYtok6W_suTVwgJnz5qPK6ZGw@mail.gmail.com>
 <CAFLxGvxnEszGhC96=MB+Xmvv02A0A0WLY45Mf_dmWUKg2iKgfA@mail.gmail.com>
From: Bogdan Harjoc <harjoc@gmail.com>
Date: Sat, 13 Jan 2018 14:46:45 +0200
Message-ID: <CAF4+tmrYWU-R4YpxHMfrLubNpbXozWqCsWGJeW6HwNZ2C9dffA@mail.gmail.com>
Subject: Re: Handle eraseblocks containing the bad-block table in UBI
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 12, 2018 at 10:52 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Usually blocks containing the BBT are also marked as bad to avoid the
> problem you're facing.
> So, yes UBI should not see these PEBs because they should look like bad blocks.
>
> Is this a kernel with vendor hackery?

It is, at least the nand probing code adds its own nand_bbt_descr
structs. Since the issue goes away by adding an

if (ec_hdr->magic == 'Bbt0' or '1bbT')
   treat_it_as_bad_block()

in ubi_io_read_ec_hdr(), I will see where the bad-block status for the
bbt PEBs gets lost.

Thank you,
Bogdan
