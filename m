Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF48606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 05:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l0KHAxTo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=VRbDEQiJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sIwCBKIEkDuAPTTdyG5QKBbPqTqgqChpE615LxlyH9Q=; b=l0KHAxToLm4dyrCs7Qm0Re6YPp
	XL4h3rOU4ZzeHVvmipvgHnryCAeA3qE9Uo1FfX0Dwz71GiJjmcKRQbhTEC2yIYQ20tD+/gVY9cvNX
	5gnE+2cuDWQFXVfbjYP9DBpB3v9oBuV8do9ZJLqVs+nO8am27+rymTH2KZ3le4ptglDQFgGbIMU4k
	9c2/6CpeEECgbfcnedXxn7zopp2npv1uxPOvsRUfUujMF/qC6JRqbH7TvdOocN3i7wv0yXxNNwnut
	RwVfHdp1WZ2XxWtzDwaEH+PD1r5xCXpxbZ6TmDNVqMsgP156s/lLauUmoreetYEvvSd1Jp4DXIdgw
	7VAsdcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIsm-00000008PHX-3kye;
	Thu, 29 Oct 2026 05:41:00 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIsj-00000008PGh-22Et
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 05:40:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BFAA10BD4C;
	Thu, 29 Oct 2026 06:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793252446;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bC8+Xr/oJf/T5cIuTvXutc2g7ns43TmGmQIa8da+Epo=;
	b=VRbDEQiJcvIdFsAcMI+tCeU3ljrr5uXe9ansYnw14gaUjmrjAOgD69vS6eVZPtvuvgnM0q
	BxtyYx+EXZfYEc5zDvLMGY+XQHcK8sv80UC3sQxMD/U3FeUtwIV3sYOzbbdIiewpbQtkB5
	ISbYxGZ0L7IHa5ZeIfeSjQaoWwU2NA+JMjUSHtJ/VPeDEobg73rMKu5sFVBPwjdLzRwcBW
	0CbCIqpcrlQXvhWq6hEl2NBF4cKN0POx8q8HYDhaCY16IF9dn6YH9jJUrftE551BZmSXT5
	IVOaJRjba79PW4i2nR3n/m4atXjnRsFJlEdV63VASYb9WuzX+cY7FR7FZMs8Fw==
Message-ID: <5c3ab7fc-2b99-4f8c-b625-1402d1f67067@nabladev.com>
Date: Thu, 29 Oct 2026 02:06:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Maarten Zanders <maarten@zanders.be>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261024001658.222147-1-marex@nabladev.com>
 <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
 <20261028081534.945416-1-linchengming884@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261028081534.945416-1-linchengming884@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_224057_753016_DC9B5E53 
X-CRM114-Status: GOOD (  27.71  )
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 9:15 AM, Cheng Ming Lin wrote:

Hello Cheng Ming,

> On 10/24/26 2:18 AM, Marek Vasut wrote:
>> Cheng Ming , can you (or someone from Macronix) please have a look at
>> this patch and confirm that it is OK ?
> 
> I checked the patch against the MX25L51245G datasheet. RDCR (0x15),
> CR bit 3 as TB, the TB bit being OTP, and the 4-BP locking scheme all
> match the datasheet, so the description is correct from our side.
> 
> One concern, in line with the sashiko-bot comment: since locking is
> an optional feature, I think failing to read CR should not fail the
> probe. Controllers with a restricted opcode set (e.g. spi-intel) will
> return -EOPNOTSUPP for 0x15, and this part probes fine on them today
> with macronix_qpp4b_fixups. Rather than special-casing -EOPNOTSUPP,
> how about just leaving locking disabled on any CR read error, e.g.:
> 
> 	/*
> 	 * Locking is optional. If CR cannot be read (e.g. the controller
> 	 * does not support RDCR), leave locking disabled instead of
> 	 * failing the probe.
> 	 */
> 	if (mx25l51245_read_cr(nor, nor->bouncebuf))
> 		return 0;

I can add an explicit check, if (ret == -EOPNOTSUPP) return 0; , that is 
probably better than blanked ignore of all errors ?

> Michael, a related question for you. Maarten posted a series last
> year to make the RDCR opcode configurable in the core and use 0x15
> for Macronix:
> 
> https://lore.kernel.org/linux-mtd/20250922155635.749975-1-maarten@zanders.be/
> 
> It stalled because setting 0x15 for all Macronix parts is wrong (e.g.
> MX25L12805D has no RDCR), and because there was no user of RDCR at the
> time. This patch is now such a user.
> 
> I have gone through the flashes currently in the Macronix ID table
> and checked which ones do not have a CR / do not support RDCR. If it
> helps, I can add this information per flash entry, so that 0x15 is
> only used for the parts that actually support it. For IDs that are
> shared by several parts, RDCR would only be enabled if all of them
> support it. That should address the concern on Maarten's series, and
> this patch could then simply use spi_nor_read_cr() instead of
> implementing its own RDCR helper in macronix.c.
> 
> Would that be an acceptable direction?

I'll wait for input from Michael .

Thank you for your help !

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
