Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKncr-0000cm-WE
 for linux-mtd@lists.infradead.org; Thu, 19 Apr 2012 09:26:09 +0000
Received: by iaky10 with SMTP id y10so14286946iak.36
 for <linux-mtd@lists.infradead.org>; Thu, 19 Apr 2012 02:26:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F8EEA29.20106@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <CABYn4syA53-ce6ZVXEj9AmS-_xne_0vAcAqJWiS7meKQ5YZ7vQ@mail.gmail.com>
 <CABYn4sw9jQbRB5ja3=7sZ9wuP-t0iAv8WdR=mZRNDX2UnQZjNw@mail.gmail.com>
 <4F8EEA29.20106@gmail.com>
Date: Thu, 19 Apr 2012 11:26:03 +0200
Message-ID: <CABYn4swDUivaRoo8bZcKnjfZVMx7Uu2N8hNAMv2dVa1+pwA+pQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Bastian Hecht <hechtb@googlemail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

2012/4/18 Brian Norris <computersforpeace@gmail.com>:
> Hi Bastian,
>
> On 4/18/2012 2:37 AM, Bastian Hecht wrote:
>>
>> 2012/4/18 Bastian Hecht<hechtb@googlemail.com>:
>>
>>> I'm currently working on the hardware ECC part of the SH Mobile flctl
>>> and I like the patchset as it makes things more explicit when OOB data
>>> is requested or not and such things. It's cleaner and better, thanks!
>
>
> Glad it will help! It's good to know other drivers will see a benefit.
>
>
>> To be a bit more of a concrete help, if you can give me a use case to
>> test the oob reads/writes I can modify my driver to work with your
>> patches. Right now I rely on nandwrite, nanddump, nandtest, the kernel
>> test modules and ubi. With none of them I produced an error so far
>> although the current implementation of the hardware ECC completely
>> ignores OOB data other than ECC.
>
>
> Well, for me the big "use case" is that I can support my new DMA controller
> (that doesn't read/write OOB) without the rest of MTD/NAND choking on
> anything or returning junk data. So I mostly make sure that
> nanddump/nandwrite work both with and without OOB (the -o flag) or ECC (the
> -n flag); that the kernel test modules work; and that UBI/UBIFS work on top
> of MTD.

Ah very nice! You made me look at the nandwrite -o thing once again. I
used it before without success, there was no write at all when I
issued it, but now ( - I compiled the git version of mtd-utils and
replaced the debian prehistoric prepackaged one with it - ) it works!
Now I can finish my work on the flctl ECC part. Thanks!

> I don't know if there are any more specific tests you would need to run; are
> you looking for something else?

Nope, thanks.

cheers,

 Bastian Hecht


> Brian
