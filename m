Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170eeh-0007m0-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 09:31:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001c01c1ebfc$00fea960$0201000a@flefebvre> 
References: <001c01c1ebfc$00fea960$0201000a@flefebvre>  <1019677528.1351.67.camel@zeus> <17234.1019686502@redhat.com> 
To: "Frederick Lefebvre" <flefebvre@irg.ca>
Cc: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: Re: build_fs failed 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Apr 2002 09:31:06 +0100
Message-ID: <4272.1019723466@redhat.com>
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

flefebvre@irg.ca said:
> Sorry, I included the full log in a message last week but did not get
> any answers so I tought I would ask a more precise question.  I am
> including it below.  Here are some of the problems I had that I think
> could be relevent in this case. 

Sorry; I was away for a week and then I got distracted by real work :)

> Apr 19 14:50:59 junior kernel: Short read: 0x3c bytes at 0x000003c4
> instead of requested 44

That's the DiskOnChip driver refusing to perform a read command crossing
from one page to another. To get JFFS2 working on DiskOnChip, we'll need to
fix the hardware driver to read multiple pages in one go.

It shouldn't be hard - want to have a go at it?

--
dwmw2
