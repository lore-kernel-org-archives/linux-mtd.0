From: Anup Patel <anup.patel@broadcom.com>
To: Ray Jui <rjui@broadcom.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 "Scott Branden" <sbranden@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Pramod Kumar <pramodku@broadcom.com>, Vikram Prakash
 <vikramp@broadcom.com>, Sandeep Tripathy <tripathy@broadcom.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list
 <bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
 brcmnand_write()
Date: Sat, 17 Oct 2015 02:52:26 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7AEE5AD@SJEXCHMB10.corp.ad.broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
 <1444986537-28387-2-git-send-email-anup.patel@broadcom.com>
 <56211976.1030401@broadcom.com>
In-Reply-To: <56211976.1030401@broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Ray Jui [mailto:rjui@broadcom.com]
> Sent: 16 October 2015 21:06
> To: Anup Patel; David Woodhouse; Brian Norris; linux-mtd@lists.infradead.=
org
> Cc: Rob Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala; Cata=
lin
> Marinas; Will Deacon; Scott Branden; Florian Fainelli; Pramod Kumar; Vikr=
am
> Prakash; Sandeep Tripathy; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; bcm-kernel-
> feedback-list
> Subject: Re: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
> brcmnand_write()
>=20
> Correct me if I remember it wrong, but I thought this patch has already b=
een
> merged by Brian?

Yes, patch1 and patch2 were merged by Brian. I realized this after I had
send-out v2. Anyways we can ignore patch1 and patch2 from this patchset
because they are same as v1.

Regards,
Anup
