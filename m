Received: from e31.co.us.ibm.com ([32.97.110.149])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFVX5-0003K9-Lg
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 13:11:24 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l19DB7fm003672
	for <linux-mtd@lists.infradead.org>; Fri, 9 Feb 2007 08:11:07 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l19DB7Z9551608
	for <linux-mtd@lists.infradead.org>; Fri, 9 Feb 2007 06:11:07 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l19DB7D8018051
	for <linux-mtd@lists.infradead.org>; Fri, 9 Feb 2007 06:11:07 -0700
Subject: Re: [PATCH] UBI: introduce sequential counter
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1171012339.10670.33.camel@sauron>
References: <20070208200247.11853.36338.sendpatchset@localhost.localdomain>
	<1170972968.4884.140.camel@zod.rchland.ibm.com>
	<1171012339.10670.33.camel@sauron>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 07:12:09 -0600
Message-Id: <1171026729.4884.177.camel@zod.rchland.ibm.com>
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

On Fri, 2007-02-09 at 11:12 +0200, Artem Bityutskiy wrote:
> Hello Josh,
> 
> On Thu, 2007-02-08 at 16:16 -0600, Josh Boyer wrote:
> > Do image creation tools now how to understand how to increment the
> > counter for each block in a binary image that would be flashed onto the
> > card raw?  Or do you leave the counter in all the VID headers as 0 for
> > such images?
> 
> They don't and they should be updated. But yes, they write zeroes to the
> sqnum and UBI is happy.

If writing zeroes to the field for all LEBs is valid, then I don't think
the tools need updating.  At least not the image creation tools.  We've
already declared the padding fields to be zero filled.

The unubi tool will need updating though.

> Here is an example:
> 
> I know the number of PEBs on the media N and I may introduce an
> empirical criteria of oldness M = F(N). For example, M=kN, k is a
> natural number. Its a subject for an investigation.
> 
> I know the highest sqnum (= the current global sequence counter) H, and
> any LEB with sqnum=S is treated it as old if S < H-M, and as "fresh"
> otherwise.
> 
> When I move a PEB with low EC, and I need to pick the target PEB (T),
> where I move the data to. I pick T with the highest EC if the data is
> old, and I pick T with an average EC if the data is fresh.

If you replace "old" with "stale" I agree.  My stupid english thinking
brain equates "old" with the passage of time, and that isn't what sqnum
is tracking.  It is valid to use stale though.

> > >  	ubi32_t data_crc;
> > > -	uint8_t padding1[24];
> > > +	uint8_t padding1[4];
> > > +	ubi64_t sqnum;
> > > +	uint8_t padding2[12];
> > 
> > Can't you add the field at the bottom before hdr_crc so you don't have
> > split padding like that?
> 
> No, it is 64-bit and I want it to be aligned.

Ah, aligned within on a 64-bit boundary... I see.  Looks odd, but ok.

josh
