Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MHBcP-0001kV-Do
	for linux-mtd@lists.infradead.org; Thu, 18 Jun 2009 07:01:20 +0000
Received: by qw-out-1920.google.com with SMTP id 9so509806qwj.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Jun 2009 00:01:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <7948530906150402l4896399dv80962495f89da1fb@mail.gmail.com>
References: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
	<4A361E6C.3000208@nokia.com>
	<7948530906150402l4896399dv80962495f89da1fb@mail.gmail.com>
Date: Thu, 18 Jun 2009 16:01:00 +0900
Message-ID: <9c9fda240906180001q6ed66482s9e313e51901b238f@mail.gmail.com>
Subject: Re: RFC: [PATCH] MTD OneNAND: multiblock erase support
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Mika Korhonen <mika.j.korhonen@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 15, 2009 at 8:02 PM, Mika Korhonen<mika.j.korhonen@gmail.com> w=
rote:
> 2009/6/15 Adrian Hunter <adrian.hunter@nokia.com>:
>> Mika Korhonen wrote:
>>>
>>> I wrote an initial support for OneNAND multiblock erase feature. =A0Whe=
n
>>> done in maximum 64 eraseblock batches multiblock erase is up to 30x
>>> faster than block-by-block erase (not including erase verify, though).
>>>
>>> However, I only had possibility to test this with an OMAP board, so I
>>> don't know if e.g. the default onenand_wait needs adjustment. Also for
>>> Flex-OneNAND the support goes off. Does Flex even have mb erase?
>>>
>>> What do you think?
>>
>> I expect all OneNAND support multiblock erase, so the config should
>> go away. =A0Kyungmin can probably comment on that.
>
> Yes, I was thinking about that as well. Is it included in all chips?

So I got mistake, the Flex-OneNAND don't support the multi-block
erase. Instead it support the erase suspend & resume

Thank you,
Kyungmin Park
