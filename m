Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA90E77177
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSIMou/kQ3Mu+rz7PLnHCVwfYbp9fKU9x2R9dKTpUDw=; b=PsljlPyBgVhlPo
	a13xkLt+5muXoeK1eyC29JvrTv/ZczG6/UIaInJyZhbi6i3RRJZcpTymA3MxPdJPOQ8H+lPraPauy
	8LeIYLFVvRzmQWMo5nu1fcpYHFtwgt0ISU6TOJqZuDuZbpNUWgIPCpyQ1mV80CjwpI7m1s8A8SKhx
	RZSP3vh2MAC/LtSoTB91fh/L1kIaeQ+JbCuoLCbllDnyuDQ9Ep/A1gx0Jp8YzfQALXTrW/dkJXmmb
	u6KjQAObs0wPq+CLuHPH0PcF/OxvU2WAsG3PY90rS0goG0TDofTFvHkOiYsPjg3d4YOHLw2eliWuZ
	/OMl3K7AcDi1e1kGwBEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVm-0000000Fpk3-2i2w;
	Thu, 05 Dec 2024 11:59:14 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ka-0000000FZwP-1FoD
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51171FF811;
	Thu,  5 Dec 2024 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbsfiqYj1ifzeatiLyPttFuuZoYkeiDn0iP87+pXA7o=;
	b=psjIjihTe0sIpRIsRDal8t5gyXKwF5Eu/TtF8Gss8VM0spU84JFxjE+lqnyluXhMXbIoed
	oHs/omL6TqhBxyluvlixo2dXMo3m1X5jQ2B5fxXemWcFFrbcT4j2J3qgv2I8uyz/Njnl9b
	qFIzeTTy6PWRDjQLaPOvUOtqxF08n0jF+AiID+DiONYxMhoBdEFUcgJCs14izNbpbur6wC
	hRlqrPbNWCtoKLGj4zBeHB+ZsWdFbT2KG0a+NVWPNs7aZzwEq+9Ru7AHZNe8u1NV4sF49z
	xo2Pk7dFJCs0X9/NHMyLnoEXRMo2mKvxW/66IFeBn3tc7LgsbFXjtVmeeZQIDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	linux-mtd@lists.infradead.org,
	Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: arasan: Fix missing de-registration of NAND
Date: Thu,  5 Dec 2024 11:43:26 +0100
Message-ID: <173339519118.766262.1347543530150986728.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Z04DXNytjhFWuGFv@UBUNTU-PF54DSY0>
References: <Z04DXNytjhFWuGFv@UBUNTU-PF54DSY0>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024336_618366_968C9CE0 
X-CRM114-Status: UNSURE (   7.95  )
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

T24gTW9uLCAwMiBEZWMgMjAyNCAxOTo1ODozNiArMDEwMCwgTWFjaWVqIEFuZHJ6ZWpld3NraSB3
cm90ZToKPiBUaGUgTkFORCBjaGlwLXNlbGVjdHMgYXJlIHJlZ2lzdGVyZWQgZm9yIHRoZSBBcmFz
YW4gZHJpdmVyIGR1cmluZwo+IGluaXRpYWxpemF0aW9uIGJ1dCBhcmUgbm90IGRlLXJlZ2lzdGVy
ZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHVubG9hZGVkLiBBcyBhCj4gcmVzdWx0LCBpZiB0aGUgZHJp
dmVyIGlzIGxvYWRlZCBhZ2FpbiwgdGhlIGNoaXAtc2VsZWN0cyByZW1haW4gcmVnaXN0ZXJlZAo+
IGFuZCBidXN5LCBtYWtpbmcgdGhlbSB1bmF2YWlsYWJsZSBmb3IgdXNlLgo+IAo+IAoKQXBwbGll
ZCB0byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogYXJhc2FuOiBGaXgg
bWlzc2luZyBkZS1yZWdpc3RyYXRpb24gb2YgTkFORAoKUGF0Y2hlKHMpIHdpbGwgYmUgYXZhaWxh
YmxlIHdpdGhpbiBob3VycyBvbjoKbXRkL2xpbnV4LmdpdAoKS2luZCByZWdhcmRzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
