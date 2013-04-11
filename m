Received: from mail-ve0-f180.google.com ([209.85.128.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQDMu-0001cd-3C
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 09:00:33 +0000
Received: by mail-ve0-f180.google.com with SMTP id c13so1216381vea.11
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 02:00:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
Date: Thu, 11 Apr 2013 02:00:30 -0700
Message-ID: <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
From: Brian Norris <computersforpeace@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Kevin Cernekee <cernekee@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Sorry for the repeat email for some; Gmail switched me back to
HTML-mode, so my previous email couldn't be delivered to the MTD list]

Hi all,

I'm having some trouble where I am getting timeouts in cfi_cmdset_0002.c:

MTD do_write_buffer(): software timeout

I'm using a 64Mbyte Spansion S29GL512 NOR flash:

physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank.
Manufacturer ID 0x000001 Chip ID 0x002301

I can reproduce the timeout approximately 0.5% of the time on a simple
reboot, mount UBI rootfs test. My system has CONFIG_HZ=250, and so the
timeout comes out to just 1 jiffy. I have to increase this timeout to
at least 3 ticks to avoid the timeouts. (I've been running reboot
tests successfully for several days with the timeout as 3 jiffies.)

So my question is: what is the "best" way to decide these timeouts?
I'm inclined to just increase the timeout (and to use the proper
msecs_to_jiffies() macro, as a cleanup). But according to the
datasheets (which agree with the comments in the code), the max time
should be less than a millisecond. So simply increasing the timeout
may in fact just be masking some other bug.

Huang,

I noticed you recently sent a patch that adjusts the timeout print
message in do_write_buffer(). Have you had problems with this code
recently?

Any thoughts from any interested (or uninterested) party would be useful.

Thanks,
Brian
