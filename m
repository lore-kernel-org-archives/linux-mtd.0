Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16msTS-0001tz-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 08:26:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020318074250.DA1EA36F9@sitemail.everyone.net> 
References: <20020318074250.DA1EA36F9@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Mar 2002 08:38:01 +0000
Message-ID: <8925.1016440681@redhat.com>
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

zeusj@firstlinux.net said:
> since I am not familiar to the intel strata flash 28f128,  I thought
> you have a set_vpp() method for it and it can be transmitted to me for
> my file. I think I misunderstood what you mean :) but... I check all
> the doc I can find but they are all about the hardware:(so many
> pins...) ,do u have a set_vpp() method for 28f128? If it does, can u
> show me? 

Vpp is the programming voltage pin of the flash chip. You have to put a
high voltage on this pin to allow programming - otherwise the chip will be 
in read only mode. Newer chips don't need such high voltages any more, but 
still have a Vpen (program enable) line which has much the same effect.

If the Vpen line to your flash chips isn't just hardwired to be on, then 
it'll be controlled by a GPIO pin somewhere. That would be board-specific.

--
dwmw2
