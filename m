Received: from da1vs02.rockwellcollins.com ([205.175.227.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJL7o-0003bL-I3
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 15:47:30 +0000
Received: by mail-ot0-f200.google.com with SMTP id w10-v6so3745012otj.14
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2018 08:47:14 -0700 (PDT)
MIME-Version: 1.0
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Thu, 17 May 2018 10:47:13 -0500
Message-ID: <CADFuHZ787+cEaZ7ZT7YXZg4zBXUVpya2v29rUdq=FtJ7emv=cQ@mail.gmail.com>
Subject: Increased frequency of fastmap failure due to CRC mismatch
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On one of our units we noticed increase in fastmap failure due to
fastmap CRC mismatch.  On this unit, on every power-up UBI observed
fixable bit flips on a specific PEB. We are using SW ECC for ECC
correction as the processor's NAND controller does not support the
required ECC strength. We have also implemented read retry in the NAND
controller driver.

When UBI reads the fastmap data using NAND-MTD framework,  NAND-MTD
subsystem returns EUCLEAN meaning there were corrections greater or
equals to ECC strength. But the data should be corrected as the read
call does not return any other error.

In this failure scenarios, even though NAND-MTD subsystem has fixed
the corruption with SW ECC, UBI still finds CRC mis-match on fastmap
data. Successful data read with read retries has already been tested
at temperature as well so there is no doubt about the reliability of
read-retries. So, UBI should never receive corrupted data with fixable
bit flip return code.

So, would like to understand what is causing the fastamp data
corruption which leads to CRC mis-match.  Interesting thing is we see
fixable bit flip error message for that specific PEB on every power up
but we don't see fastmap CRC failure on every power up. All the
reboots are graceful (UBI partition is  detached and unmounted) and
there are no abrupt power-cut.

We are at kernel 4.1.8.

-- 
Ronak A Desai
Sr. Software Engineer
Airborne Information Solutions / RC Linux Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Ronak.Desai@rockwellcollins.com
https://www.rockwellcollins.com/
