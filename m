Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcgJg-0006CK-KB
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 19:25:17 +0000
Received: by mail-la0-f45.google.com with SMTP id hr17so4723069lab.18
 for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2014 12:24:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140422184518.GC3528@book.gsilab.sittig.org>
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <1398175396-7560-2-git-send-email-grmoore@altera.com>
 <20140422184518.GC3528@book.gsilab.sittig.org>
Date: Tue, 22 Apr 2014 14:17:05 -0500
Message-ID: <CA+iBjpS2UAPk+TiuX7_Ufp6uXwU3nxFZ-8emwGU2TMF9+6q66g@mail.gmail.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
From: Graham Moore <ggrahammoore@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: ZY - marex <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Graham Moore <grmoore@altera.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 Yves Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Insop Song <insop.song@gainspeed.com>, David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 22, 2014 at 1:45 PM, Gerhard Sittig <gsi@denx.de> wrote:
> the patch appears to not have dev_err() references, were they
> removed? see below
[...]
> this emits a message that an error has occured, but doesn't tell
> where it occured -- can you dev_err() here to make the message
> even more helpful?

Yeah, the previous dev_err was actually copy-pasted from a similar
function that already existed.  When I rebased to l2-mtd/spinor, I did
the same copy-paste but that branch has pr_err instead of dev_err.
I'm a noob, so I didn't want to change things without a good
explanation :)  On the other hand, I'm in favor of using dev_err
instead.

[...]
> this logic always returns "timed out" when the ready flag is not
> seen, even in the case of read errors -- can you "preset" the
> error code with "timed out", and update it with something more
> appropriate before returning when other errors are seen?
>
> though this is an internal helper, and callers may not tell the
> situations apart in the first place, so this might be a minor nit

Same here as above, copy-pasted, and so the logic is what already
existed.  I double-checked the calling code, and like you say, the
callers do not tell the situations apart.  About half the calls assume
any error is timeout.  The others either pass return value or some
other error up, or they ignore it.

Thanks,
Graham
