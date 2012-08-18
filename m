Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Z8m-0006bG-LW
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 02:51:57 +0000
Received: by yhjj52 with SMTP id j52so4821878yhj.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 19:51:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <502E0417.3040708@freescale.com>
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>
 <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
 <502E0417.3040708@freescale.com>
Date: Fri, 17 Aug 2012 19:51:54 -0700
Message-ID: <CAN8TOE99ncoBgzpDjKXAWuMQ9O25JZhzLixbXtJA+c2T=mro-A@mail.gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 17, 2012 at 1:43 AM, Huang Shijie <b32955@freescale.com> wrote:
>> BTW, I actually have some patches queued up that I need to complete
>> properly, where I'm trying to clean up and update NAND detection a
>> little. So I basically have this same patch, but rebased on top of
>
> Did you finish your nand detection patches?
> I really hope this Hynix's nand chip could be supported by the mtd code.
> If your plan is blocked,  could i send out a new version of this patch?

Well, I have some working patches, but they aren't entirely ready for
submission. Other things have taken priority. Sorry about the delay,
since you were probably waiting...

Yes, please go ahead if you have a good submission; but I thought we
agreed there was no good way to detect these chips without practically
hard-coding the ID + parameter configuration. If that's the case, then
maybe I should speed up my patches (sitting around here as well...)
regarding a full 8-byte ID detection table. I think this kind of table
will be necessary to support some chips anyway.

Brian
