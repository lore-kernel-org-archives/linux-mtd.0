From: dwmw2@infradead.org (David Woodhouse)
Date: 26 Feb 2003 14:57:48 +0000
Subject: MTD/JFFS BK repository?
In-Reply-To: <NCBBIINEHIPFGJPLBEIFOELAECAA.acurtis@onz.com>
References: <NCBBIINEHIPFGJPLBEIFOELAECAA.acurtis@onz.com>
Message-ID: <1046271467.4795.3.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-02-26 at 14:40, Allen Curtis wrote: 
> I was wondering if anyone has created a BK version of the MTD repository?
> Would this be desirable?

I do it occasionally when pushing stuff to Linus or Marcelo, and I
played once with making them available at http://linux-mtd.bkbits.net/
but those are very out of date.

> Any idea what was the last version to be integrated with the main Linux
> trees?

Marcelo has the latest code as of two or three weeks ago. I've merged
most of the changes other than block device crap _from_ Linus' tree into
mine at that time but haven't got round to sending it back to him yes.
 
> I will do the integration if it has not been done in a while. What would be
> a good CVS tag to use?

-r1 :)


-- 
dwmw2
