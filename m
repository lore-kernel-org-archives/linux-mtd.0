Received: from thor.lineo.com ([204.246.147.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uOuU-0004RZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 02:25:02 +0100
Message-ID: <3AEE1067.599A8ACF@Rikers.org>
Date: Mon, 30 Apr 2001 19:24:55 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?)
References: <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse wrote:
> Either:
>         1. After scan, move the first <n> blocks in the list to the end
>                 of the list, where 1 < n < sizeof(list).

Providing n is random, this is a good solution. Can the list be hacked
to change the top/bottom without actually walking through n blocks and
moving them? I have not looked at the source, but for a linked list you
could join top and bottom entries and then break n and n-1 nodes and
start becomes n, end becomes n-1, etc.

>         2. When adding entries to the lists during scan, do something
>                 like: if (jiffies % 1) list_add_tail() else list_add().

This will still be somewhat pattern oriented. last blocks scanned will
be either at front or back so I suspect wear numbers will increase
towards the end of scanned blocks. ie: first scanned blocks would never
be on the end of the dirty list.
-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
