Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NF4zA-0001UU-7N
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 12:04:13 +0000
Date: Mon, 30 Nov 2009 13:03:59 +0100
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses and
	panics
Message-ID: <20091130130359.04b89967@marrow.netinsight.se>
In-Reply-To: <1259582202.19465.388.camel@macbook.infradead.org>
References: <alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org>
	<1259566071.7518.48.camel@localhost>
	<20091130074603.GA30911@logfs.org>
	<1259571118.7518.56.camel@localhost>
	<20091130093541.GA14254@logfs.org>
	<1259574055.7518.80.camel@localhost>
	<20091130105331.1e9e6c08@marrow.netinsight.se>
	<1259580207.19465.379.camel@macbook.infradead.org>
	<20091130123752.39727115@marrow.netinsight.se>
	<1259582202.19465.388.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Nov 2009 11:56:42 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Mon, 2009-11-30 at 12:37 +0100, Simon Kagstrom wrote:
> > I'm a bit worried about taking the lock here - can't we end up with a
> > deadlock if we happen to crash in the wrong place? 
> 
> Um, yes -- just as the existing version can end up with a deadlock if we
> happen to crash while adding or removing a dumper and holding _that_
> lock. Try calling kmsg_dump_unregister(NULL), or putting a dumper in a
> module and then unloading that module without deregistering it, etc.

Well, actually we've thought of that:

	if (!spin_trylock_irqsave(&dump_list_lock, flags)) {
		printk(KERN_ERR "dump_kmsg: dump list lock is held during %s, skipping dump\n",
				kmsg_to_str(reason));
		return;
	}
	list_for_each_entry(dumper, &dump_list, list)
		dumper->dump(dumper, reason, s1, l1, s2, l2);
	spin_unlock_irqrestore(&dump_list_lock, flags);

Anyway, I'm happy with the explanation, so keep the lock in.

// Simon
