Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V94pu-0003fe-QG
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 02:59:55 +0000
Received: by mail-ve0-f176.google.com with SMTP id b10so6196945vea.21
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 19:59:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52099AD1.6070903@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
 <20130813004938.GD7267@brian-ubuntu>
 <52099AD1.6070903@freescale.com>
Date: Mon, 12 Aug 2013 19:59:33 -0700
Message-ID: <CAN8TOE_f8-fNSh598XmuEhc3ZV5JkxHXQ7-JRfZXdjcqGZGceQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] mtd: set the cell information for ONFI nand
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 7:32 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA08=D4=C213=C8=D5 08:49, Brian Norris =D0=B4=B5=C0:
>> On Mon, Aug 12, 2013 at 07:22:38AM +0000, Gupta, Pekon wrote:
>> for chips listed by full-ID, add an appropriate flag/field; and for ONFI
>> chips, just use p->bits_per_cell.
>
> we do not need to worry about the full-id case, we can get the correct ce=
ll
> info from the id[2] for all the 4 toshiba nand.

I see. I forgot that you assign nand_chip.cellinfo in
find_full_id_nand(). It still seems like a bad design decision to base
the implementation of the full-ID table on the fact that it currently
only holds your 4 Toshiba entries, but I suppose it can be improved
if/when additions are needed that don't support the same CELLINFO
layout.

Brian
