Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LX9Ye-0003ry-Sj
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2009 07:30:59 +0000
Subject: Re: [RFC / PATCH] ubiformat: make it work on mtd parts > 2GiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <49915BAF.2070709@linutronix.de>
References: <20090210095614.GA1995@www.tglx.de>
	<1234260416.17790.109.camel@localhost.localdomain>
	<4991542C.4080206@linutronix.de>
	<1234261659.17790.117.camel@localhost.localdomain>
	<49915BAF.2070709@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Feb 2009 09:30:44 +0200
Message-Id: <1234337444.17790.124.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-10 at 11:49 +0100, Sebastian Andrzej Siewior wrote:
> >> While we here, I get a couple of "compare between signed and unsigned" 
> >> warnings from gcc. I tried to clean them up but I end up with huge patches 
> >> similar to this one. Are you aware of those or you simply don't get them?
> > 
> > I'd rather shut the warnings up by an gcc option - is there such an
> > option?
> You are using -W which deprecated and -Wextra is doing the same thing. One 
> of the things -Wextra does is adding -Wsign-compare so you have to add 
> -Wno-sign-compare to stop that.

A patch is welcome :-)
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
