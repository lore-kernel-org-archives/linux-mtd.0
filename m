Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E43CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIogY1y6qpFGLNMZspInjfHEatWknqTQXDgqBnS0mrQ=; b=tzwWyIg8Teu1Ty
	eKDRjmG7uvuFTKfrp2ZIf0LpR8EfIaU2kf/j/QEPU0q+8b/Aw0OFzkVkU2EW/ughK66x3/WciLBab
	+6lst9szrlzG26W8zo5zyfze8BDZvoi7gdquvVc1kAKE1vYKacEUaxi3ltUCAv4lm78SxH8zgz6YM
	S4362wInecG8zVCdz1+e2sWrTSETX56F4cQJX6lenLSh2A/RFWZPv1sUHx7lb5Ua2+XHm72p57kFu
	SURtl7Hl89mtcbSTsehAU8FtuhKJRcs8/Sr8dSA2dRp2LplA7eoKhJ6h7128W3njizOcvu1rIiydE
	fJrRWXPDYg7dO6tc1X+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLQu-0000000HHfI-3lQB;
	Fri, 07 Nov 2025 12:19:12 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLQs-0000000HHeg-0dHR;
	Fri, 07 Nov 2025 12:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762517615; x=1763122415; i=markus.elfring@web.de;
	bh=gh34AbndNywb05Tdrv4hfUW+KpGu4PIlF7KQldm2Ahc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kqXUlxvh46iY0aZHv+TgjUUUmy6KwdG85mJvHwHzCIUAdazGB9fYcrW71s8HECgh
	 OJU3LIn5ejUPuJkJtumHHJqKWw5Lk0O4IqlNLpF111NigmvMzaqsfLuj59pMseJC3
	 hpa1tEbRZePY9Fwb3L0qtUcIl48sB9kuvhAaWXATrJf/JQUQDhA8k7/azaMpoilFK
	 RQgGEaDonhIQReqvTqhw1Pg6NguDc7Mcwg10ijXeV2Cj/tfsVyrcufslkySRGmHLq
	 fr1UQ2nfjXuN1FpfDze8tdwjijN5K5iqyKN25H8KlSc2F5gIQ/94BWUajFcfVUZjC
	 tWNTPevUUecK5zQ3yQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.187]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8T7E-1vLlCJ2mUS-00EVzZ; Fri, 07
 Nov 2025 13:13:35 +0100
Message-ID: <7857ab09-7808-4abe-9df1-66235291436b@web.de>
Date: Fri, 7 Nov 2025 13:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ubi: fastmap: fix ubi->fm memory leak
To: Liyuan Pang <pangliyuan1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 wanqian10@huawei.com, Yang Liu <young.liuyang@huawei.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>
References: <20251107100057.1091153-1-pangliyuan1@huawei.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251107100057.1091153-1-pangliyuan1@huawei.com>
X-Provags-ID: V03:K1:WjGEBZcugvueK22o/z6jyun4bxJP6+QGZkpKqoKtoo4w/XAoiFQ
 ZyTitNDrAMZlc8eVCx2rXH/HHJH5W0hbgybCc43LNrd2vFwlyeLFJuRgR1x2dQwLny6lWS9
 wk15W/fppL5wd87VP8wcSLlHCxAXEF0il/pMUiC4ShNJutzq0LUPL24hLjPuOO++lPVOaL4
 FEMXL0u0RvFqt8Eyi30Iw==
UI-OutboundReport: notjunk:1;M01:P0:UIWbAsr5TsQ=;5KN0ScWvAXDZ0O6hEkDb6zFWoBI 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 2Ow/g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_041910_543901_91D8575B 
X-CRM114-Status: UNSURE (   5.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHNjYW5fZmFzdCgpIGFsbG9jYXRlIG1lbW9yeSBmb3IgdWJp
LT5mbQo+IGFuZCB1YmktPmZtLT5lW3hdLCBidXQgaWYgdGhlIGZvbGxvd2luZyBhdHRhY2ggcHJv
Y2VzcyBmYWlscwrigKYKCllvdSBtYXkgb2NjYXNpb25hbGx5IHB1dCBtb3JlIHRoYW4gNjAgY2hh
cmFjdGVycyBpbnRvIHRleHQgbGluZXMKb2Ygc3VjaCBhIGNoYW5nZSBkZXNjcmlwdGlvbi4KaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/
aD12Ni4xOC1yYzQjbjY1OAoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
