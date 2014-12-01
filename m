Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvNc6-0005D5-0G
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 09:49:50 +0000
Received: by mail-ie0-f175.google.com with SMTP id x19so3987408ier.34
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 01:49:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141201084023.GH29070@brian-ubuntu>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
 <20141201084023.GH29070@brian-ubuntu>
Date: Mon, 1 Dec 2014 10:49:28 +0100
Message-ID: <CACna6rwBOux=V-12eTTYBSEzgfQ4v=4HJx8iQGz2OkzzA+LnLA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: allow NULL as chip name and try to auto
 detect it
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1 December 2014 at 09:40, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Wed, Oct 22, 2014 at 06:05:00PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> This will allow spi-nor users to plainly use JEDEC to detect flash chip.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>
> I think this is a good time to consider this question: how do we
> *really* want a SPI NOR driver to interact with spi-nor.c, regarding
> device detection? I like how this patch removes the string-matching
> requirement, so we can just auto-detect by JEDEC RDID alone. But I don't
> like how it leaves around the function parameter 'name', which really
> we should really be moving to deprecate if possible.
>
> Anyway, I can take a rebased version of this patch. But I'd like to
> encourage more thought here for the future. I don't yet have a specific
> proposal, so any thoughts are welcome.

My purpose is to make use of auto-detect by RDID wherever possible. As
you noticed, it's the first step. Now we should modify m25p80 to use
it when possible.

The case with non-DT platforms is simple. There is
struct flash_platform_data
which contains "type". I was thinking about Introducing new type like
"m25p80-rdid". What do you think about this?

I'm not exactly sure how m25p80 is handled when used in DT. Does
anyone know that? m25p80 itself doesn't register as DT driver. So I
guess there is some code translating DT m25p80 entries into platform
data. Is that right? Where is this code located?

--=20
Rafa=C5=82
