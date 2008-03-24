Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JdskI-00049I-O2
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 19:54:15 +0000
Date: Mon, 24 Mar 2008 20:54:00 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] 3/3 maple: update bus driver to support Dreamcast VMU
Message-ID: <20080324195359.GJ2899@logfs.org>
References: <1206209786.6324.41.camel@localhost.localdomain>
	<20080324033344.GB15872@linux-sh.org>
	<20080324144647.GC2899@logfs.org>
	<1206371178.6283.37.camel@localhost.localdomain>
	<20080324152952.GF2899@logfs.org>
	<1206373900.6283.39.camel@localhost.localdomain>
	<20080324160429.GG2899@logfs.org> <20080324170707.GH2899@logfs.org>
	<20080324173856.GI2899@logfs.org>
	<1206381351.7543.15.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1206381351.7543.15.camel@localhost.localdomain>
Cc: Andrew Morton <akpm@osdl.org>, linux-sh <linux-sh@vger.kernel.org>,
	Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>,
	Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 March 2008 17:55:51 +0000, Adrian McMenamin wrote:
> 
> The problem is that the hardware does not support another callback. In
> any case while you are right that the function might be called as second
> time, in the original code it will sleep while waiting for the lock,
> which is allocated per device.
> 
> On the second patch - aiui completions do an uninterruptible wait, that
> means they are surely not a good choice for this - especially as the
> device could be unplugged at any time. (Admittedly my documentation
> migght be of date here)

Neither of those two problem should be visible for the mtd driver.  The
usual way how bus driver are implemented is something like this:

struct foo_request {
	void *data;
	loff_t ofs;
	size_t len;
	void (*complete)(struct foo_request);
	void *private;
};

int do_request(struct foo_request *rq)
{
	/* deal with hardware somehow */
	rq->complete(rq);
}

With such infrastructure your mtd driver could look roughly like this:

static void read_complete(struct foo_request *rq)
{
	complete(rq->private);
}

static int foo_read(struct mtd_info *mtd, loff_t ofs, size_t len, size_t *retlen, u_char *buf)
{
	struct foo_dev = mtd->private;
	struct foo_request *rq;
	DECLARE_COMPLETION_ONSTACK(complete);
	int err;

	rq = kmalloc(sizeof(*rq), GFP_KERNEL);
	if (!rq)
		return -ENOMEM;
	/* fill in appropriate values for rq->data, rq->ofs and rq->len */
	rq->private = &complete;
	rq->complete = read_complete;
	err = do_request(rq);
	if (err)
		goto out;
	wait_for_completion(&complete);
	/* copy read data into buf, set retlen */
out:
	kfree(rq);
	return err;
}

Throw in a loop if you need several hardware accesses to fulfil large
reads.  But that's it.  You don't need any locking in the mtd driver at
all.  Ownership is clearly defined.  Between kmalloc() and do_request()
rq belongs to foo_read().  Between do_request() and the call to
read_complete() it belongs to the bus driver.  After completion it
belongs to foo_read() again.  No race window, no complicated locking.

If your hardware can only handle a finite number of requests at a time,
you can queue requests in do_request().  The caller should not know or
care about it - apart from declaring the completion variable and waiting
on it.

The goal of my patches was to move your code towards such a design.
Alas, my time is limited and my girlfriend already unhappy as it is -
you will have to continue without me.  If in doubt, take a look at the
usb code and try to mimic that.  drivers/mtd/nand/alauda.c uses usb to
talk to the hardware and roughly follows what I described above.

Jörn

-- 
Chance favors only the prepared mind.
-- Louis Pasteur
