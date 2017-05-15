Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAJav-0004s4-Tq
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 17:15:43 +0000
Date: Mon, 15 May 2017 11:15:19 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, "Herton R. Krzesinski"
 <herton@redhat.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Markus Heiser <markus.heiser@darmarit.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, sayli karnik
 <karniksayli1995@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Mauro
 Carvalho Chehab <mchehab@infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Silvio Fricke
 <silvio.fricke@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/5] Convert more books to ReST
Message-ID: <20170515111519.7bbb449b@lwn.net>
In-Reply-To: <20170515140912.100c9cac@bbrezillon>
References: <cover.1494672881.git.mchehab@s-opensource.com>
 <20170515140912.100c9cac@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 May 2017 14:09:12 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> >   mtd: adjust kernel-docs to avoid Sphinx/kerneldoc warnings  
> 
> Not sure how you plan to merge these changes, but if it goes through
> a single tree I'll probably need an immutable topic branch, because I
> plan to change a few things in nand_base.c nand.h for the next release.

docs-next doesn't rebase, so there shouldn't be trouble there.  But we
could also just separate this patch into two pieces.  I suspect we could
live with a couple of warnings for a period during the 4.13 merge window
without too much pain...

jon
