Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pEju-0006Tf-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2001 21:05:02 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-025 #47347)
 id <0GKP00C016V5SZ@asu.edu> for linux-mtd@lists.infradead.org; Thu,
 04 Oct 2001 13:13:53 -0700 (MST)
Date: Thu, 04 Oct 2001 13:13:54 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: No clean _or_ dirty blocks to GC from!
In-reply-to: <20011004093533.A25013@recycle.lbl.gov>
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Message-id: <1002226435.27652.21.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <20011004093533.A25013@recycle.lbl.gov>
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

On Thu, 2001-10-04 at 09:35, Larry Doolittle wrote:
> This is really strange.  I go through the following steps:
> 
> 0. Run linux-2.4.9-ac10-rmk2-np1 with latest CVS MTD/JFFS2 on a
>    StrongARM with Intel 28F320B3B Flash.  /dev/mtd2 is a 1M partition.

there were some mismerges of mtd in 2.4.9-rmk2-np1 iirc, I had a problem
of mount in checkroot.sh getting stuck in a D state. I would go to a
newer kernel, or grab the latest mtd and put it in the kernel.
