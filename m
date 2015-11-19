Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzYA0-0001Ne-3S
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 22:58:36 +0000
Received: by padhx2 with SMTP id hx2so94930025pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 14:58:14 -0800 (PST)
Date: Thu, 19 Nov 2015 14:58:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Check the return value from read_sr()
Message-ID: <20151119225811.GL64635@google.com>
References: <1447771824-9147-1-git-send-email-fabio.estevam@freescale.com>
 <20151119215443.GK64635@google.com>
 <CAOMZO5ADJSW446A20wO+Hv-oY9vXjtP3nG0v6hBnAA=FT_-OqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5ADJSW446A20wO+Hv-oY9vXjtP3nG0v6hBnAA=FT_-OqA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 08:48:23PM -0200, Fabio Estevam wrote:
> On Thu, Nov 19, 2015 at 7:54 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> 
> > Hmm, by changing status_old from u8 to int, do we propagate any
> > sign-extension issues in this function? What if BIT(7) is set? If I
> 
> If the value returned by read_sr() has BIT(7) set then it is not an
> error, right?
> 
> read_sr() can return negative on error and u8 on success.
> 
> Not sure I understand your concern.

I guess my comment was based on my misplaced uncertainty on whether u8
would sign-extend or zero-extend when converted to int. It appears the
standard says that unsigned values get zero-extended. i.e.:

	u8 val = BIT(7); // 0x80

gets zero-extended to:

	return val; // that is, 0x00000080, not 0xffffff80

If we stick with u8, then it doesn't really matter which one it is.

The only remaining concern is over the mild awkwardness of comparing and
manipulating status_old and status_new, where one is int and the other
is u8. But I guess there are no issues yet, AFAICT.

Brian
