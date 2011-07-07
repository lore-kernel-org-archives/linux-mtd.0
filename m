Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QekOC-0007OX-7A
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 08:56:53 +0000
Received: by pzk28 with SMTP id 28so758117pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 01:56:00 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: fix master node recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Date: Thu, 07 Jul 2011 11:57:04 +0300
In-Reply-To: <20110707104448.7f6f0cea@wker>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
	<1310019990.3149.105.camel@sauron> <20110707094324.24128229@wker>
	<1310025429.3149.133.camel@sauron> <20110707104448.7f6f0cea@wker>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310029028.3149.143.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-07 at 10:44 +0200, Anatolij Gustschin wrote:
> On Thu, 07 Jul 2011 10:57:05 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Thu, 2011-07-07 at 09:43 +0200, Anatolij Gustschin wrote:
> > > Yes, in our case we have 511 valid master nodes + 384 bytes free
> > > space in LEB 2 and one valid master node in LEB 1 + free space.
> > > 
> > > > What we want to check is that there is no room for another master node
> > > > in the second LEB. We have to take offs2, add sz, and make sure that LEB
> > > > size minus that is less than sz, i.e., exactly what you have done.
> > > > 
> > > > And  offs2 + sz >= c->leb_size seems to be completely incorrect and
> > > > should be removed, AFAICS. Can you confirm that?
> > > 
> > > Yes, offs2 + sz >= c->leb_size check is not correct, I think.
> > 
> > I also think so. Could you send v2 of your patch - kill the incorrect
> > check and add your correct check instead.
> 
> Thinking more about this I can imagine the situation where
> off2 + sz == c->leb_size condition is true (depending on LEB size,
> node alignment, etc.), so we should check for this condition also.
> off2 + sz > c->leb_size can't be the case since off2 is the offset
> of a valid node. So we should check for
> off2 + sz == c->leb_size || (c->leb_size - offs2 - sz) < sz.

If offs2 + sz == c->leb_size, then we end up with

0 < sz, which will be true, and everything should be fine, no?

-- 
Best Regards,
Artem Bityutskiy
