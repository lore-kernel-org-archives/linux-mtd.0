Date: Thu, 3 Feb 2005 10:54:26 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce05020210343e3841ec@mail.gmail.com>
Message-ID: <Pine.LNX.4.58.0502031054200.29798@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
	<1106903029.21196.216.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280914580.11160@phoenix.infradead.org>
	<Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
	<1107111514.18794.37.camel@sauron.oktetlabs.ru>
	<6934efce05013108463a4d42e4@mail.gmail.com>
	<Pine.LNX.4.58.0501311804550.17207@phoenix.infradead.org>
	<1107276561.21196.457.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0502021544380.29798@phoenix.infradead.org>
	<6934efce05020210343e3841ec@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> What do you mean by in-core?

This is the term used in JFFS2. All objects which JFFS2 allocates in RAM 
are divided on two groups: in-core objects and other.

In-core are those objects which must be allocated in order to mount to 
JFFS2 and work with it. So, the in-core memory is the memory which JFFS2 
consumes when it is mounted irrespective of whether one work with it or 
not.

For example, to mount 1GiB JFFS2 partition full of data one need, say, 5 
MiB RAM. Once you have mounted JFFS2, these 5 MiB will be consumed forever 
(until you unmount it). To open files and lookup directories JFFS2 needs 
more RAM. But this RAM is freed when, roughly speaking, you close your 
files.

So, the major JFFS2 drawback is that its in-core RAM consumption depends 
linearly on the amount of data you store *on flash*. And I'm trying to 
find the way to relax this.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
