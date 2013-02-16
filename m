Received: from mail-ia0-x229.google.com ([2607:f8b0:4001:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U6Yx0-00074t-S6
 for linux-mtd@lists.infradead.org; Sat, 16 Feb 2013 04:00:35 +0000
Received: by mail-ia0-f169.google.com with SMTP id j5so3963443iaf.0
 for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2013 20:00:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1360751856.12703.132.camel@sauron.fi.intel.com>
References: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
 <1360052485-11961-1-git-send-email-b32955@freescale.com>
 <1360751856.12703.132.camel@sauron.fi.intel.com>
Date: Sat, 16 Feb 2013 12:00:33 +0800
Message-ID: <CAMiH66FFzeSg7r_hedet5deynxY6OF18UMcASsX-GaHjGmXiZQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: torturetest: add the support for random data
 pattern
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>, ricard.wanderlof@axis.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 13, 2013 at 6:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2013-02-05 at 16:21 +0800, Huang Shijie wrote:
>> Add a new module parameter 'pattern'. The meaning of the pattern is:
>>   (1) pattern == 0 for 55/AA pattern.
>>   (2) pattern < 0 for random pattern.
>>   (3) pattern > 0 for random pattern too, the value of the pattern is used
>>       as the seed for the random generator.
>
> Please, do not add parameters, make it simple - teach the test to use
> both the old patterns plus additional cycles with random patterns.

but if we do not add new parameter, how can we create a random seed?
Is it ok without set the random seed?

thanks
Huang Shijie

>
> --
> Best Regards,
> Artem Bityutskiy
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
