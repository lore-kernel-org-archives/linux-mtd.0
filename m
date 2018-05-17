Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJM3P-0003Qd-Sa
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 16:49:00 +0000
Received: by mail-wr0-x231.google.com with SMTP id i14-v6so6380357wre.2
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2018 09:46:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
References: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 17 May 2018 18:46:46 +0200
Message-ID: <CAFLxGvx4HVc3bAioJuwTsAxDo8ZqwvxC50_-R4Q=xocHyEqZNQ@mail.gmail.com>
Subject: Re: Increased frequency of fastmap failure due to CRC mismatch
To: Ronak Desai <ronak.desai@rockwellcollins.com>
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

On Thu, May 17, 2018 at 5:47 PM, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:
> On one of our units we noticed increase in fastmap failure due to
> fastmap CRC mismatch.  On this unit, on every power-up UBI observed
> fixable bit flips on a specific PEB. We are using SW ECC for ECC
> correction as the processor's NAND controller does not support the
> required ECC strength. We have also implemented read retry in the NAND
> controller driver.
>
> When UBI reads the fastmap data using NAND-MTD framework,  NAND-MTD
> subsystem returns EUCLEAN meaning there were corrections greater or
> equals to ECC strength. But the data should be corrected as the read
> call does not return any other error.
>
> In this failure scenarios, even though NAND-MTD subsystem has fixed
> the corruption with SW ECC, UBI still finds CRC mis-match on fastmap
> data. Successful data read with read retries has already been tested
> at temperature as well so there is no doubt about the reliability of
> read-retries. So, UBI should never receive corrupted data with fixable
> bit flip return code.
>
> So, would like to understand what is causing the fastamp data
> corruption which leads to CRC mis-match.  Interesting thing is we see
> fixable bit flip error message for that specific PEB on every power up
> but we don't see fastmap CRC failure on every power up. All the
> reboots are graceful (UBI partition is  detached and unmounted) and
> there are no abrupt power-cut.

Hmm, did you manually check the fastmap? I wonder what in the fastmap is wrong.
Is it just a bitlfip or are many bytes bad?

Is your mtd driver sane?

-- 
Thanks,
//richard
