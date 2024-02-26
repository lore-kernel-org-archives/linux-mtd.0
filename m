Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B8AC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 00:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkcrmPXP60sg/XfT1V4omyBVzz4fIrgwxhQAm5oCnDc=; b=UssvNdpJrOFxco
	bxL1EVUZRteH+1y9sqliqrYz8YGGXmkudIJQy3+P/WTBnXt0JPQyxUWEJ5KQySEvLtClWKKN1aeho
	uu8u0VgFwQKyHIRCdObf6agAiw6IadOYOVPLOhl63pbePSJrQC4grQXsicOdWYbVWPYBMQU62eW2i
	jBQqyzx+YLcqOU7XOB1sYxt9wiomy17nk6Phd/UGdx33gBg57szs9MKYT8dbqMC3gJ65h1bSRiiP8
	vvPqYyB6euSeHeAoQT2o9bNBg9vfuszbQVidfmJfJDYaodw6fHmljphvwfZQgzkEdSo3ld4dycdQ5
	l8h6SUs5bCucDu+qTRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reOVW-0000000FyEQ-1Zcj;
	Mon, 26 Feb 2024 00:06:10 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reOVP-0000000FyCd-304a
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 00:06:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1reOVA-0001je-1q;
	Mon, 26 Feb 2024 00:05:48 +0000
Date: Mon, 26 Feb 2024 00:05:40 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
Message-ID: <ZdvV1KABu_UCSL7B@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org>
 <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org>
 <20240219120156.383a1427@xps-13>
 <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1209094181.98490.1708899174329.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_160603_944836_5E82B79E 
X-CRM114-Status: GOOD (  25.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On Sun, Feb 25, 2024 at 11:12:54PM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
> > An: "Daniel Golle" <daniel@makrotopia.org>
> > CC: "richard" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>=
, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
> > Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+d=
t@kernel.org>, "linux-mtd"
> > <linux-mtd@lists.infradead.org>, "devicetree" <devicetree@vger.kernel.o=
rg>, "linux-kernel"
> > <linux-kernel@vger.kernel.org>
> > Gesendet: Montag, 19. Februar 2024 12:01:56
> > Betreff: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volu=
mes
> =

> > Hi Daniel,
> > =

> > daniel@makrotopia.org wrote on Tue, 19 Dec 2023 02:33:48 +0000:
> > =

> >> In an ideal world we would like UBI to be used where ever possible on a
> >> NAND chip. And with UBI support in ARM Trusted Firmware and U-Boot it
> >> is possible to achieve an (almost-)all-UBI flash layout. Hence the need
> >> for a way to also use UBI volumes to store board-level constants, such
> >> as MAC addresses and calibration data of wireless interfaces.
> >> =

> >> Add UBI volume NVMEM driver module exposing UBI volumes as NVMEM
> >> providers. Allow UBI devices to have a "volumes" firmware subnode with
> >> volumes which may be compatible with "nvmem-cells".
> >> Access to UBI volumes via the NVMEM interface at this point is
> >> read-only, and it is slow, opening and closing the UBI volume for each
> >> access due to limitations of the NVMEM provider API.
> > =

> > I don't feel qualified enough to review the other patches, however this
> > one looks good to me.
> =

> Finally(!), I had enough time to look.
> Thanks for addressing all my comments form the previous series.
> Patches applied.

It's an enourmous coicident that you are writing just now that I found
a sizeof(int)-related problem which triggers a compiler warning when
building the UBI NVMEM provider on 32-bit platforms. I was just about
to prepare an updated series. Literally in this minute.
Should I still send the whole updates series or only the final patch
(as the necessary change is there) or a follow-up patch fixing the
original patch?

> =

> I have only one tiny request, can you share the lockdep spalt
> you encountered in ubi_notify_add() regarding mtd_table_mutex
> and ubi_devices_mutex? The solutions looks okay to me, but
> if you have more details that would be great.

I will setup a test build to reproduce the original warning and
let you know shortly.


Cheers


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
