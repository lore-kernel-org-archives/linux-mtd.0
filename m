Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atBWA-0002cz-5m
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 10:07:26 +0000
Received: by mail-yw0-x22d.google.com with SMTP id t10so83896691ywa.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2016 03:07:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACfi_Z1cX47-BVAfQkkoKXsdrjSHU0V95pCBAaSWHm0=T7TZJA@mail.gmail.com>
References: <CACfi_Z1cX47-BVAfQkkoKXsdrjSHU0V95pCBAaSWHm0=T7TZJA@mail.gmail.com>
Date: Thu, 21 Apr 2016 12:07:04 +0200
Message-ID: <CAFLxGvxKVjNXGJyu4sWLDK1cqzp0ou-N_Z+bKzvpK-6FyE3s-A@mail.gmail.com>
Subject: Re: how to view mapping between a given ubifs volume, its set of
 LEBs, and its corresponding set of PEBS
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Davis Roman <davis.roman84@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 21, 2016 at 4:13 AM, Davis Roman <davis.roman84@gmail.com> wrote:
> Hello all,
>
> I'm trying to understand the mapping between a ubifs volume and the

UBIFS does not have volumes. UBI does.

> set of LEBs that get mapped to it.
>
> More so, I'd like to also understand the mapping between a given LEB
> and its designated PEB.
>
> Although the mapping between LEBs and PEBs can change during runtime,
> I figure that there should be a way to see this mapping via the
> command line.
>
> Does such a method exist ?

No, the mappings are internals and change also often.

But with a few lines of C you can add a debugfs file to print the corresponding
EBA table of an volume.
That way you can learn the mappings.

-- 
Thanks,
//richard
