Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ5uF-0004Rc-IQ
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 13:19:48 +0000
Received: by bwz4 with SMTP id 4so61841bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jun 2009 06:19:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1245755193.9487.53.camel@localhost.localdomain>
References: <1245754975-12063-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1245755193.9487.53.camel@localhost.localdomain>
Date: Tue, 23 Jun 2009 16:19:21 +0300
Message-ID: <7948530906230619q6b0d91d8id28a1dbc8131d59f@mail.gmail.com>
Subject: Re: [PATCH] MTD: OneNAND: multiblock erase support
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/6/23 Artem Bityutskiy <dedekind@infradead.org>:
> On Tue, 2009-06-23 at 14:02 +0300, Mika Korhonen wrote:
>> Add support for multiblock erase command. OneNANDs (excluding Flex-OneNA=
ND)
>> are capable of simultaneous erase of up to 64 eraseblocks.
>> This changes the erase requests for regions covering multiple eraseblock=
s
>> to be performed using multiblock erase.
>>
>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>> ---
>> =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 22 +++-
>> =A0drivers/mtd/onenand/onenand_base.c | =A0268 +++++++++++++++++++++++++=
+++-------
>> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 =A02 +
>> =A0include/linux/mtd/onenand_regs.h =A0 | =A0 =A02 +
>> =A04 files changed, 236 insertions(+), 58 deletions(-)
>
> Just out of curiosity, what is your use-case for this?
>

When erasing and programming large amounts, e.g. filesystem images on
OneNAND the erase part takes about 10-15% of the time. Using
multiblock erase it takes almost no time (up to 30x faster) :)
Obviously, it is especially useful if the data to be programmed covers
only part of the erased region.

Mika
