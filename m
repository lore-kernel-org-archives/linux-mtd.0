Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WRUH-0001aE-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 00:51:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200108131925.PAA19680@stone.tmok.com> 
References: <200108131925.PAA19680@stone.tmok.com> 
To: pla <pla@tmok.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 erase size of 16k? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 00:56:16 +0100
Message-ID: <17674.997746976@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

pla@tmok.com said:
>  Ah!  Now I see how this all fits together.  Many thanks, and I will
> certainly write up my experiences for the HowTo.  Incidentally, for
> anyone else trying this, it would serve them well to back up the bad
> blocks section of their DOC before doing *anything*.  I seem to have
> killed my DOC by overwriting it, without a backup (fortunately, I can
> just get another from work, but not everyone has that luxury).

I don't believe it's possible to really kill the hardware. Just unwise to 
lose the factory-programmed information about bad sectors. We could fix 
nftl_format to preserve that information, and probably should do so quite 
soon.

What failure mode are you seeing with it now?

--
dwmw2
