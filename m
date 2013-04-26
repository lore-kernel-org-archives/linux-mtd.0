Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVc3u-0002s4-G1
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 06:23:15 +0000
Message-ID: <517A1DB2.9030606@freescale.com>
Date: Fri, 26 Apr 2013 14:24:50 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V3 6/9] mtd: add a new field for ecc info in the
 nand_flash_dev{}
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>	<1366707297-31309-7-git-send-email-b32955@freescale.com>	<CAN8TOE_5CeJfGpgJtKBXmb5ai3w9dZ8juk5GdQhRTZQ7MPKbZw@mail.gmail.com>	<5178EFC9.9080207@freescale.com>
 <CAN8TOE9VfdC38wJO0=_+nZ2d7qz3citSb7yVKsUj3Zsz91WpWA@mail.gmail.com>
In-Reply-To: <CAN8TOE9VfdC38wJO0=_+nZ2d7qz3citSb7yVKsUj3Zsz91WpWA@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA04=D4=C226=C8=D5 14:15, Brian Norris =D0=B4=B5=C0:
> How does that look? It's actually quite similar to the construct Artem
> used with mfr_id and dev_id, except that we give the struct a name.
> And this time, it actually compiles!
>
It's ok to me. :)

I will use it in the next version.

thanks
Huang Shijie
