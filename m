Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pHMU-0006gJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2001 23:53:02 +0100
Message-ID: <20011004160202.A25776@recycle.lbl.gov>
Date: Thu, 4 Oct 2001 16:02:02 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: Re: No clean _or_ dirty blocks to GC from!
References: <20011004093533.A25013@recycle.lbl.gov> <1002226435.27652.21.camel@russ>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002226435.27652.21.camel@russ>; from Russ Dill on Thu, Oct 04, 2001 at 01:13:54PM -0700
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

> On Thu, 2001-10-04 at 09:35, Larry Doolittle wrote:
> > This is really strange.  I go through the following steps:

The only problem looks like the message printing.
A GC pass is triggered by the mount process, finds no
garbage to collect, and does nothing.  Perfect!

Possibilities:

1. Change nothing.  The software doesn't get confused, just the operator.

2. Add code to avoid the printk's when there are plenty of _free_ blocks.

3. Don't trigger the GC on mount unless there is something to do.

      - Larry  
