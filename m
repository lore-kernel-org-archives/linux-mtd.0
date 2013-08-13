Received: from mail-db9lp0249.outbound.messaging.microsoft.com
 ([213.199.154.249] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97wn-0006hz-Qe
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 06:19:15 +0000
Message-ID: <5209CFFD.8000501@freescale.com>
Date: Tue, 13 Aug 2013 14:19:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 01/10] mtd: set the cell information for ONFI nand
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
 <20130813004938.GD7267@brian-ubuntu> <5209A1F2.80600@freescale.com>
 <20130813031702.GI7267@brian-ubuntu>
 <20980858CB6D3A4BAE95CA194937D5E73E9F4137@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F4137@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8813=E6=97=A5 12:10, Gupta, Pekon =E5=86=99=
=E9=81=93:
>> On Tue, Aug 13, 2013 at 11:03:14AM +0800, Huang Shijie wrote:
>>> =E4=BA=8E 2013=E5=B9=B408=E6=9C=8813=E6=97=A5 08:49, Brian Norris =E5=
=86=99=E9=81=93:
>>>       currently), we should modify it so that is a reliable source of
>>>       *only* 1
>>>       piece of information -- the number of bits per cell. Currently,=
 it
>>> do you need to rename the cellinfo to bits_per_cell, or add a new fie=
ld :
>>> bits_per_cell?
>> Well, my whole point was that 'cellinfo' is really not very useful for
>> us. We just mask it off all the time, and it makes life more
>> complicated.
>>
>> So I'd just rename cellinfo to bits_per_cell and change its
>> assignment/usage appropriately.
>>
> [Pekon]: How about moving 'bit_per_cell' info to chip->options ?
sorry, i do not think this is a good idea.

the drivers may changes the chip->options.

I prefer to keep it as new field.

thanks
Huang Shijie
