Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AADp5-0006lX-5T
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 20:30:11 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "David =?iso-8859-1?q?M=FCller?= (ELSOFT AG)" <d.mueller@elsoft.ch>,
	linux-mtd@lists.infradead.org
Date: Fri, 17 Oct 2003 08:34:53 +1300
References: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
	<3F8CF52E.1050502@elsoft.ch>
In-Reply-To: <3F8CF52E.1050502@elsoft.ch>
MIME-Version: 1.0
Message-Id: <20031016192902.9EF784FDB@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: word line disturbance
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 15 October 2003 20:20, David Müller (ELSOFT AG) wrote:
> Hello
>
> Magnus Mårtensson wrote:
> > Hi.
> > I had a discussion with flash manufacturer Atmel last week regarding a
> > phenomenon that we had seen. The phenomenon was called "word line
> > disturbance" and it could occur if you tried to program only ones to a
> > location that already contained ones. The result could be that some bit
> > on another address got tainted. Ex writing 0xffff to address A could
> > result in the content on address B changing from 0xffff to 0xfffe.
>
> Does anybody know more about the technical background of this "it's not
> a bug, it's a feature" problem? Or is it just a manager driven decision
> to save some money at the wrong place?
>

This is likely to be the result of a compromise to simplify the flash 
internals to save cost. Some of these compromises are acceptable for certain 
usage scenarios, but not others. Atmel do this sort of thing a lot.

Atmel design their DataFlash range of parts for data use and their other 
parts for code storage. If the problem showed up in their Dataflash parts I'd 
consider it a true bug.

-- Charles
