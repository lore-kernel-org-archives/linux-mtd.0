Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213C1C4332F
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Nov 2023 11:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8HM5yP+V8q1SfXodQ0dqJD6+ROhCMSCUnk+9562AzI=; b=nRYiFjF/xckT3v
	lj7rMTVwQBWIgRwYTA5SPzmktRXYL3QqBAVeo80amFuCqt9nybaaic1YkCByW/UENuqflPk8kKhNf
	HS9DPMNPSMMyHcNZU8WrSPFwWYIvyIE9PwifgbLJ5NrDBNUUfQ+pT/qe3f8Fyp85u4yqLf5PT+dWO
	tPSuToMWYxVgDks3P7b6mfA03W5anQP+aPTsExXHZywnL/AOGsGFb6YiJad/GNX7BhJvXG5thA9fd
	Dr/OYVcdviWfJW2eT1VLtBreVlEXirB1aPiBTWMCRKMNxd38i8+sjmPAYZn3JXhZY4YvbRY18N6KO
	nXQXUvnZMsIIvaRzu9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzETK-00DKa9-0e;
	Sat, 04 Nov 2023 11:05:46 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzETG-00DKZk-32
	for linux-mtd@lists.infradead.org;
	Sat, 04 Nov 2023 11:05:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72FF3FF803;
	Sat,  4 Nov 2023 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699095939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHbFcTSkhIRBMhVWM5dMhMlHFFh7sdOAhq0yv85qAjc=;
	b=MBMxuDmR8EC+bA2q0SElAY+yV5EE9cIRDa13fgljedOD+mGITaNkUEhHqgC4K9TFlhNxFN
	Yz3FNnzdE08LaSGz4pqMQRAdYey4nmBkgDM5QJi0YbCSTS+HTf2hZ6ZnB3pJ1QdklXVLJI
	+SpG9uUxIz1spfNJV57CgViKq3T4YtSSC1/Pl8OXVpJEHvfwDGKinLaNL+c0qEteHvVKjX
	P5ieaR0b15x3jBWqkSQki4X8ZPJZQkI2WLO/rNdsrHy78DmQz25GbGS2vJyuPlH9RXe1Gm
	QwWG07Lasz/ugZSahh4Ku0NiKIV0YQ6WGjEyvfWUiTAz3T5w7aC9GNrBANj8OQ==
Date: Sat, 4 Nov 2023 12:05:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.7-rc1
Message-ID: <20231104120536.5264c2f6@xps-13>
In-Reply-To: <60bc9593-445d-47c9-ac47-0b2e2b11756e@linaro.org>
References: <60bc9593-445d-47c9-ac47-0b2e2b11756e@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_040543_137705_6F27D1FC 
X-CRM114-Status: UNSURE (   6.14  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gV2VkLCAxOCBPY3Qg
MjAyMyAxMDoyNjoxNiArMDMwMDoKCj4gSGVsbG8hCj4gCj4gUGxlYXNlIGZpbmQgdGhlIFNQSSBO
T1IgUFIgZm9yIHY2LjctcmMxIGJlbG93LgoKUHVsbGVkIGludG8gbXRkL25leHQsIHRoYW5rcyEK
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
