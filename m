Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1bk-0002l3-T4
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:09:29 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h5B9A0V70924	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 02:10:00 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1055322260.2097.13.camel@passion.cambridge.redhat.com>
References: <3EE6EBA0.3080508@intracom.gr>
	 <1055321465.2097.9.camel@passion.cambridge.redhat.com>
	 <3EE6EF42.7030405@intracom.gr>
	 <1055322260.2097.13.camel@passion.cambridge.redhat.com>
Message-Id: <1055322613.886.2.camel@russ>
Mime-Version: 1.0
Date: 11 Jun 2003 02:10:14 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: Pantelis Antoniou <panto@intracom.gr>
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 02:04, David Woodhouse wrote:
> On Wed, 2003-06-11 at 09:58, Pantelis Antoniou wrote:
> > That is a valid approach.
> > 
> > I take it that you mean a new MTD block device over NAND that
> > automatically skips over bad blocks and presents an error free
> > block interface for use by read only filesystems.
> 
> Basically, yes. You can then either require the use of a special
> userspace tool to program the file system images onto the flash, or
> perhaps you could implement it as a writable block device, in the
> expectation that people don't _actually_ use it in write mode in
> production.

you could simplify this by making it so that writes can only occur
starting at 0 sequentially onward (I think this is doable by not
implementing seek)

-- 
Russ Dill <Russ.Dill@asu.edu>
