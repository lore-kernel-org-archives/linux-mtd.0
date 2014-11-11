Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoI3k-0005FV-Qi
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 20:29:05 +0000
Received: by mail-la0-f48.google.com with SMTP id gq15so10032916lab.7
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 12:28:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54627016.1020403@nod.at>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
 <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
 <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
 <54626AF4.4090306@nod.at>
 <CAOMZO5AXMjTPPnQtnZUxRmBezoq32wLSCX0iJ30PWa1dZhJ7qQ@mail.gmail.com>
 <54626D23.1080003@nod.at>
 <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
 <54627016.1020403@nod.at>
Date: Tue, 11 Nov 2014 18:28:40 -0200
Message-ID: <CAOMZO5AX7fFC76KjZrLS2yjwnRYXwsfjsWjXeYTj0rmJbGzmTg@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 6:22 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 11.11.2014 um 21:16 schrieb Fabio Estevam:
>> On Tue, Nov 11, 2014 at 6:10 PM, Richard Weinberger <richard@nod.at> wrote:
>>
>>> If the development board has by default no NAND, disable the driver
>>> in imx28-evk.dts file.
>>
>> Again, people are free to put a NAND into the socket and just use it.
>
> If people change their board they are free to fix their dts. :)

Then in this case I need to remove PCI dts nodes as well, because my
dev boards do not come with a PCI device attached to it from the
factory ;-)

At least PCI driver does not complain about it on every boot ;-)
