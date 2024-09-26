Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFF5C369CE
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zUXUzIkASHB31Toicbi3LtEagR2y/Qb0gneM/uIMAU=; b=WeL6uIlOgKBjDU
	9fnXNAuBGHAZSUcrYeHYwLB909xTsf3SH77NIurCWFtnAW80S5vDWZZMZQa9AM/hsOTQ2SygZgx7i
	70YhFZ99jliWyzDYAXCUXLsXL/BehkCvr19p9FyIxwLk7x6ZlhwnFhmp+oIdKxcNYOPWlcx5Cq+Hv
	MGullgxKBCzSQExz9oQdPv3B5gFj38faWJTDOCcQpd7MIe0zPvhewnMjzsl5QjclpMd44bQdJoKzD
	QEGgr/RdAMdgO0S0oMWKO1IMJCecEQzX74f0J2Bx2AtVaMhBp9iwJ5mph33k5gPzgu7WkfVS2GNbQ
	rzsE3C9ZC9XNEy77hsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stnTP-00000008KIn-1BVi;
	Thu, 26 Sep 2024 12:19:55 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stnSD-00000008K8H-1EjC;
	Thu, 26 Sep 2024 12:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GtspPkz4ED44hgy2l6w83AQqS3e+5A0pTkCNhVxW6xg=; b=BHaQpiq/vsy+t7Eal2oau12xpW
	hmPVG2yt13UkxZJwruDvHSNwGQ+24TP72lTu9juLpOIKLKYTYW7UF/TGV30Khk+uz7BuwAehtYUmM
	ghzICwqq6doOZDaU3PsDo4eRncak5ETutz5MkTmMqrZhxlFVCVB10MEEPkmK/+zwKsNGerfDhZxvU
	OISzT2BcBxbqgII7xwHitkrghw3piIcVDQrI/N8oQaC5215kc9v9A3W9YFH6DKkSzP138+N9QNbdG
	i2UZrdDcPkQCMl0fYrrlssXoxpkgSoUei01QiZ+wylVPhbwnlFq5FVHe+Pgchh4Hi5vIV5uBJwwIW
	Tp5le0Ug==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stnSA-000HTd-9i; Thu, 26 Sep 2024 14:18:38 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stnS9-000Hc0-0F;
	Thu, 26 Sep 2024 14:18:37 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device
 id re-use
In-Reply-To: <2196b4e8-2c93-4a73-a717-28448d4668ab@linaro.org> (Tudor
	Ambarus's message of "Thu, 26 Sep 2024 11:47:33 +0100")
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
	<D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org> <87tte2hmq0.fsf@geanix.com>
	<2196b4e8-2c93-4a73-a717-28448d4668ab@linaro.org>
Date: Thu, 26 Sep 2024 14:18:37 +0200
Message-ID: <87v7yifw0y.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27410/Thu Sep 26 11:30:46 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_051841_362522_FC475EC7 
X-CRM114-Status: GOOD (  26.28  )
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

Tudor Ambarus <tudor.ambarus@linaro.org> writes:

> Hi, Esben,
>
> Thank you for the perseverance :D
>
> On 9/26/24 8:56 AM, Esben Haabendal wrote:
>> "Michael Walle" <mwalle@kernel.org> writes:
>> 
>>> Hi,
>>>
>>> On Thu Jul 11, 2024 at 3:00 PM CEST, Esben Haabendal wrote:
>>>> As a consequence, the SPI_NOR_SKIP_SFDP flag is no more, and all
>>>> drivers that have been doing optional SFDP is now marked explicitly to
>>>> do that using the SPI_NOR_TRY_SFDP.
>>>
>>> First, I haven't looked at your patchset at the moment. But I'd like
>>> to take the opportunity to discuss the following (and excuse me that
>>> I didn't had this idea before all your work on this).
>>>
>>> First, I'd like to see it the other way around, that is, doing SFDP
>>> by default and let the driver opt-out instead of opt-in. This will
>>> also align with the current "SFDP only driver", i.e. if a flash is
>>> not known we try SFDP anyway. Going forward, I'd say this is also
>>> the sane behavior and we don't have to add any flags if someone want
>>> to add support for an (older) flash with the same ID but without
>>> SFDP. With the current approach, we'd have to add the TRY_SFDP flag.
>>>
>>> Now we might play it safe and add that SPI_NOR_SKIP_SFDP to any
>>> flash which doesn't do the SFDP parsing (because it has size != 0
>>> and not any of the magic flags set) - or we might just go ahead and
>>> do the probing first for *any* flashes. Yes we might issue an
>>> unsupported opcode, but we already do that with the generic SFDP
>>> flash driver. So no big deal maybe (?). Vendors where we know for a
>>> fact that they don't have any SFDP (Everspin I'm looking at you),
>>> would of course set the SKIP_SFDP flag.
>
> Issuing RDSFDP for flashes that don't support it shouldn't be too bad
> indeed, it's not recommended, but it shall be fine. What I'm worried
> about is flashes with wrong SFDP data (see all the SFDP fixup hooks that
> we have). So my suggestion is to play it safe unless one of you guys
> step up and commit that will fix or help fix each bug that results from
> this.

Sounds like a good idea. I for one will not put my head on the table
like that :D

> I'd like you to also consider the SFDP versions and how many parameters
> they are exposing. I can't tell exactly, but if I remember correctly,
> rev A had 9 dwords for BFPT, revB 16, and revC and other more. If we
> consider static init folowed by SFDP with rollback option, point 3/ in
> your cover letter, are we sure that all the parameters that are
> initialized before parsing SFDP are overwritten at SFDP parsing time? If
> yes, we shall be fine.

How can we be sure of that?

But if you want to be really sure that no static configuraion is left
after SFDP parsing, why are we handing it a copy of nor->params that was
initialized from static configuration?

Why not call spi_nor_parse_sfdp() with nor->params bing basically
uninitialized?

And then, only if spi_nor_parse_sfdp() fails, look into flash_info
static configuration?

> Esben, to speed up the things on both ends, I recommend you for v4 to
> draft just a core patch if you care, then you can handle the vendor
> drivers. Or send us some pseudocode and we can talk on that.

I will see what I can do.

I guess some kind of RFC patch of the core changes for v4 might be a
good next step.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
