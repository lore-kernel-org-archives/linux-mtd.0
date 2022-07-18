Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D91C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 06:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN/L5XH3E3fF6mzIrStqIzlPddLdPNBGpmuEfSfGWjA=; b=h9BsP7HDYyr5yKJ+NlRovZsfSV
	385RsuqGnQwguMah7skW+cofeLfp1Qzq7kCuCsv9hUgsB55SwgS3O4omeYMS81TyfQ/6d5/0bQwb1
	HGhzT2VibmAmE5buHaisi35NQFDPatxJNsBLwRDFyIFU1PVmfxSF34IzlARngoIpnVUOso4/lLvxW
	fHvvVSdLfqOYjufONmWXtvtDwNsNBgqr9857HKSxeTH7DoDGG3eyIMVlRcM/E4KSZUqgDIFaA7Ri6
	Gg7mV0iBFAzK6Qpen7Trh57vz391UJY6ya7i6NFfrDMq2iKmyZ1cHC6zFJtONU5UMp/KbHR0ACXPD
	mNWtc6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDKhP-00BKma-PA; Mon, 18 Jul 2022 06:57:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDKhE-00BKgT-7q; Mon, 18 Jul 2022 06:57:37 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 6D6002223A;
	Mon, 18 Jul 2022 08:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658127442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sf6PNQbhIHBDnRnau7vCcYU1WYAC0tMbQT2baM/8MoA=;
	b=L52dwrCL7c6OlpAGESjGoH7cK9TT2avA32UJDm9VCLClr/id3A5YGEPSyxsggo0Qyp8vRH
	/Ot8YydJqBgAkYy26aWK1ODFrsY2gbQI6bGJ/xK2GpsW39uwONd1ewkdm6tm05G4PWHmZe
	vXW4lURrmBEmz3uL5XES166g2e8dU8s=
MIME-Version: 1.0
Date: Mon, 18 Jul 2022 08:57:10 +0200
From: Michael Walle <michael@walle.cc>
To: haibo.chen@nxp.com
Cc: ashish.kumar@nxp.com, yogeshgaur.83@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, han.xu@nxp.com,
 singh.kuldeep87k@gmail.com, tudor.ambarus@microchip.com, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 festevam@gmail.com, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 zhengxunli@mxic.com.tw
Subject: Re: [PATCH 09/11] mtd: spi-nor: macronix: add mx25uw51345g OPI mode
 support
In-Reply-To: <1657012303-6464-9-git-send-email-haibo.chen@nxp.com>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-9-git-send-email-haibo.chen@nxp.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a21533017ffa0b6e6b0903d81d1cae0f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_235736_478371_5B66AB5F 
X-CRM114-Status: UNSURE (   6.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-07-05 11:11, schrieb haibo.chen@nxp.com:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> mx25uw51345g has a special OPI DTR read command id, so add this
> special fixup.
> For RDID under OPI DTR mode, the dummy need to enlarge to 20 cycles,
> otherwise can't get correct ID value.

Could you please dump the SFDP data of this flash, see [1]. I wonder
if this command isn't described in the SFDP.

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
