Date: Fri, 7 Jan 2005 11:43:48 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: jasmine@linuxgrrls.org
In-Reply-To: <Pine.LNX.4.61.0501071127370.26716@hex.linuxgrrls.org>
Message-ID: <Pine.LNX.4.58.0501071142460.12054@phoenix.infradead.org>
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
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: joakim.tjernlund@lumentis.se, David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Jan 2005 jasmine@linuxgrrls.org wrote:

> 
> 
> On Fri, 7 Jan 2005, David Woodhouse wrote:
> 
> > You can do better than that -- we have timers on ARM chips which are
> > better.
> 
> And ARMv6 has performance counters too.
> 
> -J.
> 

I just can see asm-arm/timex.h. get_cycles() is always zero. May be ARMv6 
is not supported yet, have no ideas.

Anyway, seems that almost all platforms have get_cycles() implemented 
except ARM and some x86 (i386, i486 ...). We don't care much about x86 
IMHO. So, only ARM case should be handled another way.

I'm not expert in ARM. So, any help is welcomed. Are there any calls in 
(ARM) linux which we may use?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
