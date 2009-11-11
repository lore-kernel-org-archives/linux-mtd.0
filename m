Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8BMF-00028k-Kg
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 11:27:32 +0000
Date: Wed, 11 Nov 2009 12:27:21 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH v13 4/4]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20091111122721.72a9dcea@marrow.netinsight.se>
In-Reply-To: <1257935382.21596.1007.camel@localhost>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091029133535.2ea65f72@marrow.netinsight.se>
	<20091029134123.348b5126@marrow.netinsight.se>
	<1257233392.21596.48.camel@localhost>
	<20091103141903.23d0d0be@marrow.netinsight.se>
	<1257869493.21596.809.camel@localhost>
	<20091111104615.2ea67205@marrow.netinsight.se>
	<1257935382.21596.1007.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 Nov 2009 12:29:42 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Wed, 2009-11-11 at 10:46 +0100, Simon Kagstrom wrote:
> > On Tue, 10 Nov 2009 18:11:33 +0200
> > 
> > > Do we really need this notifiers? Would not it be better to open mtd
> > > device straight in the module_init function instead?
> > 
> > If the mtdoops driver is built into the kernel, module_init might be
> > (and I believe will be) called before the MTD partitions have been
> > created. With the MTD notifiers, this problem is worked around.
> 
> But this is why we have late_initcall(), which we can use instead of
> module_init().

OK, makes sense (you learn something new every day!). But I still have
one, perhaps artificial, use-case for keeping it as-is: MTD devices
might show up later if they are loaded as modules. In my case I use
phram as a module, and if I were to use that with MTDoops in the
kernel, I still need the notifiers.

But loading mtdoops after phram would also work obviously.

// Simon
