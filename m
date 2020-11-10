Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC8CC388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 13:08:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B203120674
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 13:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwI+Pqlr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GWoy4PQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B203120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uvr9U+6kWULHL/KHZuUB1e1E6086XFH1xqzNE8/nDKg=; b=OwI+PqlrVSjIJqpsBv7qYy5Tk
	r3fx4aYkBRkS1ETMmAG8eJ6HmMfotmMfPVFdcqX1/5ge9xmzRhDXBNO0YTaGZw7OtiMgfZ9o/yezd
	bxkKeCzGPxP8x9sePF5JjJpebIEPHeUgXcmf/lwsGO9InGN3nLXxDsVIXfMTEVzeChZCoJvj3MrUf
	dyH+aMhrLJfIWlBvg2YVuUblY8HPLFX86ceilIXX2awHXHgqm30tH9agGfzLQTF1KTf7V+pVC6oSs
	QWAB2nLlvMWF3nscrvj3DBCy4b0qhmT7fE3OI2HGidTCqdQVo1eMZ8UFxIJh8DFE2wdNX9HIHUyfZ
	Yosc7QQ/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcTNA-00038c-9f; Tue, 10 Nov 2020 13:07:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcTN7-000382-Ua
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 13:07:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAD7a9s052202;
 Tue, 10 Nov 2020 07:07:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605013656;
 bh=F1DK+Hwo07M+h8X6tN7vDgweqrmchcY/gSM3jtcCmtg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=GWoy4PQVhXk0ko/Wrjcg4iLXq0Yo23UrokUY8WrQKichppS/XOU1eJLSfoNcFbtpb
 vXnJob1rnbKILa0BJNNHQqx3G4JSQZKUV9qU2jrzEvtMvFqUjkY2p5XEUM4ILutwKE
 9IldPziqSyI8gip+RgOYgyufjlg2CHrJxJ95dJy8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAD7ab9075247
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 07:07:36 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 07:07:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 07:07:36 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAD7Xmp029378;
 Tue, 10 Nov 2020 07:07:34 -0600
Subject: Re: [PATCH v5 0/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20201003153235.29762-1-michael@walle.cc>
 <babd96f5018d6081746aa9063ce21756@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <7e5d8d73-51b2-6c7b-9ff5-a0f08b8c01c8@ti.com>
Date: Tue, 10 Nov 2020 18:37:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <babd96f5018d6081746aa9063ce21756@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_080742_090931_50DDE129 
X-CRM114-Status: GOOD (  11.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/28/20 3:56 AM, Michael Walle wrote:
> Am 2020-10-03 17:32, schrieb Michael Walle:
>> I bundled this as a series, because otherwise there will be conflicts
>> because the "remove global protection flag" patches modify the same lines
>> as the main patch.
>>
>> See invdividual patches for the version history.
> 
> any news here?
> 

LGTM, thanks!... Will wait for Tudor's Ack before applying.

Regards
Vignesh



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
