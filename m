Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NVlX-0004SJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 09:36:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B578A10.2475DD64@sun.com> 
References: <3B578A10.2475DD64@sun.com>  <20010720011341.17284.qmail@nwcst289.netaddress.usa.net> 
To: Tim Hockin <thockin@sun.com>
Cc: Eric <ebrower@usa.net>, MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [structure field names] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Jul 2001 09:12:24 +0100
Message-ID: <28808.995616744@redhat.com>
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

thockin@sun.com said:
> ebrower@usa.net said:
> > There is a patch for SPARC/Linux in the patches directory
> > that performs 32- to 64-bit ioctl conversions.  If you
> > touch any struct member names that are used as ioctl args
> > this patch will need to be rev'ed as well.

I thought we'd changed the types so that conversions weren't necessary?


thockin@sun.com said:
>  I was just planning to change the map_info, cfi_private, mtd_info
> structures, so that the fields were more descriptive:

> size -> map_size
> size -> mtd_size 

You mean:
   map->size ==> map->map_size
   mtd->size ==> mtd->mtd_size

Almost all variables of type 'struct mtd_info *' have 'mtd' at the end of 
the name, and almost all variable of type 'struct map_info *' have 'map' at 
the end of the name, don't they?

--
dwmw2
