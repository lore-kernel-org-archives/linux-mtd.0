From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071100260.12054@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412231634580.4006@phoenix.infradead.org>
	<Pine.LNX.4.58.0501071100260.12054@phoenix.infradead.org>
Content-Type: text/plain
Date: Fri, 07 Jan 2005 11:09:21 +0000
Message-Id: <1105096161.5547.106.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joakim.tjernlund@lumentis.se, MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-07 at 11:10 +0000, Artem B. Bityuckiy wrote:
> I gonna add support for those architectures who does not have any 
> CPU cycles counters (like ARM). In this case I gonna use jiffies value.

You can do better than that -- we have timers on ARM chips which are
better.

-- 
dwmw2
