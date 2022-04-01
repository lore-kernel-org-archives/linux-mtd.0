Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1936CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Apr 2022 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbNF//KegTsDHERpB9PPSPUlnuvW6EvyxgNqD0qMCOE=; b=Jr0dmu/B7Awc4i
	gWhuO7bs19odP0DuobHSC6Lji8ObmBwUuNXHY7o4Jbd/uX2aFdnbkGU+x8k7gQy37rSg0TwfGnvPC
	DLo/Qx5PaxBLntSc2nVCplCGsS3CYLJLvW8vvzragE935HA+vjayO5fzTU6CEXMVKwpuAfn/P+D+L
	MRo/RYZHP6vLC/9CqvjD/EiClGHz9//jDFcAkiruGguBT/rBeYNoVUcgDu3oaneFNyWq2ucxPpBmq
	CfmZW3zze/t2FhHBAIIzkG/yPYOIo/cyJTRh/MrgBXHQuI5CdXutXB45qLHbAx5maOU13llCU3ACX
	dTzfc42ixS50R/PVP/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naI2J-005w5i-RW; Fri, 01 Apr 2022 14:14:00 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naI15-005vTu-RQ; Fri, 01 Apr 2022 14:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648822363; x=1680358363;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Z6HWGEhCA14gDwvUQv/HTXsDm5KV5EQMwDPSUsHxVsY=;
 b=k3BgQIS6mHg4flDtFzRy8JxwtHou78U3jO6o9b5WiiYEsjsPgiWzA8UW
 +AdMoT5ZqlGCJCia/z65LgblxnxC+SJtZepkcgW+rU1KAU4o25hK4HMn4
 sbK/LVSRmpzOSHV0xxegBsMpA9rV8vIgEiXIeKV1/XTLJ+J/1ksyCdgJ5 E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Apr 2022 07:12:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:12:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 07:12:32 -0700
Received: from [10.110.21.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 1 Apr 2022
 07:12:31 -0700
Message-ID: <88f7b8d0-3579-d392-f19a-b60ebd340baf@quicinc.com>
Date: Fri, 1 Apr 2022 07:12:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: [PATCH v4 00/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-aspeed@lists.ozlabs.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Richard Weinberger <richard@nod.at>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20220325100849.2019209-1-clg@kaod.org>
Content-Language: en-US
In-Reply-To: <20220325100849.2019209-1-clg@kaod.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_071243_948108_95B45EDB 
X-CRM114-Status: UNSURE (   7.64  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ8OpZHJpYywKCk9uIDMvMjUvMjAyMiAzOjA4IEFNLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBIaSwKPiAKPiBUaGlzIHNlcmllcyBhZGRzIGEgbmV3IFNQSSBkcml2ZXIgdXNpbmcgdGhl
IHNwaS1tZW0gaW50ZXJmYWNlIGZvciB0aGUKPiBBc3BlZWQgc3RhdGljIG1lbW9yeSBjb250cm9s
bGVycyBvZiB0aGUgQVNUMjYwMCwgQVNUMjUwMCBhbmQgQVNUMjQwMAo+IFNvQ3MuCj4gCj4gICAq
IEFTVDI2MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9sbGVyIChGTUMpCj4gICAqIEFTVDI2
MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIpCgpUZXN0ZWQtYnk6IEphZSBI
eXVuIFlvbyA8cXVpY19qYWVoeW9vQHF1aWNpbmMuY29tPgoKCkkgdGVzdGVkIHRoaXMgcGF0Y2gg
c2VyaWVzIG9uIFF1YWxjb21tIERDLVNDTSAoQVNUMjYwMCkgYm9hcmQgd2l0aCBxdWFkCm1vZGUg
ZW5hYmxlZC4gSXQgaGFzIHdvcmtlZCB3ZWxsIHNvIGZhci4KClRoZSBxdWFkIG1vZGUgdGVzdCBk
ZXRhaWxzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlL2UzNjJmNmRk
LTc4NWYtODdiMy0zMDkwLTU1NGJlMGZiODYwY0BxdWljaW5jLmNvbS9ULyN0CgpDaGVlcnMsCgpK
YWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
