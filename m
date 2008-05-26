Received: from 206-248-137-77.dsl.teksavvy.com ([206.248.137.77]
	helo=mail.isoar.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0llg-0005Kj-FM
	for linux-mtd@lists.infradead.org; Mon, 26 May 2008 23:06:28 +0000
Received: from [10.0.200.99] (vpn02.rossvideo.com [209.5.118.98])
	by mail.isoar.ca (8.14.1/8.13.8) with ESMTP id m4QN4YeL009425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2008 19:04:42 -0400
Message-ID: <483B4202.8070409@isoar.ca>
Date: Mon, 26 May 2008 19:04:34 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problem with Micron 256 MB NAND on 440EPx
References: <483B132D.80103@isoar.ca> <48079979.3030201@isoar.ca>
	<20080526203606.GA32041@mail.gnudd.com>
In-Reply-To: <20080526203606.GA32041@mail.gnudd.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alessandro Rubini wrote:
>> I've now verified with a logic analyzer that the NFREN strobe is active 
>> during when NFRDYBSY is low (NAND chip is busy), and latching bogus data 
>> as a result (the bus has pull-ups so 0xff).
> 
> I had a similar problem with the NDFC on an old kernel. I finally
> tracked it down to a missing mb() (i.e. eieio on the ppc).  The
> problem was triggered by DMA activity on the bus, but could also be
> exposed by lowering NDFC speed.  The hw controller would thus check
> the R/B* pin before the command reached the nand device, so it was not
> busy (yet).  Since I was working with an old kernel and always tight
> of time, I didn't check if the problem was still present in modern
> code.

I hadn't considered a sequencing problem.  I'll give your patch a try 
too.  Thanks!

I went back and noticed that tWB is hardcoded everywhere to 100ns (no 
define or config variable? *sigh*).  My chip can require up to 150ns.  I 
also increased a few other delays.  Those changes, plus the timeout 
calculation bug I posted on in another thread, and adding timeout 
expired warnings (previously silent errors), and it seems to be working 
at the moment.

I'll roll up a patch of it all when I'm satisfied with it after more 
testing.

-- 
Andrew E. Mileski
