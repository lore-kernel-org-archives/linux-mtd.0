Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3weY-0005HY-Uq
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2008 17:20:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/1] mtd m25p80: fix bug - ATmel spi flash fails to
	becopied to
Date: Wed, 4 Jun 2008 18:20:52 +0100
Message-ID: <8A42379416420646B9BFAC9682273B6D01FB8036@limkexm3.ad.analog.com>
In-Reply-To: <1212598723.32207.130.camel@pmac.infradead.org>
References: <1211021526-24076-1-git-send-email-cooloney@kernel.org>
	<8A42379416420646B9BFAC9682273B6D0183AE38@limkexm3.ad.analog.com>
	<386072610805190253g42d47d81w794b3c14c15aa890@mail.gmail.com>
	<1212598723.32207.130.camel@pmac.infradead.org>
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: "David Woodhouse" <dwmw2@infradead.org>, "Bryan Wu" <cooloney@kernel.org>
Cc: mike@steroidmicros.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, "Hennerich,
	Michael" <Michael.Hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

Bryan sent an incremental update patch, some time ago.
See below ...

Regards,
Michael

From: Michael Hennerich <michael.hennerich@analog.com>

remove duplicate code.

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/devices/m25p80.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b10649b..7f89b54 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -122,8 +122,6 @@ static int write_sr(struct m25p *flash, u8 val)
 	flash->command[0] =3D OPCODE_WRSR;
 	flash->command[1] =3D val;
=20
-	spi_write(flash->spi, flash->command, 2);
-
 	return spi_write(flash->spi, flash->command, 2);  }
=20
--
1.5.5

>-----Original Message-----
>From: David Woodhouse [mailto:dwmw2@infradead.org]
>Sent: Mittwoch, 4. Juni 2008 18:59
>To: Bryan Wu
>Cc: Hennerich, Michael; linux-mtd@lists.infradead.org; linux-
>kernel@vger.kernel.org; mike@steroidmicros.com
>Subject: Re: [PATCH 1/1] mtd m25p80: fix bug - ATmel spi flash fails to
>becopied to
>
>On Mon, 2008-05-19 at 17:53 +0800, Bryan Wu wrote:
>>
>> >
>> > I just noticed that write_sr contains a duplicated spi_write.
>> > Bryan sends out a new patch.
>> >
>>
>>
>> No problem, it is my fault. I should review the patch carefully.
>
>Was there a new patch coming?
>
>--
>dwmw2
