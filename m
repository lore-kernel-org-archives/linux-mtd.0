Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5q5Y-0000D1-Ip
	for <linux-mtd@lists.infradead.org>; Sat, 04 Oct 2003 18:21:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: timg@tpi.com
In-Reply-To: <200310021344.14931.timg@tpi.com>
References: <200310021344.14931.timg@tpi.com>
Message-Id: <1065287933.16005.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 04 Oct 2003 18:19:39 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Patches to nanddump.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-02 at 13:44 -0600, Tim Gardner wrote:
> I've added a couple of options to nanddump.c:
> 
> -no-oob allowa you to retrieve the contents of a NAND character partiion 
> without the OOB info. 
> 
> -no-print satisfies the interactive pretty-print request. 

Looks generally sane. Can you use getopt please. Example in mkfs.jffs2.c
-- 
dwmw2
