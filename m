Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QekWo-0008Dd-BH
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 09:05:46 +0000
Date: Thu, 7 Jul 2011 11:05:46 +0200
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBIFS: fix master node recovery
Message-ID: <20110707110546.4da5396e@wker>
In-Reply-To: <1310029028.3149.143.camel@sauron>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
	<1310019990.3149.105.camel@sauron> <20110707094324.24128229@wker>
	<1310025429.3149.133.camel@sauron> <20110707104448.7f6f0cea@wker>
	<1310029028.3149.143.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 07 Jul 2011 11:57:04 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:
...
> > Thinking more about this I can imagine the situation where
> > off2 + sz == c->leb_size condition is true (depending on LEB size,
> > node alignment, etc.), so we should check for this condition also.
> > off2 + sz > c->leb_size can't be the case since off2 is the offset
> > of a valid node. So we should check for
> > off2 + sz == c->leb_size || (c->leb_size - offs2 - sz) < sz.
> 
> If offs2 + sz == c->leb_size, then we end up with
> 
> 0 < sz, which will be true, and everything should be fine, no?

Yes, you are right, I didn't though about this.

Thanks,
Anatolij
