Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDvsi-0007ZP-Ks
 for linux-mtd@lists.infradead.org; Tue, 29 Dec 2015 15:08:13 +0000
Received: by mail-wm0-x231.google.com with SMTP id u188so13345617wmu.1
 for <linux-mtd@lists.infradead.org>; Tue, 29 Dec 2015 07:07:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151229103519.31ccaf5c@bbrezillon>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
 <CAAEAJfC4YWVC=WWTBnKrnNZypC+CKR+D59+LY7j-haTch4yevA@mail.gmail.com>
 <20151229103519.31ccaf5c@bbrezillon>
Date: Tue, 29 Dec 2015 12:07:50 -0300
Message-ID: <CAAEAJfAV_Nfm81nSEpQRyx=hcW8R-dK6_SJdGDQ_JQK5zu1jpw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] mtd: nand_bbt: introduce independent nand BBT
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Frans Klaver <fransklaver@gmail.com>,
 Peter Pan <peterpandong@micron.com>, beanhuo@micron.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 karlzhang@micron.com
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

On 29 December 2015 at 06:35, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi,
>
> On Mon, 28 Dec 2015 17:42:50 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> This is looking a lot better, thanks for the good work!
>>
>> On 15 December 2015 at 02:59, Peter Pan <peterpansjtu@gmail.com> wrote:
>> > Currently nand_bbt.c is tied with struct nand_chip, and it makes other
>> > NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
>> > onenand has own bbt(onenand_bbt.c).
>> >
>> > Separate struct nand_chip from BBT code can make current BBT shareable=
.
>> > We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
>> > Struct nand_bbt contains all the information BBT needed from outside a=
nd
>> > it should be embedded into NAND family chip struct (such as struct nan=
d_chip).
>> > NAND family driver should allocate, initialize and free struct nand_bb=
t.
>> >
>> > Below is mtd folder structure we want:
>> >         mtd
>> >         =E2=94=9C=E2=94=80=E2=94=80 Kconfig
>> >         =E2=94=9C=E2=94=80=E2=94=80 Makefile
>> >         =E2=94=9C=E2=94=80=E2=94=80 ...
>> >         =E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c
>>
>> Hm.. I'm not sure about having nand_bbt.c in drivers/mtd.
>> What's wrong with drivers/mtd/nand ?
>
> I haven't reviewed the series yet, but I agree. If the BBT code is only
> meant to be used on NAND based devices, it should probably stay in
> drivers/mtd/nand.
>
>>
>> In fact, I  was thinking we could go further and clean up the directorie=
s a bit
>> by separating core code, from controllers code, from SPI NAND code:
>>
>> drivers/mtd/nand/
>> drivers/mtd/nand/controllers
>> drivers/mtd/nand/spi
>>
>> Makes any sense?
>
> Actually I had the secret plan of moving all (raw) NAND controller
> drivers into the drivers/mtd/nand/controllers directory, though this
> was for a different reason: I'd like to create another directory for
> manufacturer specific code in order to support some advanced features
> on NANDs that do not implement (or only partially implement) the ONFI
> standard.
>
> The separation you're talking about here is more related to the
> interface used to communicate with the NAND chip.
>
> How about using the following hierarchy?
>
> drivers/mtd/nand/<nand-core-code>
> drivers/mtd/nand/interfaces/raw/<raw-nand-core-code>
> drivers/mtd/nand/interfaces/raw/controllers/<raw-nand-controller-drivers>
> drivers/mtd/nand/interfaces/spi/<spi-nand-code>
> drivers/mtd/nand/interfaces/onenand/<onenand-code>
> drivers/mtd/nand/chips/<manufacturer-spcific-code>
>
> What do you think?
>

I believe we are bikeshedding here, but what the heck.

That seems too involved. A simpler hierarchy could be clear enough,
and seems to follow what other subsystems do:

drivers/mtd/nand/<all-nand-core-code>
drivers/mtd/nand/raw/<raw-nand-controller-drivers>
drivers/mtd/nand/spi/<spi-nand-code>
drivers/mtd/nand/onenand/<onenand-code>
drivers/mtd/nand/chips/<manufacturer-spcific-code>

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
