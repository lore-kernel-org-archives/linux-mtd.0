Received: from e32.co.us.ibm.com ([32.97.110.150])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhRs7-0007O1-Nv
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 09:24:23 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kA7EOAhd029196
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 09:24:10 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kA7EOAXL317738
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 07:24:10 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kA7EO99H012081
	for <linux-mtd@lists.infradead.org>; Tue, 7 Nov 2006 07:24:09 -0700
Subject: Re: UBI and OneNAND
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1162908637.31636.23.camel@sauron>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
	<1162889433.5606.15.camel@localhost.localdomain>
	<loom.20061107T110704-786@post.gmane.org>
	<1162899578.31636.19.camel@sauron>
	<1162900051.19697.16.camel@crusty.rchland.ibm.com>
	<1162908637.31636.23.camel@sauron>
Content-Type: text/plain
Date: Tue, 07 Nov 2006 08:24:15 -0600
Message-Id: <1162909455.3092.14.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: John Smith <john.smith@arrows.demon.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-11-07 at 16:10 +0200, Artem Bityutskiy wrote:
> On Tue, 2006-11-07 at 05:47 -0600, Josh Boyer wrote:
> > It's the default.  I think it's too low of a default.  Others disagreed
> > with me.
> > 
> > Telling every new UBI user "may be it makes sense to reserve more" will
> > get old quick.  Perhaps the default should be bumped to 5 or so?
> 
> Actually with 128MiB flash the default ends up with something like
> 32EBs, which looks even too large, so I do not know...

What are you talking about?

(128MiB/128KiB) * .01 = 10.24

So you'd end up with 10EB.

Perhaps we should change MTD_UBI_BEB_RESERVE to be an actual number of
eraseblocks instead of a percent of the device.  So
MTD_UBI_BEB_RESERVE=1 would mean 1 EB, =10 would mean 10.

josh
