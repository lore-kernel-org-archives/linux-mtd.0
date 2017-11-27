Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJKJi-0002i9-C7
 for linux-mtd@lists.infradead.org; Mon, 27 Nov 2017 14:23:32 +0000
From: Richard Weinberger <richard@nod.at>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: New Defects reported by Coverity Scan for Linux
Date: Mon, 27 Nov 2017 15:23:30 +0100
Message-ID: <3505704.MeAz3peUvV@blindfold>
In-Reply-To: <CAAQYJAsndzcGkTMsj_cUeBTyJcAQDV6-d8ZS0=OPH23N2=hTCQ@mail.gmail.com>
References: <2572889.U5NfXx5rJG@blindfold>
 <CAAQYJAsndzcGkTMsj_cUeBTyJcAQDV6-d8ZS0=OPH23N2=hTCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 27. November 2017, 15:19:20 CET schrieb Andrea Adami:
> On Mon, Nov 27, 2017 at 2:22 PM, Richard Weinberger <richard@nod.at> wrote:
> > Andrea,
> > 
> > please check. The same pattern seems to be used more than once in this
> > driver.
> > 
> > Thanks,
> > //richard
> 
> Hello,
> I acked the patch v2, considering 2 occurrences:
> 
> https://lkml.org/lkml/2017/11/8/567
> 
> I thought that was enough, what should I do now?

Okay, I thought this is a new issue. Then let's keep
this patch. I'll send it to Linus.

Thanks,
//richard
