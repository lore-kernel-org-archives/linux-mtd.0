Received: from fmr20.intel.com ([134.134.136.19] helo=orsfmr005.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EuhJ8-0001Zh-KK
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 21:26:27 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <43BD1F4D.6090000@ru.mvista.com>
References: <1136235272.8963.21.camel@two.research.nokia.com>
	<43BD118B.2050606@ru.mvista.com>
	<1136467206.22022.28.camel@two.research.nokia.com>
	<43BD1F4D.6090000@ru.mvista.com>
Content-Type: text/plain
Date: Fri, 06 Jan 2006 10:20:00 +0800
Message-Id: <1136514000.21803.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Juha =?ISO-8859-1?Q?Yrj=F6l=E4?= <juha.yrjola@nokia.com>
Subject: Re: [PATCH] [JFFS2] Make NAND OOB usage more flexible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-01-05 at 16:29 +0300, Vitaly Wool wrote:
> 
> no, the latest patch is 
> http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.html.
> It doesn't touch OneNAND but the required changes are so similar to 
> common NAND that I don't think it's gonna be a problem to extend it
> for 
> OneNAND. I just didn't bother to; but the approach itself is quite
> generic.
> 

Vitaly,

This is really wonderful. When I wrote EBH patch, Thomas told me
that he hope MTD layer could provide the virtually contiguous
free OOB area. Now it really happens.

I'll modify the OOB usage code in JFFS2 accordingly after you
finish the patch for OneNAND.

Thanks,
Forrest
