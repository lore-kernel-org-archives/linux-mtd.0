Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLfZ6-0007xC-U2
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 10:53:17 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: <Srinivasu.Vaduguri@nokia.com>,
 <panto@intracom.gr>
Date: Thu, 6 May 2004 11:48:24 +0200
References: <AEB09EDA2548094C81ED6AA93269F63D01D09323@siebe001.apac.nokia.com>
In-Reply-To: <AEB09EDA2548094C81ED6AA93269F63D01D09323@siebe001.apac.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200405061148.24573.tglx@linutronix.de>
cc: dwmw2@infradead.org
cc: linux-mtd@lists.infradead.org
cc: ddaney@avtrex.com
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 06 May 2004 11:30, Srinivasu.Vaduguri@nokia.com wrote:
> >
> >How many times have you written the block in order for something like
> >this to occur?
>
> I haven't counted the number of times. But I remember reading some
> information, that even on multiple reads we do get bit errors and it is a
> symptom that the block slowly becoming bad after some time.

Hmm. Never seen this. I have some read only paritions which are accessed in 
stress testing and I never have seen, that a block gets bad due to reading.

> But what I feel is, a read-only filesystem like cramfs is not that reliable
> on NAND flash. We have to detect a bad block early.

Yep, but you can only detect it while writing / erasing.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
