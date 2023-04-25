Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6511DC77B61
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Apr 2023 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OUzuB+vWWDieIbTmibLtbKX0S4+4cy+WnJPlYi6xvgQ=; b=Mx2R9WiRZGizNe
	KbRaBBZez414t81UJBkPnMV7vfroaIehiwqWqIEc1VmbOYqDxGqGM4H1r1KqoL7RMmz0giaOLpwAn
	23mVI63nTBBmFFe7y1T3xWJ+Nk7g5gZ+AUdcTAlI/+5dm9EOOGlH1RjDxtSwBZuxVff6c9eCNrNnz
	N8M2sKhDH8j5r3VaI5G0Kj7AFXvnDT0IQCE7jgYQIk7xU3rKjnV0jgIYELt5zBEkyz7sXB7RDh4r1
	ndjF0gMo/JQmW4+d0nm3TCqrr13yW6D26clfWWgU2XfCTVWdvC7WHcBC5OtMoxkDTeYf5c6E3VoEF
	ieCh0bzI8hTLaxAmq4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDbU-000RGj-13;
	Tue, 25 Apr 2023 08:00:48 +0000
Received: from mail.tipvortexbiz.com ([51.254.102.79])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDbQ-000RBf-2b
	for linux-mtd@lists.infradead.org;
	Tue, 25 Apr 2023 08:00:47 +0000
Received: by mail.tipvortexbiz.com (Postfix, from userid 1002)
	id 2BC9845449; Tue, 25 Apr 2023 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tipvortexbiz.com;
	s=mail; t=1682409635;
	bh=P1Han34balTJAB06sltOuaQxWoVYtmotA0/1aw855g4=;
	h=Date:From:To:Subject:From;
	b=Qt1vTL6lYglAjgNtigvkl4O1cjtIeWufKltEFlyn/HqZyyTEHIJY+u7WLzU7n3ZIq
	 SRMXPbUI58Z7gupinDCVTjN+UbcBja+NKz+s8AcZ5PsGEgVLeOYR3ZeXt2CouOp6g6
	 N0+OVCbA56dUV20tfRcCkolOeAO2bJF2xrKa8gWBdcmjn9KxJn1qQnw0D+PW3RVvjS
	 bXe8pAVvqHS4TJ5C8I+4WNUdwoM0CboD4pRkYtcxbXdv3FGQckaauvfKCB+6Mhgyk2
	 SyUUUSMLo08Zo2ty7v1EIrthDLCMTOQpK8m6jRNMCZNzOEHmbR3WHP5Hax2QwwEC1x
	 kYRohtZ7CKdFQ==
Received: by mail.tipvortexbiz.com for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2023 08:00:31 GMT
Message-ID: <20230425064500-0.1.1d.2h7i.0.hqddqcifd3@tipvortexbiz.com>
Date: Tue, 25 Apr 2023 08:00:31 GMT
From: "Victor Pollard" <victor.pollard@tipvortexbiz.com>
To: <linux-mtd@lists.infradead.org>
Subject: Wake up - Audit time
X-Mailer: mail.tipvortexbiz.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_010045_589836_9D17A11E 
X-CRM114-Status: UNSURE (   2.14  )
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

R29vZCBtb3JuaW5nLAoKd2UgcHJvdmlkZSBhIHNvbHV0aW9uIHRoYXQgc2lnbmlmaWNhbnRseSBz
aG9ydGVucyB0aGUgYXVkaXQgdGltZSwgZW5hYmxlcyBzdGFuZGFyZHMgY29udHJvbCBhbmQgbm9u
LWNvbXBsaWFuY2UgcmVwb3J0aW5nOgoK4pePIEF1ZGl0cyAtIHRvIGNoZWNrIHF1YWxpdHkgb3Ig
cHJvY2VzcyBzdGFuZGFyZHMgKElTTywgNVMsIExQQSkK4pePIFNjaGVkdWxlciAtIGFsbCB3b3Jr
IGNhbiBiZSBzY2hlZHVsZWQgYW5kIGxpbmtlZCB0byB0aGUgbm90aWZpY2F0aW9uIHN5c3RlbQri
l48gQ2hlY2tsaXN0cyAtIGZvciBjYXJyeWluZyBvdXQgd29yayAicG9pbnQgYnkgcG9pbnQiIHdp
dGggYSBkZXNjcmlwdGlvbiBpbGx1c3RyYXRlZCB3aXRoIGEgcGhvdG8gb3IgdmlkZW8K4pePIE5v
bi1jb25mb3JtYW5jZXMgLSBpbW1lZGlhdGVseSByZXBvcnQgbm9uLWNvbmZvcm1hbmNlcyBhbmQg
c2VuZCB0aGVtIHRvIHJlc3BvbnNpYmxlIHBlcnNvbnMK4pePIFRlc3RzIC0gdG8gY2hlY2sga25v
d2xlZGdlIGFmdGVyIHRyYWluaW5nIG9yIChjdXN0b21lcidzKSBleHBlY3RhdGlvbnMK4pePIFN1
bW1hcnkgb2YgUmVzdWx0cyBhbmQgUmVwb3J0cyAtIHByZXNlbnRlZCBvbiBkYXNoYm9hcmRzCgpB
cmUgeW91IG9wZW4gdG8gYSBjb252ZXJzYXRpb24gYWJvdXQgdXNpbmcgc3VjaCBhIHRvb2wgaW4g
eW91ciBjb21wYW55PwoKClJlZ2FyZHMKVmljdG9yIFBvbGxhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
