Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CokSF-0001fg-K9
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 10:30:41 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0CFSYm4088394
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 10:28:34 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0CFSY8X271142
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 08:28:34 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0CFSX21008859
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 08:28:33 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501121519280.10617@phoenix.infradead.org>
References: <41E4D6E5.1090407@imc-berlin.de>
	<41E4EDBE.8070302@inf.u-szeged.hu> <41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
	<41E53F52.3010601@imc-berlin.de>
	<Pine.LNX.4.58.0501121519280.10617@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1105543712.3896.3.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Wed, 12 Jan 2005 09:28:32 -0600
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 09:21, Artem B. Bityuckiy wrote:
> On Wed, 12 Jan 2005, Steven Scholz wrote:
> 
> > 
> > >>Well. I think when a sectors gots written correctly (and summary is correct), I 
> > >>have to assume that the sector stay intact. So no need for checks.
> > >>
> > >>If a sector got broken just by reading it then the whole embedded system is 
> > >>broken and has to be replaced ...
> > > 
> > > This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
> > > and *report* media problems.
> > Fair enough.
> > But how will pay attention if the system is embedded into your microwave oven or 
> > washing maschine... ;-)
> In this case this doesn't make sence.

Actually, it could make sense in a microwave oven.  They have a
mechanism to display errors to the users if they'd like by using the
clock.  It's all up to the overall design of the system.  You don't
necessarily need a human to parse through dmesg.

(And if your washing machine is sophisticated enough to need Linux, then
it probably at least had some LEDs you could flash a morse code message
with.)

josh
