Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CBE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNG7/uxVEcFxZx9nIHowEON8vLg2nuTKi9fjkxt5wBE=; b=ka7UX2Q/CofUsF
	uU2eNIiL+nv/wpCGxzFe5YLeMGZmsPWa2R2H7FjJRimcV72wK+upg7XRV7VuixJPqNthbVjzQSClx
	bn9e+zwYBKjQ3KuQTZ+9ysCqPwfJqm/hEjex40vZytNTkOsDUHUYEgGQwEJjqzUz0/v9pWb8rAjWG
	prBiw0KJZa8YHbF8G9JLnQeAHtfoAy38fDSzpHNhs/L8GYNCmjyVM+x2E32A1dND9AV0L70Vp6gh5
	DPQDDIP57EGqwBDiosnUDI5ZiQ3iiLJE7CgYR8PkoiePGqldhh+lZ1HKYfUR5gKjFmvJh/Ksn3imW
	KJ7pi6a0zpVJR4cwTtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzyx-0000000BTRP-0jv4;
	Tue, 24 Dec 2024 08:09:35 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzyu-0000000BTQw-2NEg
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 08:09:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4168BFF803;
	Tue, 24 Dec 2024 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735027769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYBOmkoqoYQCX9BX1/Oyj57RvRePbSwW1FuXVuY/+1k=;
	b=hrIp5ir/oBVKPtqVecBkhLw7G4MovL8iUYOODPTqeyNS4BUkBIemX383FlRZhWDv8n9ix5
	eI+dsIkDZZzSB0Bsg/HL2Cro/RRoVAsJTUu/ggHddXNn4E3UxdRMKcOehBdsNQUp/pxEa4
	GK7WUeRROrz58lGSTb20D+k701Sw3+BAWzuLQkSOC6eNetfOQYosyaMKBqBHxVmMgJ5lc6
	bOH/aSRy9mU3cBAKNqafuVTxPDeaf78zQVVGL/zenIXboCb3pQf4AbnzdQwfckKTzUJC8o
	Qo+Lp9PqCatY5N5AzZcL88IYEzJFfOe+dg8VpWKlRJ3BkvABjoUNmZi+wqw77w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <bbrezillon@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <quic_srichara@quicinc.com>,
  <quic_varada@quicinc.com>,  <quic_nainmeht@quicinc.com>,
  <quic_laksd@quicinc.com>
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
In-Reply-To: <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com> (Md Sadre
	Alam's message of "Tue, 24 Dec 2024 10:52:03 +0530")
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
	<20241220093029.z4zsr3owdnqll2vg@thinkpad>
	<18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 24 Dec 2024 09:09:27 +0100
Message-ID: <87seqdpknc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_000932_908173_DF76EE29 
X-CRM114-Status: UNSURE (   8.08  )
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

Pj4gRG8geW91IHBsYW4gdG8gcmVzcGluIHRoaXMgc2VyaWVzPyBGWUksIHRoZXNlIGFyZSByZWdy
ZXNzaW9ucywgc28KPj4gc2hvdWxkIGdvIGluCj4+IGVhcmx5IGFzIHBvc3NpYmxlLgo+IFdhaXRp
bmcgZm9yIFNQSSBOQU5EIHNlcmllcyBwYXRjaGVzIFsxXSB0byBiZSBtZXJnZWQgKHJhdyBuYW5k
IGNoYW5nZQo+IHBhdGNoIDItNSkuIE9uIHRvcCBvZiB0aGF0IHdpbGwgcmVwb3N0IHRoZXNlIHBh
dGNoZXMuCgpXaGVuIHRoZXJlIGFyZSBjb21tZW50cyBvbiBhIHNlcmllcywgdGhlIGVudGlyZSBz
ZXJpZXMgdXN1YWxseSBnZXRzCmRpc2NhcmRlZCwgc28gaXQgaXMgbm93IG91dCBvZiBteSBzaWdo
dC4gSWYgeW91IHdhbnQgdGhlIHNwaSBiaXRzIHRvIGJlCmFwcGxpZWQsIGl0IG11c3QgbWFrZSBz
ZW5zZSB0byBoYXZlIHRoZW0gYWxvbmUsIGJ1dCB5b3UgY2FuIHNlbmQgYSBuZXcKdmVyc2lvbiBv
ZiB0aGUgc3BpIGJpdHMgYWxvbmUgaWYgeW91IGZlZWwgbGlrZSB0aGUgcmF3IG5hbmQgcGF0Y2hl
cwphcmVuJ3QgcmVhZHkuIEJ1dCBvdGhlcndpc2UgcGxlYXNlIGZpeCB0aGUgc2VyaWVzIGFuZCBz
ZW5kIGEgbmV3CnZlcnNpb24uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
