Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ea6Ja-0001vx-Ue
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 20:52:40 +0000
Received: by mail-wr0-x230.google.com with SMTP id s13so6353061wra.10
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2018 12:52:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAF4+tmq0km-HXGkmWtHMA_rtzYYtok6W_suTVwgJnz5qPK6ZGw@mail.gmail.com>
References: <CAF4+tmq0km-HXGkmWtHMA_rtzYYtok6W_suTVwgJnz5qPK6ZGw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 12 Jan 2018 21:52:25 +0100
Message-ID: <CAFLxGvxnEszGhC96=MB+Xmvv02A0A0WLY45Mf_dmWUKg2iKgfA@mail.gmail.com>
Subject: Re: Handle eraseblocks containing the bad-block table in UBI
To: Bogdan Harjoc <harjoc@gmail.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bogdan,

On Fri, Jan 12, 2018 at 4:48 PM, Bogdan Harjoc <harjoc@gmail.com> wrote:
> With some Macronix NANDs that present the bad-blocks table at a fixed
> eraseblock, UBI tries to use the PEB as data and this results in the
> "Bad node, ff ff ff ..." symptoms.
>
> Should UBI receive this special status of the bbt PEBs via the
> mtd_isbad() result values (in the Macronix case, mtd_block_isbad()
> returns false for the PEB containing the bbt), or are 'bbt PEBs' not
> supported in UBI ?

Usually blocks containing the BBT are also marked as bad to avoid the
problem you're facing.
So, yes UBI should not see these PEBs because they should look like bad blocks.

Is this a kernel with vendor hackery?

-- 
Thanks,
//richard
