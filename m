Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtTin-0005oE-OF
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 02:20:06 +0000
Message-ID: <51D0E815.8080300@freescale.com>
Date: Mon, 1 Jul 2013 10:23:17 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: UBIFS: power cut test on 2.6.35 + NOR
References: <51CBDF47.709@bluewind.it>	<ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>	<51CC3669.103@bluewind.it>	<ED3E0BCACD909541BA94A34C4A164D4C4FCA8354@post.tritech.se>	<51CD9168.7000902@bluewind.it>
 <CAN8TOE-+3tedAebiWMTAzEJfaBPs7pwWBuKkJpV9Cx1e402nnQ@mail.gmail.com>
In-Reply-To: <CAN8TOE-+3tedAebiWMTAzEJfaBPs7pwWBuKkJpV9Cx1e402nnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: enrico benetti <enrico.benetti@bluewind.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B406=E6=9C=8829=E6=97=A5 10:08, Brian Norris =E5=86=99=
=E9=81=93:
> (Adding Huang, who has also debugged (different) problems with this NOR=
 driver)
>
> Hi Enrico,
>
> On Fri, Jun 28, 2013 at 6:36 AM, enrico benetti
> <enrico.benetti@bluewind.it>  wrote:
>> [   20.391279] MTD do_write_buffer(): software timeout
>> [   20.452081] UBI error: nor_erase_prepare: cannot invalidate PEB 25,
>> write returned -5 read returned 2
>>
>> Digging the web, I've found several discussions on write-timeout with
>> NOR devices
>> (cfr.http://lists.infradead.org/pipermail/linux-mtd/2013-June/047177.h=
tml),
>> but this seems not to be the root cause.
> I'm curious: what makes you think this has a different root cause?
>
> I'm still working on debugging the do_write_buffer timeout on my
> systems. I'd recommend trying to increase the timeout in
> do_write_buffer(), just to see if your kernel isn't waiting long
> enough. (In my case, I can pretty well show that while the code *says*
> it's waiting for a whole jiffy -- at least 1ms -- it is in fact
> waiting less than that.)
>
> I believe Huang's resolution for his problem was actually a problem
> with the flash part itself.
yes.
For my timeout, Micron confirmed that there is a silicon bug in this=20
type of NOR.


thanks
Huang Shijie
