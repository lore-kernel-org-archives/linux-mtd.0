Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VCks-0003hY-J0
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 17:04:18 +0100
Date: Wed, 25 Jun 2003 18:04:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jasmine Strong <jasmine@regolith.co.uk>
Message-ID: <20030625160435.GA1770@wohnheim.fh-wedel.de>
References: <20030625154815.GA15437@rinconnetworks.com>
	<0985322B-A725-11D7-A51A-000393AD6294@regolith.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0985322B-A725-11D7-A51A-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: No space left on almost empty JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 June 2003 16:52:34 +0100, Jasmine Strong wrote:
> On Wednesday, Jun 25, 2003, at 16:48 Europe/London, Paul van Gool wrote:
> 
> >I have created an small and almost empty JFFS2 filesystem and have put 
> >it
> >on my flash.
> 
> JFFS2 filesystems require a certain number of erase blocks reserved for
> garbage collection before you can write anything to them.
> 
> 128k is only one erase block for most CFI flashes and is thus far too 
> small
> to have the five(?) free blocks that are required.  There was talk of 
> proving
> the GC for two free blocks, but either way, one block is not (and never 
> will
> be) enough.

Two blocks will be tough, but three seem possible for NOR flash.  If
you care about it, there was some discussion a couple of month back,
even an initial patch.  But then priorities shifted, so that is the
latest status.

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
