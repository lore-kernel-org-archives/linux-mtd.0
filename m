Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjZ9u-0001XX-5c
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 19:43:54 +0000
Received: by mail-ie0-f175.google.com with SMTP id y20so1359054ier.34
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 12:43:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201410292019.20966.marex@denx.de>
References: <1414576675-7792-1-git-send-email-Chunhe.Lan@freescale.com>
 <201410291505.48720.marex@denx.de>
 <CACna6ryTfC0c6op+Kv6TU3gFJPHj00nvkMH+T8BL2-=1ffbdww@mail.gmail.com>
 <201410292019.20966.marex@denx.de>
Date: Wed, 29 Oct 2014 20:43:32 +0100
Message-ID: <CACna6rwFmtG01B2xwNgV9vrk945v5On1Mvm=4qfJP4Kxs-Oe8g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Move n25q032 entry to Micron devices list
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 Chunhe Lan <Chunhe.Lan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 October 2014 20:19, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, October 29, 2014 at 06:40:46 PM, Rafa=C5=82 Mi=C5=82ecki wr=
ote:
>> On 29 October 2014 15:05, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, October 29, 2014 at 10:57:55 AM, Chunhe Lan wrote:
>> >
>> > [...]
>> >
>> > There are problems with this patch. Firstly, it misses any description
>> > explaining why the change took place at all. From an outside observer
>> > point of view, this change seems random at best.
>>
>> This looks like a normal cleaning for me.
>
> We can only guess, since the commit message is missing.

Maybe the topic says everything the patch does :)


>> > I can only speculate here, that your SPI NOR was
>> > recognised as some other part, right ? That's why moving the n25q032
>> > higher resolved the problem for you, right ?
>> >
>> > The problem is with the fragility of this code which matches the JEDEC
>> > ID and type of the SPI NOR. I recall Huang had some patches which trie=
d
>> > to resolve this, not sure what the status of those patches is though.
>>
>> Wait, what? OK, this makes things tricky. Does this patch really
>> change any behavior? How does it happen? I don't see any duplicated
>> entry with the same JEDEC ID (0x20ba16).
>>
>> Could you give us some more details?
>
> Please see this thread:
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053308.html
>
> This is where the discussion about ordering in the table took place
> and where the patch for implementing the support for length of READID
> return value was proposed.

As I said, entry "n25q032" doesn't share JEDEC with anything else and
does not even have an ext_id. So I don't think it's related to the
s25fl128s vs. s25fl129p1 problem.

--=20
Rafa=C5=82
