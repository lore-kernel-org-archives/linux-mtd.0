Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFX41-00076d-Qi
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 14:49:31 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l19EnGqK011295
	for <linux-mtd@lists.infradead.org>; Fri, 9 Feb 2007 09:49:16 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l19EnGVE551454
	for <linux-mtd@lists.infradead.org>; Fri, 9 Feb 2007 07:49:16 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l19EnFXt018556
	for <linux-mtd@lists.infradead.org>; Fri, 9 Feb 2007 07:49:16 -0700
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1171032000.17314.4.camel@sauron>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<1171012339.10670.33.camel@sauron>
	<1171026729.4884.177.camel@zod.rchland.ibm.com>
	<1171032000.17314.4.camel@sauron>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 08:50:17 -0600
Message-Id: <1171032618.4884.196.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTDML <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-09 at 16:40 +0200, Artem Bityutskiy wrote:
> On Fri, 2007-02-09 at 07:12 -0600, Josh Boyer wrote:
> > If writing zeroes to the field for all LEBs is valid, then I don't think
> > the tools need updating.  At least not the image creation tools.  We've
> > already declared the padding fields to be zero filled.
> > 
> > The unubi tool will need updating though.
> 
> They should be updated because they should generate unique numbers to
> the sqnum field, do not use old 'leb_ver' stuff, because leb_ver stuff
> will go away eventually, say, in a year. Also boot-loaders should be
> eventually updated.

Having them generate a unique number for seqnum isn't _required_ though
right?  UBI will see them all as 0 and still work if I understand
correctly.

I agree the tools _should_ be changed.  I just want to make sure that
it's not a requirement before this patch goes in.

josh
