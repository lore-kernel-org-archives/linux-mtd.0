Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pUdT-0007tO-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2001 14:03:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011004160202.A25776@recycle.lbl.gov> 
References: <20011004160202.A25776@recycle.lbl.gov>  <20011004093533.A25013@recycle.lbl.gov> <1002226435.27652.21.camel@russ> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: No clean _or_ dirty blocks to GC from! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 Oct 2001 14:12:34 +0100
Message-ID: <15283.1002287554@redhat.com>
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

ldoolitt@recycle.lbl.gov said:
>  Possibilities:
> 1. Change nothing.  The software doesn't get confused, just the
> operator.

Works for me :) But probably not the right thing to do :)

> 2. Add code to avoid the printk's when there are plenty of _free_
> blocks.

Seems sane, if it's necessary. Probably just downgrade it to a debugging 
message.

> 3. Don't trigger the GC on mount unless there is something to do. 

The first thing the thread does on mount is sleep anyway. I'm not sure why 
it's getting woken.

--
dwmw2
