Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TeXQS-0003y1-7g
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 20:43:08 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so1259615iea.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2012 12:43:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1354273697.30168.87.camel@sauron.fi.intel.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <1354273697.30168.87.camel@sauron.fi.intel.com>
Date: Fri, 30 Nov 2012 17:43:07 -0300
Message-ID: <CALF0-+UCS+9ypoh+_sFzFcAB2b7Gc=Dj-USJvU=LWa7AdJo3ng@mail.gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: dedekind1@gmail.com,
 richard -rw- weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for the taking the time to answer.

On Fri, Nov 30, 2012 at 8:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
>> I don't know how many ubi volumes a user typically creates, but I
>> expect not to be too many.
>
> I think I saw something like 8-10 in some peoples' reports.
>

Mmm, that's more than I've expected.

[...]
>
>> This cache is 1-LEB bytes, vmalloced at open() and freed at release().
>
> Is it per-block device?

Yes. But notice the vmalloced cache is freed on release().
So, an unused ubiblock won't allocate it.

>Then I am not sure it is a good idea to
> automatically create them for every volume...
>

Given that ubiblock is workqueue based I believe there isn't any
performance penalty in creating many instances.

Regarding memory footprint: we should consider how much
does it cost to create an ubiblock device, plus the underlying
gendisk, request queue, etc.

If people is partitioning its ubi devices in 8-10 volumes,
then I'm not too sure if we want to create a block device
per-volume automatically. Not because of the cache -again, if an
ubiblock is unused it won't allocate any- but because of overall
unnecessary bloatness.

The main idea behind auto-creation is that, IMHO,
ubi ecosystem already has its own rather large set of
userspace tools, I'm against adding yet another one.

I'm gonna keep playing with this and come up with
the long promise numbers.

    Ezequiel
