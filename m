Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cNnl-0001RV-00
	for <linux-mtd@lists.infradead.org>; Sun, 17 Feb 2002 09:40:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02021418433508.29375@thomas> 
References: <02021418433508.29375@thomas>  <02021416570005.29375@thomas> <1035.1013707668@redhat.com> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 & NAND 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 17 Feb 2002 09:51:15 +0000
Message-ID: <7814.1013939475@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

gleixner@autronix.de said:
> I implemented a new structure into nand_chip structure, which
> describes the  usage of the oob area. You can read and modify this
> structure from the  filesystem driver via two functions, which i have
> implemented into the mtd  structure. (get_oobcfg, set_oobcfg).

I'm slightly concerned that this may be overkill. The JFFS2 code has to
recognise certain types of hardware and arrange its own data in the spare
area accordingly. Does it really need to make that information available, or
just do its own thing? Is the existing mtd->{oobblock,oobsize,ecctype}
really not sufficient?


> I have now fixed the most NAND related FIXME's inside JFFS2, except
> the  problem with wbuf_flush fail. The cleanmarker in the oob area and
> the bad  block marking is working pretty good. I modified the scan
> routine to collect  bad block information. I have a old
> SmartMediaCard, which has bad blocks on  it. The information is
> collected correct. Then I erased one of the bad blocks  and destroyed
> the bad block flag. When gc erased this block again it was  detected
> as bad (not totaly erased) and marked bad again.  

Excellent. 

>  I ran some stress tests on the filesystem and encountered no serious
> problem,  except when i used a wornout old SMCard from a digicam i ran
> into the  flush_wbuf bug. 

OK, let's work on getting your current changes merged, then we can deal 
with the wbuf_flush failure handling. Can you send me a patch against the 
current CVS tree -- I don't think I've changed anything on the 
jffs2-nand-branch recently (since the 5th of February in fact).

--
dwmw2
