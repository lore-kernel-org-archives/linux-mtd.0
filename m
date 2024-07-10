Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA7C3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtCVR17c35g0dI6PaaCh+IkOrJtXhVy6J6vhOvgk/8o=; b=Z23ZItxycboOJq
	C5bup2BAPZ3TrbUbhXENpOL9iLxY8/d0fkqJpJo61Ar16Fi6FMzfYbt7+yp8zLRXooip/fx79/GQh
	/y14kHS9xAE7FOOl/Pm0PvOmKevryO1YJbytdUds6ivfxov++1mVJaLEGTgoGJOoLSl7sx7ixL3Gj
	4SKELWjrPGM9XyndMf7+NfzIuWpuLVLUWoiOr+QwKmBuwQv6WAXWAMSjtKdO21K5TsOCO2vfIS49v
	gHUtjNfH/t8L6V70CsDo6wuoMxY1Z4qpuC87SYmP9urW0FfcllPsoMKhduL3+ueIEAh3i7hbuliwS
	kVkTCVK0Bu8W2aUcNeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYP0-0000000Apt0-2x0Y;
	Wed, 10 Jul 2024 14:34:38 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYOx-0000000App2-01W2
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 14:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GAM6y8fnj0Euu5w+krZO4tj7MaXUS23Xc1S4ib+0mIk=; b=pStlYLo2/DPDeFYt364zdbEe48
	QjopVVMc9xErJvDb/64k7JYtL631EN5KqkTc0fZKgmiRTlogv9dO9VK6j1iUNKKYbtpVncaWch17n
	bnFEScNpCK74BzRzqV40P218HqcXDYx5pi0ftMN1e0ERaEg7VP/STkBoWopB3eW1RjJQHaMCXX4vw
	SAnP4yuATGEReB4DmufkoK6Y7L8Ril0Gs7T95SQKYZiCC/fow6R4FGAAruCmuanvfmo80/gq1oeGx
	rNeJzRUJ75ZfDPRP4YoTsGvMALE3zOtXh6kUDy6B35XHmHrVAFT1yp8sMa3pRHWBOJvsZMDmOaxiN
	LgtRTFEg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sRYOW-000LnL-US; Wed, 10 Jul 2024 16:34:08 +0200
Received: from [87.49.147.209] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sRYOV-000GU1-10;
	Wed, 10 Jul 2024 16:34:08 +0200
From: Esben Haabendal <esben@geanix.com>
To: Erez <erezgeva2@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Jaime Liao
 <jaimeliao@mxic.com.tw>,  leoyu@mxic.com.tw,  Alvin Zhou
 <alvinzhou@mxic.com.tw>,  Julien Su <juliensu@mxic.com.tw>,  Erez Geva
 <erezgeva@nwtime.org>,  linux-mtd@lists.infradead.org,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  devicetree@vger.kernel.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
In-Reply-To: <CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
	(Erez's message of "Wed, 3 Jul 2024 10:23:16 +0200")
References: <20240629103914.161530-1-erezgeva@nwtime.org>
	<20240629103914.161530-4-erezgeva@nwtime.org>
	<1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org>
	<CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
	<CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
	<1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
	<CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
	<3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org>
	<CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
	<9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org>
	<CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
Date: Wed, 10 Jul 2024 16:34:07 +0200
Message-ID: <875xtd48ps.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27332/Wed Jul 10 10:36:46 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_073435_064323_A50B1402 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Erez <erezgeva2@gmail.com> writes:

> On Wed, 3 Jul 2024 at 09:12, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>> On 7/3/24 12:16 AM, Erez wrote:
>>> On Tue, 2 Jul 2024 at 07:00, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>
>>> The table below uses fixed width characters.
>>>
>>> ID      Part.         Size              Status          SFDP status
>>> according to spec.
>>>                                                         New chip with
>>> SFDP for EOL
>>> c22012  MX25L2005(A)  SZ_256K =  2Mb    EOL             MX25L2006E
>>> c22532  MX25U2033E    SZ_256K =  2Mb    EOL
>>> c22013  MX25L4005A    SZ_512K =  4Mb    EOL
>>> c22533  MX25U4035     SZ_512K =  4Mb    EOL
>>> c22534  MX25U8035     SZ_1M   =  8Mb    EOL
>>> c22016  MX25L3205D    SZ_4M   =  32Mb   EOL             MX25L3233F
>>> c29e16  MX25L3255E    SZ_4M   =  32Mb   EOL
>>> c22017  MX25L6405D    SZ_8M   =  64Mb   EOL
>>> c22018  MX25L12805D   SZ_16M  =  128Mb  EOL             MX25L12833F
>>> c22538  MX25U12835F   SZ_16M  =  128Mb  EOL
>>> c2253a  MX66U51235F   SZ_64M  =  512Mb  EOL             MX25U51245G
>>> c22010  MX25L512E     SZ_64K  =  512Kb  NO_REC          Have-SFDP!
>>> c22015  MX25L1606E    SZ_2M   =  16Mb   NO_REC          Have-SFDP!
>>> c22536  MX25U3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
>>> c22816  MX25R3235F    SZ_4M   =  32Mb   NO_REC          Have-SFDP!
>>> c22537  MX25U6435F    SZ_8M   =  64Mb   NO_REC          Have-SFDP!
>>> c22019  MX25L25635E   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
>>> c22539  MX25U25635F   SZ_32M  =  256Mb  NO_REC          Have-SFDP!
>>> c2201a  MX66L51235F   SZ_64M  =  512Mb  NO_REC          Have-SFDP!
>>> c2261b  MX66L1G55G    SZ_128M =  1Gb    NO_REC          Spec. is not public
>>> c22314  MX25V8035F    SZ_1M   =  8Mb    PROD            Have-SFDP!
>>> c22815  MX25R1635F    SZ_2M   =  16Mb   PROD            Have-SFDP!
>>> c2201b  MX66L1G45G    SZ_128M =  1Gb    PROD            Have-SFDP!
>>> c2253c  MX66U2G45G    SZ_256M =  2Gb    PROD            Have-SFDP!
>>> c2253a  MX25U51245G   SZ_64M  =  512Mb  PROD            Have-SFDP!
>>>
>>> EOL     End of Life
>>> PROD    Normal Production
>>> NO_REC  Not recommend for new design
>>>
>>>
>>
>> not sure what you want me to do with these.
>
> That we can read SFDP for all chips from Macronix.
> Only old chips before 2010 do not have SFDP.

So, should we try and identify new chips (with SFDP) that re-use the ID of all the
above mentioned EOL chips that does not have SFDP?

As I read the communication from Macronix, then we should expect new
chips re-using the ID for all of them. It is just a matter of digging.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
