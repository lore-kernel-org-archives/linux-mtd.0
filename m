MIME-Version: 1.0
Sender: linus.ml.walleij@gmail.com
In-Reply-To: <1290788695.2552.35.camel@localhost>
References: <1290201121-15263-1-git-send-email-linus.walleij@stericsson.com>
	<1290788695.2552.35.camel@localhost>
Date: Sun, 28 Nov 2010 11:20:08 +0100
Message-ID: <AANLkTi=ks+ekjgJnb2pv0LaDzPZike+M+QLeOZKkb3iW@mail.gmail.com>
Subject: Re: [PATCH 2/4] mtd: FSMC NAND replace all use of uintNN_t with uN
From: Linus Walleij <linus.walleij@stericsson.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/11/26 Artem Bityutskiy <dedekind1@gmail.com>:

> On Fri, 2010-11-19 at 22:12 +0100, Linus Walleij wrote:
>> The short kernel versions of the basic types makes the world more
>> readable.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
>
> I do not think dwmw2 will merge this one because he often claimed that
> u32 cannot be better than uint32_t, because the latter is C99 standard,
> but the former is not. So I'd not do this, at least not at the area he
> looks after.

Oh man. Whatever, David shall I respin the patch series without
this one? The latter patches will surely clash so an early indication
is appreciated.

Yours,
Linus Walleij
