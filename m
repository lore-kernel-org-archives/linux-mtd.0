Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uskao-0002vk-AW
 for linux-mtd@lists.infradead.org; Sat, 29 Jun 2013 02:08:51 +0000
Received: by mail-vc0-f169.google.com with SMTP id ia10so1097386vcb.0
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2013 19:08:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51CD9168.7000902@bluewind.it>
References: <51CBDF47.709@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA81FE@post.tritech.se>
 <51CC3669.103@bluewind.it>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCA8354@post.tritech.se>
 <51CD9168.7000902@bluewind.it>
Date: Fri, 28 Jun 2013 19:08:25 -0700
Message-ID: <CAN8TOE-+3tedAebiWMTAzEJfaBPs7pwWBuKkJpV9Cx1e402nnQ@mail.gmail.com>
Subject: Re: UBIFS: power cut test on 2.6.35 + NOR
From: Brian Norris <computersforpeace@gmail.com>
To: enrico benetti <enrico.benetti@bluewind.it>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Adding Huang, who has also debugged (different) problems with this NOR driver)

Hi Enrico,

On Fri, Jun 28, 2013 at 6:36 AM, enrico benetti
<enrico.benetti@bluewind.it> wrote:
> [   20.391279] MTD do_write_buffer(): software timeout
> [   20.452081] UBI error: nor_erase_prepare: cannot invalidate PEB 25,
> write returned -5 read returned 2
>
> Digging the web, I've found several discussions on write-timeout with
> NOR devices
> (cfr.http://lists.infradead.org/pipermail/linux-mtd/2013-June/047177.html),
> but this seems not to be the root cause.

I'm curious: what makes you think this has a different root cause?

I'm still working on debugging the do_write_buffer timeout on my
systems. I'd recommend trying to increase the timeout in
do_write_buffer(), just to see if your kernel isn't waiting long
enough. (In my case, I can pretty well show that while the code *says*
it's waiting for a whole jiffy -- at least 1ms -- it is in fact
waiting less than that.)

I believe Huang's resolution for his problem was actually a problem
with the flash part itself.

Brian
