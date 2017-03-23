Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr0Ql-00082H-Gu
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 10:57:25 +0000
Received: by mail-wr0-x22d.google.com with SMTP id y90so26995133wrb.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 03:57:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170323104556.185f92e0@free-electrons.com>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
 <20170322161323.22b7489c@free-electrons.com>
 <1b4bbd29-c93e-3e75-b01d-7b7b2ac93385@sigma-star.at>
 <20170323104556.185f92e0@free-electrons.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 23 Mar 2017 11:57:00 +0100
Message-ID: <CAAQYJAub6XGjsSg4Ri6qk6xkrGdrRfzAGqfqf6EJ7UVU_H_RpQ@mail.gmail.com>
Subject: Re: mtd-utils: various fixes, apply OpenEmbedded patches
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Richard Weinberger <richard@nod.at>, Yuanjie.Huang@windriver.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 23, 2017 at 10:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 23 Mar 2017 10:33:21 +0100, David Oberhollenzer wrote:
>
>> The first one (ubinize return status) has been applied shortly after
>> the mtd-utils 1.5.2 release.
>>
>> The second patch (about execinfo.h) sparked a discussion with Richard
>> prefering a libmissing implementation instead. A libmissing has been
>> added in August last year that provides a dummy implementation of the
>> backtrace family of functions for libraries like musl that don't
>> provided them.
>>
>> The third patch, that removes the bits/stdio_lim.h inclusion was also
>> applied already between the 1.5.2 and 2.0.0-rc1 releases.
>
> Awesome, thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


Hi,
while you're reviewing old patches please note there are some little
klibc fixes for 1.52 here:

http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc

Probably you could consider the fixes for rpmatch() and getline(). Unsure about
iniparser_getdouble.

Thanks
Andrea
