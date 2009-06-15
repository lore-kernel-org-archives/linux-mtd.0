Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MG7Qe-0002vN-Ji
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 08:20:39 +0000
Received: by bwz4 with SMTP id 4so3645380bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Jun 2009 01:20:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9c9fda240906150054w31ece2abs6194e11165522dd7@mail.gmail.com>
References: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
	<9c9fda240906150054w31ece2abs6194e11165522dd7@mail.gmail.com>
Date: Mon, 15 Jun 2009 11:20:30 +0300
Message-ID: <7948530906150120i28a316a9q29d7c13644a5a167@mail.gmail.com>
Subject: Re: RFC: [PATCH] MTD OneNAND: multiblock erase support
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: kyungmin78@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/6/15 Kyungmin Park <kyungmin78@gmail.com>:
> On Mon, Jun 15, 2009 at 4:03 PM, Mika Korhonen<mika.j.korhonen@gmail.com>=
 wrote:
>> Hi,
>>
>> I wrote an initial support for OneNAND multiblock erase feature. =A0When
>> done in maximum 64 eraseblock batches multiblock erase is up to 30x
>> faster than block-by-block erase (not including erase verify, though).
>>
>> However, I only had possibility to test this with an OMAP board, so I
>> don't know if e.g. the default onenand_wait needs adjustment. Also for
>> Flex-OneNAND the support goes off. Does Flex even have mb erase?
>>
>> What do you think?
>>
>
> Hi,
>
> I think you should also modify onenand_wait. and Flex-OneNAND supports
> the multi-block erase.

Ok, could I actually test the default onenand_wait() by not overriding
them in OMAP-specific side? Is there anything special that should be
considered with Flex? Likely just removing the if condition would not
work, would it? :)

> Do you consider the exception case if the multi-block erase failed?
>
> I think you don't consider the bad block handling in case of multi-block =
erase
>
> You first check the there's no bad block in multi-block erase. the
> following code only exit. it means we never erase if we have bad
> block.

You're right but that's also how the current implementation works in
case the area to be erased contains multiple eraseblocks and a bad one
is encountered. I tried to keep the behaviour the same. To change that
for better would require some way to inform the caller which eb's were
bad. New ioctl()?

Thank you for the good comments!
Mika
