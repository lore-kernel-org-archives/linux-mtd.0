Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4A6C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:34:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13ACA610FB
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 18:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13ACA610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C7YAN3lK9MPn+gR5wqmzP71K9D7lpAl60BdAOeF1hpo=; b=NZWQQh3BaHyxgBU+LOKXMVbMZ
	l3lM5YFWEtEQISu6G9sqp/IbwYUv5lu9NpmXThW3C0Ircxu+7ZNP6bsPsiK2eEK02tY1wrzHb6IS6
	jW4Rzitibi71TguA1umLQwNfUNwGNxD4xV6aG9DPeayV/pbw6bvc1sWXbFz+ZSrHFkIzHO4b01lQO
	D/9y01+SYYgGpcsb5gJ6X3eo3qQQfm8LoujAo7DTPDY06xtV+CzhkwgodZxyUkGywC4HXrg6/1RYA
	zvWp8ud1oj3gaOshyPpmBsWHeSnSqrQ2RMGqN+JGdPKM56tEfCDq0rXSVMIBuViiUX07Jc9AZfsVQ
	o7vetTsiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTHr-0035hU-Fb; Fri, 16 Apr 2021 18:33:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTHp-0035gu-20
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 18:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=6ikbN2NdFFCJT9hJ5tzlDv6fXutu8Fq487AzrSQelE8=; b=ksgFaMJKnRJPKGqs5MEGQTluEo
 R2TNVzPu1SdlvtUAJd0JU0KCQT1PP7r+OxW3J+pl/+eQVs8N+TJ7yJJmRSzuCZd6ktHimcZO/F35a
 clo36EzVBJA3+7T0RU9Npxeb/SykRa3H5Uvy3rb4C0vyY7SyCnIv5a6GzcaiqJVFREDIAc9FdSYpM
 iWXBO1y+EtYJBBYHeqbVBOfdmtDqFRxtCDptyky9779CZO+unqISLFJIZ1V2USoEPO5dwPpknrJ8q
 yzMFQo2uTAUh1i0iG7VwGti/mbIuo+W0HU6aMr9dC645zzfrEWFxjRzCictQUrAlhd0dMqoof0+SV
 KdDY0rTA==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTHl-009d3Y-3e
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 18:33:47 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8C4C7C0003;
 Fri, 16 Apr 2021 18:33:37 +0000 (UTC)
Date: Fri, 16 Apr 2021 20:33:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <kyungmin.park@samsung.com>,
 <michael@walle.cc>, <p.yadav@ti.com>, <jean-philippe@linaro.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: core: Constify buf in mtd_write_user_prot_reg()
Message-ID: <20210416203336.388878ad@xps13>
In-Reply-To: <20210403060931.7119-1-tudor.ambarus@microchip.com>
References: <20210403060931.7119-1-tudor.ambarus@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_113345_304027_DB20D7FC 
X-CRM114-Status: UNSURE (   8.25  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+IHdy
b3RlIG9uIFNhdCwgMyBBcHIgMjAyMQowOTowOTozMSArMDMwMDoKCj4gVGhlIHdyaXRlIGJ1ZmZl
ciBjb21lcyBmcm9tIHVzZXIgYW5kIHNob3VsZCBiZSBjb25zdC4KPiBDb25zdGlmeSB3cml0ZSBi
dWZmZXIgaW4gbXRkIGNvcmUgYW5kIGFjcm9zcyBhbGwgX3dyaXRlX3VzZXJfcHJvdF9yZWcoKQo+
IHVzZXJzLiBjZmlfY21kc2V0X3swMDAxLCAwMDAyfSBhbmQgb25lbmFuZF9iYXNlIHdpbGwgcGF5
IHRoZSBjb3N0IG9mIGFuCj4gZXhwbGljaXQgY2FzdCB0byBkaXNjYXJkIHRoZSBjb25zdCBxdWFs
aWZpZXIgc2luY2UgdGhlIGJlZ2lubmluZywgc2luY2UKPiB0aGV5IGFyZSB1c2luZyBhbiBvdHBf
b3BfdCBmdW5jdGlvbiBwcm90b3R5cGUgdGhhdCBpcyB1c2VkIGZvciBib3RoIHJlYWRzCj4gYW5k
IHdyaXRlcy4gbXRkX2RhdGFmbGFzaCBhbmQgU1BJIE5PUiB3aWxsIGJlbmVmaXQgb2YgdGhlIGNv
bnN0IGJ1ZmZlcgo+IGJlY2F1c2UgdGhleSBhcmUgdXNpbmcgZGlmZmVyZW50IHBhdGhzIGZvciB3
cml0ZXMgYW5kIHJlYWRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9y
LmFtYmFydXNAbWljcm9jaGlwLmNvbT4KCkFwcGxpZWQgb24gdG9wIG9mIG10ZC9uZXh0IGFmdGVy
IHRoZSBtZXJnZSBvZiBhbGwgb3VyIGludGVybmFsIFBSJ3MuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
