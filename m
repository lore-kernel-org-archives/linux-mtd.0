Received: from ppp83.spiderweb.com.au ([202.76.149.83] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YSnP-0000K2-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Feb 2002 14:11:37 +0000
Date: Thu, 7 Feb 2002 00:22:21 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Jonas Holmberg <jonas.holmberg@axis.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: chip drivers
In-Reply-To: <1013003382.14724.2.camel@pcjonashg>
Message-ID: <Pine.LNX.4.44.0202070021020.1927-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 6 Feb 2002, Jonas Holmberg wrote:

> Can you explain that a bit further? I can't figure out how use
> add_mtd_partitions (current CVS) when I want to make a partition that
> starts in one map and ends in another. 

It's not in CVS. There were patches on the mailing list. You need to 
either use those, or write your own indirection routines to do what you 
require, in place of the existing mtdpart methods.

-- 
dwmw2
