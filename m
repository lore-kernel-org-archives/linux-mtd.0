Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WTo3-0001lS-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 03:19:47 +0100
Message-Id: <5.1.0.14.0.20010813213035.02d26e50@mail.spewey.com>
Date: Mon, 13 Aug 2001 21:39:31 -0500
To: David Woodhouse <dwmw2@infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: JFFS2 is broken 
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
 "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
In-Reply-To: <17795.997747217@redhat.com>
References: <5.1.0.14.0.20010813172206.00b02a38@mail.spewey.com>
 <5.1.0.14.0.20010813172206.00b02a38@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 01:00 AM 8/14/2001 +0100, David Woodhouse wrote:

>vipin@embeddedlinuxworks.com said:
> > David once mentioned that there are some obvious optimizations that
> > can be carried out in the JFFS2 code. Maybe he could list out his
> > favorite ones  and maybe someone could volunteer to tackle them one by
> > one.
>
>I committed the cleanup to jffs2_remove_node_refs_from_ino_list()

Great! Frederic, since you just setup your system to do the jitter tests, 
could you pl run them again (with the new code from CVS) and see what 
difference it made (my own system is busy running the mird db power fail 
tests).

  Also enable profiling and see what else is on the  "CPU hog" list.

The LTT (Linux Trace Toolkit) seems to be an excellent tool to get more 
fine grained performance stats out of the system and
a new version was just released for 2.4.5 (though it may provide us with 
more info that we need/can handle :)

Vipin
