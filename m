Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cmv5L-00084x-1b
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 09:27:34 -0500
Date: Fri, 7 Jan 2005 14:27:10 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071419550.12054@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.61.0501071425550.28205@hex.linuxgrrls.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412231634580.4006@phoenix.infradead.org>
	<Pine.LNX.4.58.0501071100260.12054@phoenix.infradead.org>
	<1105096161.5547.106.camel@baythorne.infradead.org>
	<Pine.LNX.4.61.0501071127370.26716@hex.linuxgrrls.org>
	<Pine.LNX.4.58.0501071142460.12054@phoenix.infradead.org>
	<Pine.LNX.4.58.0501071419550.12054@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: joakim.tjernlund@lumentis.se, MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem,

On Fri, 7 Jan 2005, Artem B. Bityuckiy wrote:

> #cat /proc/cpuinfo
> Processor       : ARM926EJ-Sid(wb) rev 3 (v5l)

This is an OMAP1623 or similar.  Make sure your tight loops are 
32-byte-aligned.

-J.
