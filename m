Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y17y8-0007hQ-A5
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 06:20:20 +0000
Received: by mail-ig0-f170.google.com with SMTP id r2so9000862igi.1
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 22:19:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141217011511.GN9759@ld-irv-0074>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
 <20141201084023.GH29070@brian-ubuntu>
 <CACna6rwBOux=V-12eTTYBSEzgfQ4v=4HJx8iQGz2OkzzA+LnLA@mail.gmail.com>
 <20141217011511.GN9759@ld-irv-0074>
Date: Wed, 17 Dec 2014 07:19:58 +0100
Message-ID: <CACna6rxmagC5wyGR=pL9=G3Yrihk7tvOkBXcR2wXCSuhEeOA5Q@mail.gmail.com>
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

On 17 December 2014 at 02:15, Brian Norris <computersforpeace@gmail.com> wr=
ote:
> On Mon, Dec 01, 2014 at 10:49:28AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 1 December 2014 at 09:40, Brian Norris <computersforpeace@gmail.com> =
wrote:
>> > I think this is a good time to consider this question: how do we
>> > *really* want a SPI NOR driver to interact with spi-nor.c, regarding
>> > device detection? I like how this patch removes the string-matching
>> > requirement, so we can just auto-detect by JEDEC RDID alone. But I don=
't
>> > like how it leaves around the function parameter 'name', which really
>> > we should really be moving to deprecate if possible.
>> >
>> > Anyway, I can take a rebased version of this patch. But I'd like to
>> > encourage more thought here for the future. I don't yet have a specifi=
c
>> > proposal, so any thoughts are welcome.
>>
>> My purpose is to make use of auto-detect by RDID wherever possible. As
>> you noticed, it's the first step. Now we should modify m25p80 to use
>> it when possible.
>>
>> The case with non-DT platforms is simple. There is
>> struct flash_platform_data
>> which contains "type". I was thinking about Introducing new type like
>> "m25p80-rdid". What do you think about this?
>
> It should reflect "JEDEC RDID" in the name; it means the flash supports
> the JEDEC opcode (0x9F), unlike some of the SST flash you've looked at.
> I'm also not sure why it should still be tied to the m25p80 name. How
> about "spi-nor,jedec-id" or "spi-flash,jedec-id"?

OK on "jedec-id".

However I'm not sure about this "spi-nor," because spi-not is a
framework and it doesn't support all needed ops by itself. And it
wouldn't be clear if "spi-nor,jedec-id" should be handled by m25p80,
fsl-quadspi, or even some different spi-nor driver.

--=20
Rafa=C5=82
