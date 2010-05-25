Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OGwEc-0005jq-30
	for linux-mtd@lists.infradead.org; Tue, 25 May 2010 15:40:02 +0000
Received: by pxi1 with SMTP id 1so2177606pxi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 May 2010 08:40:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B030DA9F8EB@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1274181389-7488-1-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-2-git-send-email-s-ghorai@ti.com>
	<AANLkTikFxtzDpiJvJjnuonM2urMJR1LDLafx5JtpC_bS@mail.gmail.com>
	<1274284094.6286.17.camel@thunk>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D991D50@dbde02.ent.ti.com>
	<AANLkTikK4ISAsLFS-l5fXGxCppv98F2qqb8OBnZ7OTHd@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030DA9F8EB@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 25 May 2010 21:04:37 +0530
Message-ID: <AANLkTimvO3Gd1oM6Ctp22PcaBw7QmvOZhY6YhawJNos0@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] omap3 gpmc: functionality enhancement
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"tony@atomide.com" <tony@atomide.com>,
	"sakoman@gmail.com" <sakoman@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"peter.barada@gmail.com" <peter.barada@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 25, 2010 at 8:07 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
[...]
>> > c. And how to know that ECC engine is in used other driver should not
>> use it? Any bit to know that ecc engine is busy, as we check for prefetc=
h?
>> Do not really remember config registers. Perhaps there is no way.
>> But I guess you should check into register GPMC_ECC_CONFIG at bit 1.
>> This is the bit we are setting to enable ECC calculation, IIRC.
> [Ghorai] there are two functions -
> =A0 =A0 =A0 info->nand.ecc.calculate =A0 =A0 =A0 =A0=3D omap_calculate_ec=
c;
> =A0 =A0 =A0 info->nand.ecc.hwctl =A0 =A0 =A0 =A0 =A0 =A0=3D omap_enable_h=
wecc;
> And GPMC_ECC_CONFIG register..
> =A0 =A0 =A0 =A03:1 ECCCS Selects the CS where ECC is computed
> =A0 =A0 =A0 =A00 ECCENABLE Enables the ECC feature
> Now we enable omap_enable_hwecc (with GPMC_ECC_CONFIG[ECCENABLE]=3D1); an=
d its get disabled (automatically) when ecc_size data transfer over.
> But say still it did not read the ecc value yet (omap_calculate_ecc).
> So how to protect following omap_enable_hwecc() before omap_calculate_ecc=
() =A0without additional flag? Any input is welcome.

Oh yes, that's is a problem. Perhaps in that case you have to protect
it in very much same way you already did.

--=20
Regards,
Vimal Singh
