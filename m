Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsl06-0006h7-GW
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 03:07:15 +0000
Date: Tue, 17 Dec 2013 10:37:32 +0800
From: Huang Shijie <b32955@freescale.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131217023731.GC12575@shlinux2.ap.freescale.net>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
 <20131216043040.GB27109@shlinux2.ap.freescale.net>
 <CAGWqfij_FQrXoBkhsL-noMxHyJV1yOyj8BO+ABCZFMP8Hv5upA@mail.gmail.com>
 <20131216130048.GA1155@gmail.com>
 <CAGWqfii2XjauNFMRu=OMTRTsgDeH9-dLhOsr0MeVhX2f-iAmkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGWqfii2XjauNFMRu=OMTRTsgDeH9-dLhOsr0MeVhX2f-iAmkw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 16, 2013 at 02:14:03PM +0100, Elie De Brauwer wrote:
> 
> int gpmi_allones(struct gpmi_nand_data *this)
> {
>    struct resources *r = &this->resources;
>    uint32_t reg = readl(r->gpmi_regs + HW_BCH_STATUS0);
I suddenly realise that you read a wrong register. :)

It should be r->bch_regs, not r->gpmi_regs.

thanks
Huang Shijie
