Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUY1e-0001gV-Uo
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 07:52:31 +0000
Message-ID: <51763E20.6000304@freescale.com>
Date: Tue, 23 Apr 2013 15:54:08 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 00/11] mtd: add datasheet's ECC information to nand_chip{}
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>	<1366120517.2768.109.camel@sauron.fi.intel.com>	<516E04B0.7010508@freescale.com>	<CAN8TOE_unte2BFxuXTyUg==7QUTwxXwPsTieaVAD74xixk65CA@mail.gmail.com>	<CAN8TOE-Nt1HrWBN+HeeJAE0UDKBwCXiEEc5+kPtjBM5hXF4d+A@mail.gmail.com>	<5175F337.6010605@freescale.com>
 <CAN8TOE8MjVK3k5zEEWNMH74aPm6PFU77LuPpV+RH4E5jbfocCA@mail.gmail.com>
In-Reply-To: <CAN8TOE8MjVK3k5zEEWNMH74aPm6PFU77LuPpV+RH4E5jbfocCA@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, matthieu.castet@parrot.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA04=D4=C223=C8=D5 15:26, Brian Norris =D0=B4=B5=C0:
> I'm not sure that would be a better way, if we can just as easily
> support signed-int fields. But we should mention the semantics we're
> defining, since drivers other than gpmi may (will) want to use this.
I failed to send my email for the HTML issue. So i make my reply to short=
.

I will send an extra patch to add more comment about the two fields.
Use the comment as the init semantics.

And I prefer to keep the name as it is now. :)


thanks
Huang Shijie
