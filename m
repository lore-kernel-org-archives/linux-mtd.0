Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsoFz-0002V1-Dg
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 06:35:52 +0000
Received: by mail-pd0-f175.google.com with SMTP id w10so6358465pde.6
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 22:35:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131217023731.GC12575@shlinux2.ap.freescale.net>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
 <20131216043040.GB27109@shlinux2.ap.freescale.net>
 <CAGWqfij_FQrXoBkhsL-noMxHyJV1yOyj8BO+ABCZFMP8Hv5upA@mail.gmail.com>
 <20131216130048.GA1155@gmail.com>
 <CAGWqfii2XjauNFMRu=OMTRTsgDeH9-dLhOsr0MeVhX2f-iAmkw@mail.gmail.com>
 <20131217023731.GC12575@shlinux2.ap.freescale.net>
Date: Tue, 17 Dec 2013 07:35:28 +0100
Message-ID: <CAGWqfihdDmgOwqmi+wf9S19P_XVPpsd5szj5j8_j6NMv_g0-mA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Tue, Dec 17, 2013 at 3:37 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Mon, Dec 16, 2013 at 02:14:03PM +0100, Elie De Brauwer wrote:
>>
>> int gpmi_allones(struct gpmi_nand_data *this)
>> {
>>    struct resources *r = &this->resources;
>>    uint32_t reg = readl(r->gpmi_regs + HW_BCH_STATUS0);
> I suddenly realise that you read a wrong register. :)
>
> It should be r->bch_regs, not r->gpmi_regs.
>


Argh, good catch, I swear I was staring at the offsets yesterday but
didn't check the base addresses. I tested this on my board and now I
also get a functioning situation back at "full" speed. I'll come up
with a v3 shortly.

Thanks a lot
E.


-- 
Elie De Brauwer
