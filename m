Received: from dhcp199.linuxsymposium.org ([209.151.19.199]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19f3ax-00059s-84
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 21:18:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Holly Gates <hgates@eink.com>
In-Reply-To: <3F1D98F4.8060904@eink.com>
References: <3F1D98F4.8060904@eink.com>
Message-Id: <1058905076.32360.45.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Tue, 22 Jul 2003 16:17:58 -0400
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Smartmedia block mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-07-22 at 16:05, Holly Gates wrote:
> Maybe I could see using the mapping table if it was on the card 
> somewhere,

It is. It's in the 'out of band' area of the data blocks I believe --
see the SmartMedia specs for details.

>  but ideally I could just write the binary file to the sectors 
> in true, physical, incrementing order. Anyone know of a utility I could 
> use to do this?

You need special hardware which gives you access to the raw flash
without doing the translation _for_ you. Most 'card readers' will do it
for you and hence you don't get this option.

> I suppose I could build a parallel port adapter and write some software 
> or something, but that is annoying since I know the computer is capable 
> of doing what I want if I could get at the right layer of the driver 
> stack...

No, it's not. Your USB card reader doesn't let you have access to the
raw flash; it has the translation built-in. 

Either implement the full SMTL in your FPGA, or make sure you use
hardware which accesses the flash directly, when writing to the device.

-- 
dwmw2
