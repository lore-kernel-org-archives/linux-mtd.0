Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d95gy-0003oo-E4
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 08:12:54 +0000
Received: by mail-oi0-x22b.google.com with SMTP id w10so57690172oif.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 May 2017 01:12:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170512053957.10426-1-mrugiero@gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 12 May 2017 10:12:30 +0200
Message-ID: <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mario,

On Fri, May 12, 2017 at 7:39 AM, Mario J. Rugiero <mrugiero@gmail.com> wrote:
> Some chips used under a custom vendor driver can get their blocks
> incorrectly detected as bad blocks, out of incompatibilities
> between such drivers and MTD drivers.
> When there are too many misdetected bad blocks, the device becomes
> unusable because a bad block table can't be allocated, aside from
> all the legitimately good blocks which become unusable under these
> conditions.
> This adds a build option to workaround the issue by enabling the
> user to free up space regardless of what the driver thinks about
> the blocks.

Hmm, this sounds like a gross hack.

> Example usage: recovering NAND chips on sunxi devices, as explained
> here: http://linux-sunxi.org/Mainline_NAND_Howto#Known_issues

What this wiki suggests is not wise.
How can you know which blocks are really bad and which not?

-- 
Thanks,
//richard
