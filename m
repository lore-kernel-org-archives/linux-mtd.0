Received: from localhost.localdomain ([127.0.0.1] helo=localhost)
	by baythorne.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DKB3N-0007Gt-Bf
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2005 09:10:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <20050408104826.3ca70fb4.akpm@osdl.org>
References: <20050408170805.GE2292@wohnheim.fh-wedel.de>
	<20050408104826.3ca70fb4.akpm@osdl.org>
Content-Type: text/plain
Message-Id: <1113033620.12012.28.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Sat, 09 Apr 2005 09:08:00 +0100
Content-Transfer-Encoding: 7bit
ReSent-Message-ID: <Pine.LNX.4.58.0504090910470.27926@baythorne.infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] restrict inter_module_* to its last users
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-04-08 at 10:48 -0700, Andrew Morton wrote:
> 
> > Next step for inter_module removal.  This patch makes the code
> >  conditional on its last users and shrinks the kernel binary for the
> >  huge majority of people.
> 
> If we do this, nobody will get around to fixing up the remaining
> users.

Oh, I'll fix them, and I'll be happy to see the back of the
inter_module_crap -- it went in over my objections in the first place.

But I want to deal with all the module / submodule loading crap first.
It all wants attention, and fixing up one deprecation warning alone is
just patching over the cracks.

-- 
dwmw2
