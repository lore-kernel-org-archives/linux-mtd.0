Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZPsQ-0002kL-Tf
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 21:24:43 +0000
Received: by mail-ig0-x236.google.com with SMTP id y8so44197251igp.1
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 13:24:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160226175506.75d6c7b0@bbrezillon>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <20160224144652.14068468@bbrezillon>
 <CACna6rxemvBOu9fy9KP0327TsqonO7dFY5EsQjf1k9Ln6hX8cw@mail.gmail.com>
 <20160225210946.6c842f4b@bbrezillon>
 <CACna6ryVuqSLv8WdzzGUQzpA-F35JxXoHoa2jcLzZeHaXtoexA@mail.gmail.com>
 <20160226175506.75d6c7b0@bbrezillon>
Date: Fri, 26 Feb 2016 22:24:21 +0100
Message-ID: <CACna6rzRROfYwagsBGo5b8d_bydUBrJ=9RvGZSt1G85xP=gKaw@mail.gmail.com>
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

On 26 February 2016 at 17:55, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 26 Feb 2016 17:30:47 +0100
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>> What about:
>> 1) Adding new nand-ecc-algo as this patch does
>> 2) Deprecating "soft_bch" value from nand-ecc-mode property
>>
>
> Sounds good to me.

I have problems understanding "soft" values which maps to the
NAND_ECC_SOFT. What exactly algorithm is that? It uses functions from
drivers/mtd/nand/nand_ecc.c but this file isn't really helpful. I was
only able to find "3-byte ECC" phase. Kconfig config MTD_NAND_ECC also
doesn't have any description. I also tried looking at
Documentation/mtd/nand_ecc.txt but still no luck.

Does this algorithm has any name?

--=20
Rafa=C5=82
