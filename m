Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoHy2-0003Qi-QN
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 20:23:11 +0000
Message-ID: <54627016.1020403@nod.at>
Date: Tue, 11 Nov 2014 21:22:46 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>	<CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>	<CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>	<54626AF4.4090306@nod.at>	<CAOMZO5AXMjTPPnQtnZUxRmBezoq32wLSCX0iJ30PWa1dZhJ7qQ@mail.gmail.com>	<54626D23.1080003@nod.at>
 <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
In-Reply-To: <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

Am 11.11.2014 um 21:16 schrieb Fabio Estevam:
> On Tue, Nov 11, 2014 at 6:10 PM, Richard Weinberger <richard@nod.at> wrote:
> 
>> If the development board has by default no NAND, disable the driver
>> in imx28-evk.dts file.
> 
> Again, people are free to put a NAND into the socket and just use it.

If people change their board they are free to fix their dts. :)

>> You can leave a comment how to enable the driver if an user creates
>> a new board based on this eval board with a NAND.
> 
> No, I don't think this is a good idea.
> 
> BTW, I don't see any other nand driver that prints error on the probe
> error path like this one.

mpc5121_nfc.c for example does. Before every "goto error" in mpc5121_nfc_probe()
it prints an error message.

Thanks,
//richard
