Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJfme-0000Z5-3G
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 13:51:01 +0000
Received: by mail-oi0-f69.google.com with SMTP id k136-v6so5143308oih.4
 for <linux-mtd@lists.infradead.org>; Fri, 18 May 2018 06:50:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxSNr1MQoa3Zidg=+fhCY1qkeGQ_fhpy1X0eS51xA=4Rw@mail.gmail.com>
References: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
 <CAFLxGvxSNr1MQoa3Zidg=+fhCY1qkeGQ_fhpy1X0eS51xA=4Rw@mail.gmail.com>
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Fri, 18 May 2018 08:50:47 -0500
Message-ID: <CADFuHZ5Cv-uywSPCFAoEKUUYfG-Qo1PD=XjXiOGwSQy_aFAo9w@mail.gmail.com>
Subject: Re: Increased frequency of fastmap failure due to CRC mismatch
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Richard,

On Thu, May 17, 2018 at 11:49 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Thu, May 17, 2018 at 5:47 PM, Ronak Desai
> <ronak.desai@rockwellcollins.com> wrote:
>> We are at kernel 4.1.8.
>
> Woah, this kernel is very old, did you backport _all_ ubi/fastmap fixes?

No, I did not backport all the changes in ubi/fastmap as considering
the product state it is not feasible. This product has been tested for
several months and I checked all the paths in NAND-MTD subsystem as
well as in NAND controller specific driver but nothing stood out which
can cause this. I also compared the basic routines with latest kernel
and I don't see any major changes or fixes which I can relate to this
failure.

The only thing that bothers me is that NAND-MTD system return without
any error except it reports that it has corrected greater or equals to
bits on that block but still UBI finds corrupted fastmap. So, either
there is something wrong in the ECC algorithm where it thinks it has
corrected the bits but actually it did not or something is wrong in
UBI fastmap. Also, as I mentioned on every power-up we see this
fixable bit flip message on that specific block but fastmap fails only
few times and not always.

>
> --
> Thanks,
> //richard


-- 
Ronak A Desai
Sr. Software Engineer
Airborne Information Solutions / RC Linux Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Ronak.Desai@rockwellcollins.com
https://www.rockwellcollins.com/
