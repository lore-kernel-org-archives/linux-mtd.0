Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6A6C98324
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWxxc2ieRvG+gpBtx1uBxIZvT2ooBVV3aqsWr7pwjfE=; b=caSpkN5IUw3SY1
	BlIE1C75T+lZG5QsYt9GL3CYFMz8vxkOYZsHacqJNkbWfWawRhcitQVCgXk4KgHZvb/+mGBwryNbX
	Zp3zim90PJD1c46UEfZm/mcI9F00wm7F9Y0qZpezMZd1hiC85sLmK8kMPkFiR1d44LXYSUdBYpliJ
	Whw+Pb2LVysJ8/cgeqEVNcLwqhLB4LL9PSKORIsrsbA1hDo96ZSDoHKRsXcbLDxKn5jSFh4wm3P2Z
	s+X41f03kv1pKDNYEpI43mA/RYDEvYNO6QWqGWnnjbbpBydhytnGSnOn/WCZPRYnDcYlZtgOMpjhb
	97aYVkv4nMn3SYLpRYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uq-0000000DZjv-0PKg;
	Fri, 25 Sep 2026 14:28:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uo-0000000DZjN-1WZs
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:28:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE7961A101D;
	Fri, 25 Sep 2026 14:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B32626073B;
	Fri, 25 Sep 2026 14:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47BDD102F08C8;
	Fri, 25 Sep 2026 16:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hdiolBELxxmfQcAOx1kY9blRizk6Tupmf6uYv16AY2k=;
	b=WpQTn2YYnnlD5rAc/GZvgLWk49wfhzgSKEzildbpZ+icfaFjwzlmffcdSH+jCkC7d+iEig
	nvdU7UhNexQII16n5SRP8aQ+Ef+9F6GDHjfyhwAWpqVulBx4WpRI3dbDejoAwNvIFBOKZM
	GAmKZr88w9w+aFrxu/9ZqpuaFube701pvm25ldgiTkgCvNbHjlR09+G2fMBcKjVODJx4ka
	7k8rVCvIMMogxZHeWs5ybpATDajl9lXZ5wQwG5Y2czls56I4YJnJ2ffjmZqlN3/putUP7s
	cv84ildMyiCMD+ESd9eHq/vbxRCjUHa2mmodQOtQWRnC3flct56kPbKm38NLRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Orgad Shaneh <orgads@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916162731.307959-1-orgads@gmail.com>
References: <20260915075028.21658-1-orgads@gmail.com>
 <20260916162731.307959-1-orgads@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: cap the write-buffer chunk at
 256 bytes on an x8 device
Message-Id: <179034651513.1166139.14108595219932825310.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072842_548673_EB6AF5AC 
X-CRM114-Status: UNSURE (   8.37  )
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

T24gV2VkLCAxNiBTZXAgMjAyNiAxNjoyNzozMSArMDAwMCwgT3JnYWQgU2hhbmVoIHdyb3RlOgo+
IFRoZSBXcml0ZSB0byBCdWZmZXIgY29tbWFuZCB0YWtlcyB0aGUgbnVtYmVyIG9mIHdvcmRzIHRv
IHByb2dyYW0gbWludXMKPiBvbmUsIGFuZCBkb193cml0ZV9idWZmZXIoKSBzZW5kcyB0aGF0IGNv
dW50IGFzIGEgc2luZ2xlIGJ1cyB3b3JkOgo+IAo+IAltYXBfd3JpdGUobWFwLCBDTUQod29yZHMg
LSAxKSwgY21kX2Fkcik7Cj4gCj4gQ01EKCkgcmVwbGljYXRlcyB0aGUgdmFsdWUgaW50byBldmVy
eSBkZXZpY2UgbGFuZSwgc28gZWFjaCBkZXZpY2UgcmVhZHMKPiB0aGUgY291bnQgb2ZmIGl0cyBv
d24gZGF0YSBsaW5lcyAtIGVpZ2h0IG9mIHRoZW0gb24gYW4geDggcGFydC4gQSBjb3VudAo+IHRo
YXQgZG9lcyBub3QgZml0IGluIGVpZ2h0IGJpdHMgaXMgdHJ1bmNhdGVkIHRoZXJlLCB3aGljaCBs
aW1pdHMgb25lCj4gV3JpdGUgdG8gQnVmZmVyIHRvIDI1NiB3b3JkcyBvbiBhbiB4OCBkZXZpY2Us
IGhvd2V2ZXIgbGFyZ2UgYSBidWZmZXIgdGhlCj4gY2hpcCBhZHZlcnRpc2VzIGluIGl0cyBDRkkg
cXVlcnkuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10
ZDogY2ZpX2NtZHNldF8wMDAyOiBjYXAgdGhlIHdyaXRlLWJ1ZmZlciBjaHVuayBhdCAyNTYgYnl0
ZXMgb24gYW4geDggZGV2aWNlCiAgICAgIGNvbW1pdDogY2ZjNWViYzk1NDBlMjlmOGY5NmRiODhi
YmZhMjYxMTM5ZTVhZmVkYgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
