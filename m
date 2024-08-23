Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC39C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDXfQE52MAIcX5rXFFNbFwwwtJaeB6UPTcX9ahrTfNw=; b=4PZ8o0A3oBaOpb
	/s4upjzOQV0R/NFsyUeTa+mcgdUZWxRyUEcr4YBZDKS6eozI8iuZIViVN9xicxHlFCY6rJtmUWUnI
	v6+eik4lZH7ScsW65JDK4+xcnPOY8ShQ7RmYBQKk5y8SlKO4EP3oD8TVNa0JhT6mt4RsdEPTSZp2r
	gM4BCo6Embsocj2ywBM1MfRDsLtGSHuU+aMMPFDi1Ya0Rz0gx2lBR2iPlTcSiKTca8ha8/ETTenLE
	OwWhmkTlIhzVuLlm2Ox5YPG9EOBPqdOpTMbojo+UvfcxR5eTwyXo1XXIlqn0jRwwpBzYUOBRb//2A
	R4o2wSo0TrRlsj6op4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shY3t-0000000087v-3Pmg;
	Fri, 23 Aug 2024 17:26:57 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shY3q-00000000870-25U9
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:26:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77040FF805;
	Fri, 23 Aug 2024 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHnNNmAucB+F+UYHh7l/Gly2Y+Z6lrPSVcaCZxiOZus=;
	b=IcxdC0fPP7ZahsaDMMBVeiA9jXIlR9+CT0BqjDKD0FI2kQYKQx6i7CCyVbHPsRXlKBEXTX
	HYmdvU/ubVHPyZ7iFBgfEhXKDs7cgOb6Q/vvNQ9unMUF6023u109aTjBrLCImp+duULPvQ
	fl9OIWgCtv6WUTpKTWrGIl+5r/Bf5RxhQxRZ4KQ5zIVa/SS0fbJzCRgxTjS5/LapmhkVPq
	TnM68Iq2zC+Hwubf8rNmN6oJSD5x120FzXtw0u9VkfqxePmPDMCa6ECU1bzpZMjL26CXd2
	hlTQdkrEyG6xIXbsve3gBDMMtjHiaJNAlGN8wR9frP9yxnG/nMzJWOTKvQTo0A==
Date: Fri, 23 Aug 2024 19:26:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chen Ridong <chenridong@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH -next] denali_pci: Fix missing pci_release_regions in
 probe and remove
Message-ID: <20240823192649.43c06026@xps-13>
In-Reply-To: <20240814092854.3109192-1-chenridong@huawei.com>
References: <20240814092854.3109192-1-chenridong@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_102654_946408_97EB4970 
X-CRM114-Status: UNSURE (   6.09  )
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

SGkgQ2hlbiwKCmNoZW5yaWRvbmdAaHVhd2VpLmNvbSB3cm90ZSBvbiBXZWQsIDE0IEF1ZyAyMDI0
IDA5OjI4OjU0ICswMDAwOgoKPiBUaGUgcGNpX3JlbGVhc2VfcmVnaW9ucyB3YXMgbWlzcyBhdCBl
cnJvciBjYXNlLCBqdXN0IGFkZCBpdC4KCkkgd2FzIGFib3V0IHRvIHRha2UgdGhpcyBidXQgdGhl
IHN1YmplY3QgcHJlZml4IGlzIHdyb25nLiBQbGVhc2UgZml4IGl0LgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
