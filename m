Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJhMH-0003Xo-7B
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 15:31:55 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Ronak Desai <ronak.desai@rockwellcollins.com>,
 linux-mtd@lists.infradead.org
Subject: Re: Increased frequency of fastmap failure due to CRC mismatch
Date: Fri, 18 May 2018 17:31:38 +0200
Message-ID: <2086742.C6Z9nvNyTh@blindfold>
In-Reply-To: <CADFuHZ5Cv-uywSPCFAoEKUUYfG-Qo1PD=XjXiOGwSQy_aFAo9w@mail.gmail.com>
References: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
 <CAFLxGvxSNr1MQoa3Zidg=+fhCY1qkeGQ_fhpy1X0eS51xA=4Rw@mail.gmail.com>
 <CADFuHZ5Cv-uywSPCFAoEKUUYfG-Qo1PD=XjXiOGwSQy_aFAo9w@mail.gmail.com>
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

Ronak,

Am Freitag, 18. Mai 2018, 15:50:47 CEST schrieb Ronak Desai:
> Hey Richard,
> 
> On Thu, May 17, 2018 at 11:49 AM, Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> > On Thu, May 17, 2018 at 5:47 PM, Ronak Desai
> > <ronak.desai@rockwellcollins.com> wrote:
> >> We are at kernel 4.1.8.
> >
> > Woah, this kernel is very old, did you backport _all_ ubi/fastmap fixes?
> 
> No, I did not backport all the changes in ubi/fastmap as considering
> the product state it is not feasible. This product has been tested for
> several months and I checked all the paths in NAND-MTD subsystem as
> well as in NAND controller specific driver but nothing stood out which
> can cause this. I also compared the basic routines with latest kernel
> and I don't see any major changes or fixes which I can relate to this
> failure.

Well, I can guarantee you that fastmap is broken in 4.1.

> The only thing that bothers me is that NAND-MTD system return without
> any error except it reports that it has corrected greater or equals to
> bits on that block but still UBI finds corrupted fastmap. So, either
> there is something wrong in the ECC algorithm where it thinks it has
> corrected the bits but actually it did not or something is wrong in
> UBI fastmap. Also, as I mentioned on every power-up we see this
> fixable bit flip message on that specific block but fastmap fails only
> few times and not always.

Do mtd/ubi tests pass?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
