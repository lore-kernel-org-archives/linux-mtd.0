Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6MP7-0000mK-UG
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 09:14:06 +0000
Date: Wed, 11 Jun 2008 11:13:58 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bruce_Leonard@selinc.com
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080611091357.GB9045@logfs.org>
References: <20080611071814.GC2432@logfs.org>
	<OFEC9EF05D.17E9BC87-ON88257465.0029A487-88257465.002AB5C8@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OFEC9EF05D.17E9BC87-ON88257465.0029A487-88257465.002AB5C8@selinc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 June 2008 00:46:30 -0700, Bruce_Leonard@selinc.com wrote:
> 
> Okay, that makes sense.  I think I'm actually starting to understand some 
> of this :\.  How tied up in the block layer is the I/O scheduler?  With my 
> limited understanding, it seems that is going to be the real sticking 
> point in moving block and mtd io towards each other.  If the I/O scheduler 
> is largely decoupled from bio it may make this easier than I think.

The block io schedulers do two things.  First they implement some kind
of elevator, combining operations and reordering them for better disk
head utilization.  That is fairly useless in flash context.  Some
schedulers also add policy, like giving all process a fair share of io.
That might become useful for flash as well.

> Fortunately, I think I'm well on my way to doing that.  I've taken your 
> code snippets (okay pretty much stolen them wholesale, I hope that's okay) 
> and started makeing changes based on them.  The changes aren't really 
> radical, I don't make use of the struct fio_vec and I'm just making 
> submit_fio() a wrapper around existing NAND functions, simple stuff like 
> that for now.  That will at least get me working and maybe some proof of 
> concept.  I hope to have a patch set in the next day or two for the list 
> to look over.

Cool.  If you solve your problem, don't break anything existing and the
infrastructure allows to handle existing drivers one by one, I am happy.
Bonus points for changing existing drivers, of course.  But I think a
one-by-one migration is better than a flag-day.  If the conversion
introduces bugs to individual drivers, we can simply revert those bits
and redo them at our leasure, instead of dealing with everything at
once.

Jörn

-- 
I don't understand it. Nobody does.
-- Richard P. Feynman
