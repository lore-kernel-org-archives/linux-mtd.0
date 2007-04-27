Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HhP09-0006mJ-P0
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 07:52:40 -0400
Subject: Re: corruption of JFFS2 filesystem, csize is set to 0 after moving
	a block
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177667175.2755.476.camel@pmac.infradead.org>
References: <1177599259.18969.111.camel@localhost.localdomain>
	<1177602237.2755.414.camel@pmac.infradead.org>
	<1177665229.18969.143.camel@localhost.localdomain>
	<1177667175.2755.476.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 27 Apr 2007 13:52:21 +0200
Message-Id: <1177674741.18969.150.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-04-27 at 10:46 +0100, David Woodhouse wrote:
> On Fri, 2007-04-27 at 11:13 +0200, Hans-Christian Egtvedt wrote:

<cut jffs2dump initial image>

> Those are suspect. Why 4092 bytes not 4096? The node with version 2
> claims to be 4092 bytes starting from 4092, which is invalid because it
> crosses a page boundary.

Let me quote Homer Jay Simpson, "DOH!".

<cut jffs2dump corrupted image>

> Ok, in that case I agree that a csize of zero also looks suspicious.
> Matches the node 'totlen' though. What's the compression type.
> 
> Did you use 'mkfs.jffs2 -s 4092'?

I have no idea how I turned up with this number, but rebuilding the
image with pagesize=4096 gives a fully working image.

Many thanks for your help.

-- 
Best regards
Hans-Christian Egtvedt
