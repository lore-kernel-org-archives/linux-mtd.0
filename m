Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656D4C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 17:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D87206BA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 17:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cUpLrknU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VJzpvllK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D87206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o/tirtQQCyy5+NBJhMFsp0EWDRLybQB0DY1cL2eXXDc=; b=cUpLrknU6hxZLkDfXhSMwpmo9
	0IYTd6IirzOyvo8O4ryhxuygr9nsZxkHv7uI2+GBQFDiMpVHcYNeOHH8gUBRQtPzokRU0Uje6wD/p
	Ae47HGQ4qL6MsgqYuZe6Vk1RJKi36585c7pPlv/qJFt8tKzbH0f8LrhaPCEIIJSgql2lMb2U3c5HT
	mds8yMX3IcGMKzkFtnOw6Zku0AxDFPWMPrtbG/X5ag0l5wXbnRzVRqA0wy7zJ7Oe6nSLY6xnUZHY6
	UMKIaJx3qZ7VOCDAhHRQCh8UOVS0k1/IkeHAS+m/qSWCoivDbmC8hnDzfzgHr4Lygkj8kI7RJDCYX
	oIgq+RJeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGoIs-0000m1-OQ; Wed, 17 Apr 2019 17:24:58 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGoIp-0000le-Qx; Wed, 17 Apr 2019 17:24:57 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3HHOijJ092593;
 Wed, 17 Apr 2019 12:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1555521884;
 bh=yVgnOiQL608EUWHuPLXH7eDvrVEaDH7Dpfk7s4HRDzM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VJzpvllKd8av1n4Ii5yYXX1nl4IsJV+6V7vj2xN6ZZihogZ27yp32pY6lIMw1MlI/
 qzk/dhAvXAuOJuUetu/cDVzs9i/esgGS+4ktUpVgLiy4oyVRFjL9tjatjnheXlE7V6
 rtHya+ZkJSgt2cC+ayd579W8qTbYn7bvVsfsFGzw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3HHOiHc068018
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Apr 2019 12:24:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Apr 2019 12:24:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Apr 2019 12:24:43 -0500
Received: from [10.250.138.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3HHOaal044307;
 Wed, 17 Apr 2019 12:24:38 -0500
Subject: Re: [PATCH v3 0/5] MTD: Add Initial Hyperbus support
To: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, 
 Rob Herring <robh+dt@kernel.org>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9e8575e2-b8de-341d-7ab5-08055b84c805@ti.com>
Date: Wed, 17 Apr 2019 22:54:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412092923.24919-1-vigneshr@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_102455_916074_6DD0F202 
X-CRM114-Status: GOOD (  15.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei,

On 12/04/19 2:59 PM, Vignesh Raghavendra wrote:
> Vignesh Raghavendra (5):
>    mtd: cfi_cmdset_0002: Add support for polling status register
>    dt-bindings: mtd: Add binding documentation for HyperFlash
>    mtd: Add support for HyperBus memory devices
>    dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>      controller
>    mtd: hyperbus: Add driver for TI's HyperBus memory controller
> 

Thanks for all the reviews!
Were you able to test this series with your hardware? Would like to get 
this into v5.2-rc1 if possible

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
