Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deWeb-0006Xi-Vn
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 01:16:23 +0000
Received: by mail-pg0-x244.google.com with SMTP id 123so7299320pga.5
 for <linux-mtd@lists.infradead.org>; Sun, 06 Aug 2017 18:16:00 -0700 (PDT)
Date: Sun, 6 Aug 2017 18:15:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PULL v2] mtd: nand: Fixes for 4.13-rc4
Message-ID: <20170807011552.GA102997@google.com>
References: <20170802103307.42e69d38@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170802103307.42e69d38@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 02, 2017 at 10:33:07AM +0200, Boris Brezillon wrote:
> Hi Brian,
> 
> Sending a v2 of this PR because I forgot to add the Fixes and CC-stable
> tags on Miquel's patch.
> 
> This PR contains a few fixes for 4.13. Some of them are fixing
> long standing bugs which no one ever complained about (like the small
> page OOB layout fix) or theoretical ones (like the div-by-zero in the
> sunxi driver), but others are fixing real bugs introduced in 4.13
> (all atmel related bugs have been discovered recently and should
> ideally be fixed before 4.13 is released).
> 
> As usual, let me know if there's something wrong in this PR. If not, can
> you do your best to get these sent to Linus before the end of the week?

I'm not sure if I've satisfied the last part, but otherwise...pulled.

BTW, you've double-tagged your sign-off on a few of these, probably
because you wrote them yourself, then still used an automated 'apply +
sign off' script. Not a big deal.

Brian
