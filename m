Received: from d-200.linux2002.uq.net.au ([203.15.37.200] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZMPW-0003X5-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 01:34:39 +0000
Date: Sat, 9 Feb 2002 11:13:57 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Arne Jonsson <arne.jonsson@i3micro.com>
cc: acurtis@onz.com,  <linux-mtd@lists.infradead.org>
Subject: Re: Flash left in a write mode
In-Reply-To: <3C6378F1.78EEA1BB@i3micro.com>
Message-ID: <Pine.LNX.4.44.0202091113210.2394-100000@lapdancer.baythorne.internal>
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

On Fri, 8 Feb 2002, Arne Jonsson wrote:

> Hi!
> 
> Another problem is when you have your interrupt vectors stored
> in the flash you are accessing.
> If you get an interrupt and have unlocked the flash your interrupt
> vectors are not seen by the CPU, and off you go into the deep binary
> space.

Can't you move the interrupt vectors? At least by using the MMU?

What CPU are you using?

-- 
dwmw2
