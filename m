Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E8606A33C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Th11gb4L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Voz62wi7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8pBoogVGntgK78s6cLcaivY3Z+r7IC5s61ZPNYJUY5E=; b=Th11gb4LeoclfKi+yRrZHmELYj
	D9ag5JixWP+FaQNo2cVrPzWVxlwFlg7GpnROJYDAXYak1ig88JVeSTJnFaOPnJaY5usvNAdXuZUa+
	geSoJn9S9XmeMnRPISqDZwbe4J4dfbpzoPZMcPY8ACsEc6tdikZbV6PhbbD9Jz0T/yMyWIXVJTAkL
	CFXyfrd3j3vwXqWE/qh1O+KjY9uXSQq+Eg/nvDjhFzyu/us2IeGx9V3BWwkojlx3mUc7tBhNQr6uY
	XqNJTFcZMBtF0dKm7npPO4V9yJGCmBZNBBf0fUPq6nuQrBkWh4KeGMETpjhWBBRQdm46BEGI8v9jV
	d/SNCctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Q1-0000000BsVg-2Jw0;
	Thu, 19 Nov 2026 12:39:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Py-0000000BsS3-3PbX
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:39:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5CAAB4E41665;
	Thu, 19 Nov 2026 12:39:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A65860237;
	Thu, 19 Nov 2026 12:39:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3749B11BC07AC;
	Thu, 19 Nov 2026 13:39:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5uvBXVKpfHUXXnQB94Z/k3wccuWyyeiGVIjxT1gQ4H8=;
	b=Voz62wi76ErnklyF73F1jL8uSKiyeV1H8vJq3ZHq0XrZyXUqZKUD+ueNa8oOlOx1oTAN5T
	Vx04/0RCWqePLwBWlnkwep8loR6OsWfQmZLHeu1+dskuv8/FnZp6WBEOpUVAATAwt79XTe
	gPQf0YBxB831+AgmGVhwQ80RGRb6RbkrLxpo0nrFtpVqFIRE/QLy1yR5Bc8umjrdsWIjpx
	u2UVvk+w3XI5jC+h1lWwg3vU5ftehQQFkBqQ+AIpZPVnyF1Alt7j6g1ODzBSczD9CmoZvg
	+mwSWrYrjFLjU8CcB2AjTBuhjX7FjAB60req2M7Kr3pHirDTh39BeapHm4DXFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: mtdpart: convert printk to pr_* and define pr_fmt
In-Reply-To: <20261117142817.2658-1-mihai.sain@microchip.com> (Mihai Sain's
	message of "Tue, 17 Nov 2026 16:28:12 +0200")
References: <20261117142817.2658-1-mihai.sain@microchip.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 13:39:02 +0100
Message-ID: <871p8hdmhl.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043911_010667_F1598398 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTcvMTEvMjAyNiBhdCAxNjoyODoxMiArMDIsIE1paGFpIFNhaW4gPG1paGFpLnNhaW5AbWlj
cm9jaGlwLmNvbT4gd3JvdGU6Cgo+IERlZmluZSBwcl9mbXQgdG8gcHJlZml4IGFsbCBwcl8qIHBy
aW50IHN0YXRlbWVudHMgaW4gdGhpcyBmaWxlIHdpdGgKPiAibXRkOiAiLiBDb252ZXJ0IGxlZ2Fj
eSBwcmludGsoKSBpbnZvY2F0aW9ucyB0byB0aGVpciBtb2Rlcm4gcHJfZXJyKCksCj4gcHJfd2Fy
bigpLCBhbmQgcHJfbm90aWNlKCkgZXF1aXZhbGVudHMgc28gdGhhdCB0aGUgcHJlZml4IGFwcGxp
ZXMKPiBjb25zaXN0ZW50bHkgYWNyb3NzIGFsbCBsb2dzLgo+Cj4gV2hlcmUgYXBwbGljYWJsZSwg
cmVkdW5kYW50ICJtdGQ6ICIgc3Vic3RyaW5ncyBlbWJlZGRlZCB3aXRoaW4gaW5kaXZpZHVhbAo+
IHByaW50IHN0cmluZ3Mgd2VyZSByZW1vdmVkIHRvIGF2b2lkIGR1cGxpY2F0ZSBwcmVmaXhpbmcg
aW4gdGhlIGZpbmFsCj4gb3V0cHV0LgoKSSBhbSBzb3JyeSBidXQgaXQgZG9lcyBub3QgYXBwbHkg
b24gbXRkL25leHQsIGNhbiB5b3UgcGxlYXNlIHJlYmFzZSBvbgp0b3A/CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
