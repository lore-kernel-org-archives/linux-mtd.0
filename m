Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ21x-0002qo-94
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 19:56:57 +0000
Received: by mail-ig0-x235.google.com with SMTP id hb3so20673896igb.0
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2016 11:56:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160224144652.14068468@bbrezillon>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <20160224144652.14068468@bbrezillon>
Date: Thu, 25 Feb 2016 20:56:36 +0100
Message-ID: <CACna6rxemvBOu9fy9KP0327TsqonO7dFY5EsQjf1k9Ln6hX8cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>,
 Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>
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

On 24 February 2016 at 14:46, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 12 Feb 2016 19:11:23 +0100
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>
>> This allows specifying algorithm used for NAND ECC. There are two
>> available values: "bch" and "hamming". It's important as having just
>> ECC parameters (step, strength) isn't enough to determine algorithm,
>> e.g. you can't distinct BCH-1 and Hamming.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/nand.txt |  3 +++
>>  drivers/of/of_mtd.c                            | 33 +++++++++++++++++++=
+++++++
>>  include/linux/mtd/nand.h                       |  5 ++++
>>  include/linux/of_mtd.h                         |  6 +++++
>>  4 files changed, 47 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentat=
ion/devicetree/bindings/mtd/nand.txt
>> index b53f92e..a2c2df5 100644
>> --- a/Documentation/devicetree/bindings/mtd/nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
>> @@ -3,6 +3,9 @@
>>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_fi=
rst",
>>    "soft_bch".
>> +- nand-ecc-algo : string, algorithm of NAND ecc.
>> +               Supported values are: "bch", "hamming". The default one =
is
>> +               "bch".
>
> I like the idea of specifying which ECC algorithm should be used, and
> this is IMO clearer than putting the information directly in
> nand-ecc-mode (as is already done for the "soft" and "soft_bch" modes,
> which are respectively encoding software hamming and software bch
> implementations).
>
> But shouldn't we take this even further and add new DT properties
> to encode the ECC layout (syndrome, oob_first), and another one to
> specify the implementation type (software or hardware)?
>
> nand-ecc-layout =3D "nornal", "syndrome" or "oob_first"
> nand-ecc-engine =3D "none", "soft" or "hw" ("on-die" ?)
>
> Note that it's not something I ask you to do right now, I just want to
> bring the topic on the table.

So far I was fine with whatever drvier/NAND core picked, didn't have
any issue with it. If at some point we'll see a real need of
specifying it manually as well, I guess we should do as you suggested.

--=20
Rafa=C5=82
