Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MG9xc-0001m6-Ts
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 11:02:51 +0000
Received: by fxm8 with SMTP id 8so3736085fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Jun 2009 04:02:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A361E6C.3000208@nokia.com>
References: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
	<4A361E6C.3000208@nokia.com>
Date: Mon, 15 Jun 2009 14:02:42 +0300
Message-ID: <7948530906150402l4896399dv80962495f89da1fb@mail.gmail.com>
Subject: Re: RFC: [PATCH] MTD OneNAND: multiblock erase support
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: kyungmin.park@samsung.com,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/6/15 Adrian Hunter <adrian.hunter@nokia.com>:
> Mika Korhonen wrote:
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
>
> I expect all OneNAND support multiblock erase, so the config should
> go away. =A0Kyungmin can probably comment on that.

Yes, I was thinking about that as well. Is it included in all chips?

> Waiting for multiblock-erase, you should probably spin, not use the
> interrupt line. =A0You should change the wait function in
> onenand_base and omap2.c.
>
> You should handle multiple multiblock erases.
>
> You should check for bad blocks *before* doing command 0x95

Ok

> Waiting for erase-verify, you should probably spin too.
>
I just tried that and it looks like spinning in verify read makes a
difference as I got 30% faster total time for 1600 block erase.

Thanks for good advice!
Mika
