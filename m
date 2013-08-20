Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBa10-00063K-Fz
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 00:41:43 +0000
Received: by mail-vc0-f169.google.com with SMTP id ib11so3628967vcb.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 17:41:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5381361.fmCO4JOXvv@laclwks004>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-5-git-send-email-b32955@freescale.com>
 <20130817175507.GA5034@norris.computersforpeace.net>
 <5381361.fmCO4JOXvv@laclwks004>
Date: Mon, 19 Aug 2013 17:41:17 -0700
Message-ID: <CAN8TOE-LC+p6Vt9GB7kiT-ytqnD2aMJ7sKMwZMEa3QHiKCwhhw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] mtd: set ONFI nand's default hooks in
 nand_set_defaults()
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maximintegrated.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: f.fainelli@gmail.com, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "pekon@ti.com" <pekon@ti.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 1:06 AM, Brian Foster
<brian.foster@maximintegrated.com> wrote:
> On Saturday 17-August-2013 10:55:07 Brian Norris wrote:
>> On Fri, Aug 16, 2013 at 10:10:07AM +0800, Huang Shijie wrote:
>> > We may do some ONFI get/set features operations before we call the
>> > nand_scan_tail().
>> >
>> > So move the default ONFI nand hooks into nand_set_defaults().
>> >
>> > Signed-off-by: Huang Shijie <b32955@freescale.com>
>>
>> This patch looks similar to a one forwarded by Brian Foster/Florian
>> Fainelli a while back. But since I don't have a good copy of the other
>> one, I'll take this.
>
>  This looks Ok to me.
>  Apologies for not sending a =93good copy=94
>  of the earlier one.  Sorry!

No problem. Artem had replied about resending it inline (that is the
typical way to review patches), but I was going to get around to
applying it anyway.

Regards,
Brian
