Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cKX28-000595-36
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2016 21:05:44 +0000
Received: by mail-ua0-x244.google.com with SMTP id 96so3194653uaq.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Dec 2016 13:05:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e7513817-c6d1-948d-19ff-617debfa1399@gmail.com>
References: <6c95366c-7fcc-ef4c-033a-f9f6e152a669@gmail.com>
 <20160816164204.GV9347@sirena.org.uk>
 <b65240ff-7e28-5ecb-0670-abfca871246b@gmail.com>
 <2e31fbe7-bbc7-8fed-ccbf-dd9ae4d220e1@atmel.com>
 <e7513817-c6d1-948d-19ff-617debfa1399@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 23 Dec 2016 22:04:40 +0100
Message-ID: <CAOMqctTaPoMR=_dEF_j-WU178_i2tOp2sTfZJSDWWkohVxZn8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: m25p80: consider max message size in
 m25p80_read
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 23 December 2016 at 19:53, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/23/2016 04:33 PM, Cyrille Pitchen wrote:
>> Le 17/08/2016 =C3=A0 21:09, Heiner Kallweit a =C3=A9crit :
>>> Consider a message size limit when calculating the maximum amount
>>> of data that can be read.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> Applied to git://github.com/spi-nor/linux.git
>
> Is that the concensus now that we should fix controller crappiness on
> driver level ? Or did I miss the point of this patch ?
>

In general most controllers do have some limit on the amount of data
they can transfer at once.

For some you can apply workaround at controller driver level and for
some it's not practical.

Also for some the limit is lower so it is more likely hit.

I guess you can call controllers that have both of these limitations
crappy but that's what's in the silicone out there.

If you have better solution to the problem please share it in detail.

Thanks

Michal
