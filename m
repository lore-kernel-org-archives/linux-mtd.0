Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0aUX-0006P1-1J
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 17:31:01 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: RE: UBIFS seeing corrupt blank pages when image flashed via u-boot
Date: Tue, 7 Jan 2014 17:30:20 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA5EA90@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA5DBFA@DBDE04.ent.ti.com>,
 <1388753970.25123.124.camel@sauron.fi.intel.com>
In-Reply-To: <1388753970.25123.124.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem,

I wanted to check the 'white-space-fixup' and re-reading your
documentation before, so got delayed in replying.
+ my mail got moderated again by mailman..


>From: Artem Bityutskiy [mailto:artem.bityutskiy@linux.intel.com]
[...]

>If you are worried about fragmentation, we can discuss this separately.
>You can find more about UBIFS journal in my very old UBIFS presentation,
>which explains basic ideas behind the UBIFS wandering journal:
>
>http://www.linux-mtd.infradead.org/doc/ubifs.html#L_documentation
>
>There is also Adrian's white paper with some design description there.
>
Thanks much for reminding me about this.
I had read your slides long back, but never dig deep into Adrian's slides.
so, this was still in my 'To Read' list. But really appreciate your work an=
d
presentation.

[...]

>I do not understand the question. There are no problems in your (b),
>neither in "*_Case-2_" described.
>
>If you meant "*_Case-1_", then yes, there is a piece of doc:
>
>http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo
>
>Basically, "ubiformat" is the "correct" UBI-aware flasher, while
>u-boot's "nand write" seems to be a dumb flasher. I guess you have 2
>options:
>
>1. Teach u-boot's "nand write" to skip empty pages, or may be implement
>a separate "clever" flashing command.
>
Yes, I'll try 'Stefano Babic' suggestion of using u-boot UBI tools.


>2. Use UBIFS's "space fixup" feature. This will cause UBIFS to fix-up
>all empty pages by basically copying all partially-used PEBs to
>different PEBes with empty pages skipping. This will be done on the
>first mount, only once, and may cause considerable delays.
>
>See http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup
>
Though I had read about 'white-space-fixup' feature earlier too, But
somewhere in back of my mind, I thought it was only for "free PEBs"
(erased-blocks which had corrupted or no volume-header). But after
re-reading the FAQ page, I realized that 'white-space-fixup' is done for
all pages, whether in 'free-PEB' or 'used-PEB'.

So, This solved my problem.. Thanks much..


>P.S. Looking at the MTD web-site now, when I am not doing any
>UBI/UBIFS/MTD work anymore for few years, I am impressed how much stuff
>I actually documented there :-)
>
Absolutely agree. Therefore your file-system is so popular..
Especially the MTD and UBI documentation is not only limited to 'how to use=
 it',
Instead I think, it has some advanced details, explanations and reasoning
which were quite ahead of its time when it was written.

This is something which you and other MTD/UBI/ & UBIFS Authors
and Maintainers should be proud of.

Thanks again ..=20

with regards, pekon=
