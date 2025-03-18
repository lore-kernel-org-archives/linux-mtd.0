Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58070C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/ZUsPc4WOYUvn383hla+2RTUqgvLQ8oHyd5ILST0rQ=; b=UZPI3+r+2aHh/Q
	+bMH0ijJCdRiBhH2QVw9gBTyzTFJI2xdx8xj7H4njS7Wg/Pt3zhUcD8X48mQPy304PtXRYNzBdl0l
	hR+evRqGxW+WXSmsFudR63/QxW0NHdnvHhHLuuwYksqjIFUoAlV4mHivYo4TQ37JZ+nlKruwuftcB
	oho8XKNu82/ZDpYuE7IOQDhuQFGn6A7JERtPOfIqOEoSpi6Gk4o93xP5x/WC7v1eu/6lBSZ3NMAtp
	MHCHDT4dmZOyJJWJ0kRq/6emaKwQvlsrnIe/3e92IT7txnykEKtouEIU4FC27NfndwyHOOlTqkZ4E
	2eV2HIMr8sdMCD6546Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVkw-00000005pzv-2BBS;
	Tue, 18 Mar 2025 12:09:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVfa-00000005ozc-3T4C
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 12:03:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4462207f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742299421; x=1742904221; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EIvZ3Wp+90RhosIdCp8kn3gSMcgQFE9Tp7I7nCfwJ0E=;
        b=hwrQIKyrdD5UWin6bvJjKdprj70PuUHsAn4+rQx2EquWs5FaE9lt7ppIV0lDOTtU08
         sPoBPIAsUZqDL2tf+E3yQ6yKxZMWLW+d14xdCJXVHD87K5LrWykCXBkhzKj8s+XKuEmD
         8Ph1f9NLBe6Dk3IywDdv+aWr98FPFB9fXR87vrAfNWIrbtJVWCHIryKvwsZjDDXaEswH
         vzOeAOB2OYTLnMv88Nng9Uf7T8tl9+KB6dwlMauHr/mMxy5WNRWPPYCLNk1aVmF8lnr4
         spPgziXUmAbti0/kCOhV83wiyb1IHytIWCAzuWLJvnst4uTyii/gBK+v77zEirq1cDZW
         z7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742299421; x=1742904221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIvZ3Wp+90RhosIdCp8kn3gSMcgQFE9Tp7I7nCfwJ0E=;
        b=mMrMQwc35mZhnXF9xQS7WAbtqDUMHR72rfcLhfK5ZLbRmkecp4AupnEbVF3frEkh5e
         GepsIvszyEObMPpdRC8CcWCjvnumiklGmMKDZ57veZ0Jtc2uLSai3RfW8DUOU64UW8kO
         X4KtVropV3KqDD0zQj6uLbFBEIa/NXwA14Kfc+J4a7+B+fXe/dWutdT982A/cXaP36mt
         qMz8zsLG/JQp12Qog+jGGPy2ftWns6mmWTcwYc/E3RvYvwvMvXvGSFTXwoqy4WkTneis
         3En+l5RzDjlOvoIBaFVXvtIye+2HUlYvH/dy9Wjge0KaY0N4oNJN9ZOBxjGLGH9WqevV
         qOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCmuRCoD3a1L9iZbQ7lPaaIXt8FmTKNmXdYE2y45xhf6MGhmvqEYVuSsl3zxqkLz+YXkYKHCmWi/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWxBTXiNQ/LopWxxPSZi6NlRBjUxOMxiR9cZmmK2JeRCjDqunm
	E9waEeKX0jt6a2YlDkroZ+IfdVgI9J6b0BGhBfdFJTXW6I86q3hV0oawYKNWlYo=
X-Gm-Gg: ASbGnct5tEPq2alx8oA43lZYB7rV5WhJSUz+xebMINcOoUf9fX3Ks4PB3FaA0US8avC
	enS19EGU5yDHvy7vYt/sxC16H+fiGPN9ZgLwDsnBdKY6QoniRvSLxzOk37L3aSlyKJMldJG34+3
	GnD1yUJVhvR62WcrPueMs+RmMJuvoypes9RA2Nqv5VcGK//t9tBLn68x6p75uADZrjsP/zoUjWG
	PO/ClLOoYrDqHIGHqtz00SsJJDOFs6JVcZSPfk2mp6I2xxWUGCWoEsf068/THE8Jdp4EmS1IC8w
	7nGdfX6tkQvrkGy0WXhbMRZlEmsldj0gQIEi9ps7Nd9otbQgAQ==
X-Google-Smtp-Source: AGHT+IFpsBv5twsMP6fmrTzI785OG9MT2p6MsEQHUu8xAsUGZO1uS02mqQn/S4PSHW3veon64U20Lw==
X-Received: by 2002:a5d:588c:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3996b47cab3mr2750146f8f.27.1742299420841;
        Tue, 18 Mar 2025 05:03:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c8e43244sm18330917f8f.60.2025.03.18.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:03:40 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:03:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, cocci@inria.fr,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] mtd: cfi_cmdset_0001: Fix exception handling in
 cfi_intelext_setup()
Message-ID: <7eee35fe-0d88-4f38-b381-1ea2ee4a4715@stanley.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
 <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_050342_873000_58CF9565 
X-CRM114-Status: GOOD (  12.73  )
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

T24gVHVlLCBNYXIgMDQsIDIwMjUgYXQgMDg6MjE6NTNQTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2Uu
bmV0Pgo+IERhdGU6IFR1ZSwgMjEgTWFyIDIwMjMgMjA6MTM6NTEgKzAxMDAKPiAKPiBUaGUgbGFi
ZWwg4oCcc2V0dXBfZXJy4oCdIHdhcyB1c2VkIHRvIGp1bXAgdG8gYW5vdGhlciBwb2ludGVyIGNo
ZWNrIGRlc3BpdGUgb2YKPiB0aGUgZGV0YWlsIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUg
ZnVuY3Rpb24g4oCcY2ZpX2ludGVsZXh0X3NldHVw4oCdCj4gdGhhdCBpdCB3YXMgZGV0ZXJtaW5l
ZCBhbHJlYWR5IHRoYXQgYSBjb3JyZXNwb25kaW5nIHZhcmlhYmxlIGNvbnRhaW5lZAo+IGEgbnVs
bCBwb2ludGVyIGJlY2F1c2Ugb2YgYSBmYWlsZWQgbWVtb3J5IGFsbG9jYXRpb24uCj4gCj4gKiBU
aHVzIHVzZSBtb3JlIGFwcHJvcHJpYXRlIGxhYmVscyBpbnN0ZWFkLgo+IAo+ICogRGVsZXRlIGEg
cmVkdW5kYW50IGNoZWNrLgo+IAo+IAo+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5n
IHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgo+IAo+IEZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51
eC0yLjYuMTItcmMyIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1
c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgpEb24ndCB1c2UgYSBGaXhlcyB0YWcgZm9yIGNsZWFudXBz
LgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
