Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10A606A335
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KnPP/h1M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cgVUIfv+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5KqP7pRuAPBDeLkOzql3nMEDcXiC3pvRoRV4y2Jpfc0=; b=KnPP/h1MM1UbXgqlvO75ATEWTT
	cOnMlM4s53/mkvFkUK29/yMPQ0CblI6kBj+N3COCnHUIHkoW4m8P6OBL9KzV2l9cWX+LjSZT7FP/V
	N8f4WXIYaEr2ajkttQT2dBahbBlLhZDvF8IopEVUsKx4EM5IQf932Pq9SzZzaSQ4n0Zmu8kDScebq
	FQX5LgVoDYATa41yQ2THwHrfA3khtxF8JPQQM7RbK4ATg4YiLVLFpNu9xWvBkT0NWA37bXd2GxEeT
	vj4cghWApOA8jLWFYl1TjO5htdUI1alYMXRyS9AiA3yGaunXXkvvx7t27DB7P29ITH8fNwKJs8utA
	eYaSDWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ72-0000000FL1r-3t9j;
	Fri, 20 Nov 2026 15:01:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQ70-0000000FL0m-2ZJu
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 15:01:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B2C7C62220;
	Fri, 20 Nov 2026 15:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1A4E601B9;
	Fri, 20 Nov 2026 15:01:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D034C11BC0284;
	Fri, 20 Nov 2026 16:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795186867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O/61q62gvasmCL59xNnECoaUy283F9i0rFiASLGXdtg=;
	b=cgVUIfv+N6JKf9LGvNH/jFTiL52g8RBI/iUIgBKnQOZgsYS93kGbCIwgi8UgyqeCjF/NmR
	Gaw5UYojk7EeSbSqNXN6ZTeSkfkC5jLjPX9K0XxMQksyhXQOeCtzltP3hi6X7F6Z2VWMyl
	Q48uhtr6f/ZFxWQmtMEHAvVQTzaWWwvdtwTY8TqtczB+p+DNC9lOxOISmmJrffh7/Q4rf0
	H+MhRqyZrGL/lHboY+hsGIYVvdl4fRekAPx+4GhbJveFWxcjSQnFpen9ftgaBDx6uqXRbi
	FnCf8mhnSBs+D+II5xXKq8iEyLNsxnOHaF+5pJbgNrVfJlQtObILSZw8DEruiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: serialize dynamic partition registration with removal
In-Reply-To: <20261108-submit-mtd-partition-publication-v1-v1-1-cbff20b1351e@gmail.com>
	(James Hilliard's message of "Sun, 08 Nov 2026 14:13:59 -0700")
References: <20261108-submit-mtd-partition-publication-v1-v1-1-cbff20b1351e@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 16:01:05 +0100
Message-ID: <87h5hba6oe.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_070114_795545_C606540B 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDgvMTEvMjAyNiBhdCAxNDoxMzo1OSAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gbXRkX2FkZF9wYXJ0aXRpb24oKSBkcm9wcyBwYXJ0
aXRpb25zX2xvY2sgYWZ0ZXIgbGlua2luZyB0aGUgbmV3IGNoaWxkCj4gYnV0IGJlZm9yZSByZWdp
c3RlcmluZyBpdHMgTVREIGRldmljZSBhbmQgYWRkaW5nIHRoZSBwYXJ0aXRpb24gc3lzZnMKPiBh
dHRyaWJ1dGVzLiBDb25jdXJyZW50IHJlbW92YWwgY2FuIHVubGluayB0aGF0IGNoaWxkIGJlZm9y
ZSBpdCBoYXMgYmVlbgo+IHJlZ2lzdGVyZWQsIG9yIHJlbGVhc2UgaXQgYWZ0ZXIgcmVnaXN0cmF0
aW9uIGJ1dCBiZWZvcmUgdGhlIGF0dHJpYnV0ZXMKPiBhcmUgYWRkZWQuIEl0IGNhbiBhbHNvIGZp
bmlzaCBkZWxldGluZyBwYXJ0aXRpb25zIGJlZm9yZSBhIG5ldyBjaGlsZAo+IGlzIGxpbmtlZCwg
bGVhdmluZyBhIHBhcnRpdGlvbiBwdWJsaXNoZWQgYWZ0ZXIgbWFzdGVyIHJlbW92YWwuCj4KPiBL
ZWVwIHBhcnRpdGlvbnNfbG9jayBoZWxkIGFjcm9zcyBhbGxvY2F0aW9uLCBwdWJsaWNhdGlvbiBh
bmQgYXR0cmlidXRlCj4gY3JlYXRpb24uIFJlY29yZCB0aGF0IG1hc3RlciB1bnJlZ2lzdHJhdGlv
biBoYXMgc3RhcnRlZCB1bmRlciB0aGUgc2FtZQo+IGxvY2sgYW5kIHJlamVjdCBuZXcgZHluYW1p
YyBwYXJ0aXRpb25zIGZyb20gdGhhdCBwb2ludC4gQ2hlY2sgYmVmb3JlCj4gYWxsb2NhdGlvbiwg
d2hpY2ggY2FuIHNjYW4gdGhlIHBhcmVudCdzIGJhZC1ibG9jayBtYXJrZXJzLCBzbyBpdCBjYW5u
b3QKPiBzdGFydCBoYXJkd2FyZSBhY2Nlc3MgYWZ0ZXIgcmVtb3ZhbCBoYXMgcGFzc2VkIHRoaXMg
c3luY2hyb25pemF0aW9uIHBvaW50Lgo+Cj4gSW5pdGlhbGl6ZSB0aGUgc3RhdGUgd2hlbiByZWdp
c3RlcmluZyB0aGUgbWFzdGVyLCBhbGxvd2luZyBkcml2ZXJzIHRoYXQKPiByZXVzZSB0aGVpciBN
VEQgb2JqZWN0IHRvIHJlZ2lzdGVyIGl0IGFnYWluLgo+Cj4gRml4ZXM6IDVkYWE3YjIxNDk2YSAo
Im10ZDogcHJlcGFyZSBwYXJ0aXRpb24gYWRkIGFuZCBkZWwgZnVuY3Rpb25zIGZvciBpb2N0bCBy
ZXF1ZXN0cyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KCi4uLgoKPiAt
LS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMK
PiBAQCAtMjc4LDI4ICsyNzgsMzQgQEAgaW50IG10ZF9hZGRfcGFydGl0aW9uKHN0cnVjdCBtdGRf
aW5mbyAqcGFyZW50LCBjb25zdCBjaGFyICpuYW1lLAo+ICAJcGFydC5zaXplID0gbGVuZ3RoOwo+
ICAJcGFydC5vZmZzZXQgPSBvZmZzZXQ7CgpPcGVuIHF1ZXN0aW9uOiB3b3VsZCBhIGd1YXJkKG11
dGV4KSBwcmV2ZW50IG1vc3Qgb2YgdGhlIGNvZGUgY2h1cm4KaGVyZT8KCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
