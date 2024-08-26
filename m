Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE989C5472F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xHJwyF1CGRzqMb/MaYJYcEhkV5LmyIEejpdHrCwaqVI=; b=xZouSzL07UE+2G
	hWhH5MK1wpMGt3EosVKCP2+pthsAuoJ0lheLlU5L9zG2ppmyj+4GNhl8B8m3cCLHJfXv/ywGHlO9R
	jlNFbH1lRCO993kY+wWO8+hJpgeQwzSUEmjfA2zDw2j5Zyq5jkY9OsfxHy5xr5st8P5121tjm4RM1
	qtuv+5J94nA54VJ6A0vO7ZzOsVyqHTrV0zuewyUNlYl3i28xOxso08ZNOL3iMeLIthLUFLeZDkPqw
	ntF84QwxX9MFhcjZlwSA3JZNN8bu2VHoWim3geTC5oQ/TodbAqJxMn5Jj2sunTh3eoC101SJFXmd9
	R7M8nMLC7fRbU/12ZcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMw-00000006loy-0hQN;
	Mon, 26 Aug 2024 09:50:38 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ0-00000006kSr-3Sjn
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7987C0005;
	Mon, 26 Aug 2024 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fktrxDpGjZx9RYrVOfEfR03imxbM6fKsx9kORcu0ut4=;
	b=Ync4v9ZvpDFv9GY34U5r2OPUv35zUOR/ayN7MuIvhJkdD+amP5uT8uCkZFwe/DDvfCxSl5
	XauG1uS835lPbdSDsRwPRCeEfMx4dDczYD764dT+GeO13ui+B/9zy0KNxVEvRClxVyPprl
	Jy++JhABi5yTn69k09iDyp58MkVcCFpU5cR7zmVD2LFVSnAYyO+8dNdEKSrYJPt/fL/oCj
	Ka4JWb+wQ/e/x3SjZvORXwsQkjSlpMzAyuXpddLgEcxfzn8pN2birz8agM46ro3fp9YeO2
	9q9okEASRTlrNyhXhTiIlSTRT38dkxf1auWKuho4hofnV4WrLBReQMiY78ZtTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 00/10] New options for hardening continuous read support
Date: Mon, 26 Aug 2024 11:46:19 +0200
Message-ID: <20240826094629.19065-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024635_106412_6AF26EF6 
X-CRM114-Status: GOOD (  11.17  )
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

Q29udGludW91cyByZWFkcyBjYW4gc2lnbmlmaWNhbnRseSBpbXByb3ZlIHRoZSByZWFkIHNwZWVk
IHdoZW4gc2V2ZXJhbApzZXF1ZW50aWFsIHBhZ2VzIGFyZSByZWFkLiBTdXBwb3J0IGhhcyBiZWVu
IChpcyBiZWluZykgY29udHJpYnV0ZWQgdG8KdGhlIExpbnV4IGtlcm5lbCBhbmQgaW4gb3JkZXIg
dG8gdGVzdCB0aGUgZmVhdHVyZXMgSSBoYWQgdG8gaGFjayBpbiB0bwp0aGUgbXRkLXV0aWxzIGlu
IG9yZGVyIHRvIGFkZCBzZXZlcmFsIG9wdGlvbnMuCgpUaGUgb3B0aW9ucyBhcmUgbmFtZWQgLWMs
IGV4Y2VwdCB3aGVuIC1jIHdhcyBhbHJlYWR5IGluLXVzZSwgd2hlcmUgSQpzd2l0Y2hlZCB0byAt
QzoKCiogbmFuZGR1bXA6IFdoZW4gYXNraW5nIGZvciBtb3JlIHRoYW4gb25lIHBhZ2UsIHdlIGNh
biBhc2sgdG8gZW5hYmxlIHRoZQogIAkgICAgZmVhdHVyZSBhbmQgY29tcGFyZSB0d28gb3V0cHV0
cy4KKiBuYW5kYml0ZXJyczogVGhlIGJpZmxpcHMgd2lsbCBvbmx5IGhhcHBlbiBpbiB0aGUgZmly
c3QgcGFnZSwgYnV0IHR3bwogIAkgICAgICAgcGFnZXMgd2lsbCBiZSByZWFkLiBUaGUgcmV0dXJu
ZWQgdmFsdWVzIGNvbmNlcm4gdGhlCgkgICAgICAgZW50aXJlIHJlYWQuCiogZmxhc2hfdGVzdDog
SXQgaXMgaW50ZXJlc3RpbmcgdG8gc2VlIHRoZSByZWFkIHNwZWVkIGluY3JlYXNpbmcgd2l0aAog
IAkgICAgICB0aGUgbnVtYmVyIG9mIHBhZ2VzLiBUaGUgbmV3IG1lYXN1cmVtZW50cyBhcmUgbWFk
ZQoJICAgICAgb3B0aW9uYWxzLgoKQ2hlZXJzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICgxMCk6
CiAgbmFuZC11dGlsczogbmFuZGR1bXA6IFVzZSBhIHNwZWNpZmljIHZhcmlhYmxlIGZvciB0aGUg
YnVmZmVyIHNpemUKICBuYW5kLXV0aWxzOiBuYW5kZHVtcDogRXhwbGljaXRlbHkgdXNlIHRoZSBw
YWdlIHNpemUgd2hlbiByZWxldmFudAogIG5hbmQtdXRpbHM6IG5hbmRkdW1wOiBBZGQgc3VwcG9y
dCBmb3IgdGVzdGluZyBjb250aW51b3VzIHJlYWRzCiAgbXRkLXRlc3RzOiBuYW5kYml0ZXJyczog
U3RvcmUgdGhlIGNodW5rcyBzaXplIGluIGFuIGludGVybWVkaWF0ZQogICAgdmFyaWFibGUKICBt
dGQtdGVzdHM6IG5hbmRiaXRlcnJzOiBBZGQgc3VwcG9ydCBmb3IgdGVzdGluZyBjb250aW51b3Vz
IHJlYWRzCiAgbXRkLXRlc3RzOiBmbGFzaF9zcGVlZDogRHJvcCBhbiBhcHBhcmVudGx5IHVzZWxl
c3MgYmxvY2sKICBtdGQtdGVzdHM6IGZsYXNoX3NwZWVkOiBDbGFyaWZ5IHRoZSBudW1iZXIgb2Yg
cGFnZXMgaW4gZWFjaCBzZXQgd2hpbGUKICAgIG1lYXN1cmluZwogIG10ZC10ZXN0czogZmxhc2hf
c3BlZWQ6IEdlbmVyYWxpemUgcmVhZF9lcmFzZWJsb2NrX2J5XzJwYWdlcygpCiAgbXRkLXRlc3Rz
OiBmbGFzaF9zcGVlZDogRHJvcCByZWFkX2VyYXNlYmxvY2tfYnlfcGFnZSgpCiAgbXRkLXRlc3Rz
OiBmbGFzaF9zcGVlZDogQmVuY2htYXJrIGNvbnRpbnVvdXMgcmVhZHMKCiBuYW5kLXV0aWxzL25h
bmRkdW1wLmMgICAgICAgICB8ICAzNCArKysrKysrKy0tLQogdGVzdHMvbXRkLXRlc3RzL2ZsYXNo
X3NwZWVkLmMgfCAxMTEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogdGVzdHMv
bXRkLXRlc3RzL25hbmRiaXRlcnJzLmMgfCAgMzUgKysrKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdl
ZCwgMTA2IGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
