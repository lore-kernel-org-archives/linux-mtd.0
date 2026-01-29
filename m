Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2DCD73E84
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ7YtSjKhIJfq5fkuWYN27VeJqynOQY2nrwScRvkmlU=; b=iXbYrEmNwxqCy2
	x8fXu+Lzgsu1UabyghZwQVTSvznHfoPS6nbUi4cunu7hfjkSfrfRLPR7sFllQaCIiDgNkGyOI/28E
	oKBeL0r4zJl6EtFBB+tuj2ODZjkNLVGJwFFFEWdji7v9ZaTwM9AdUuNxmlUCpiQ4ojxkZJ93pWCI2
	8cPkezzH0C2yF960+RkB2QA/pfPbO7959EEYslKLoqKPv9NtqxWrwRPaaBTfcH1GizqFJdG2lKBh6
	/dY70KLk66v6aMWA/s3GEdtWA1U4FiNdvYlBB+aTDtA/TniRpXUfnETlGozJdOxIxRAscJPpVR+vD
	bzI2PuSiU06GZgtP5DkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXcH-00000000YyH-0jVC;
	Thu, 29 Jan 2026 19:23:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXcD-00000000Yxx-3QS4
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:23:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F2A5D1A2B03;
	Thu, 29 Jan 2026 19:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B60C460746;
	Thu, 29 Jan 2026 19:23:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 346A4119A880F;
	Thu, 29 Jan 2026 20:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769714618; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V4sMXfQabzM8ew4a1pHZXG0oIC/3oBNgcTNU5oZGmoU=;
	b=r90XEPuLuPgXkQegwgnFNxAjLw8xlg/WgwDlwHS93WDObGkqtZ2KjpDu15VUAgPYchP3g5
	qkVyrs8NhFxT8DZ8yab022HRn1SCXihmGhQymQ7anFCXliFt+j55uzqEdc872dlmfkaqJM
	Pg9ANqP7E8NvXxP/ycRet0bsXMB+F1kORIiwQ2a1a9vSr15uyruNki107kcnGFcrAwhQ+I
	HaFI/ewtCjjeYWbJk8T7qM7kq+yLm4L/WinJL1cLQR0qS4GvEs689DUZmEWEjMXfgm3TIV
	k9uP4ImDWcgi4EwWqAd7K+nUrtrFZIiynBK0qeZB5uNPIJEIKyOtJiDiaynWKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,  Santhosh
 Kumar K <s-k6@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/27] mtd: spinand: Octal DTR support
In-Reply-To: <61a547d0-592c-4cf5-ae4f-54456b08e83d@sirena.org.uk> (Mark
	Brown's message of "Wed, 14 Jan 2026 11:25:32 +0000")
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
	<61a547d0-592c-4cf5-ae4f-54456b08e83d@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 20:23:32 +0100
Message-ID: <87y0lgjk97.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_112341_990500_8691A879 
X-CRM114-Status: UNSURE (   8.13  )
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

SGVsbG8gYWxsLAoKPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDBmNjFiMTg2
MGNjM2Y1MmFlZjkwMzZkNzIzNWVkMWYwMTc2MzIxOTM6Cj4KPiAgIExpbnV4IDYuMTktcmM1ICgy
MDI2LTAxLTExIDE3OjAzOjE0IC0xMDAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2Jyb29uaWUvc3BpLmdpdCB0YWdzL3NwaS1vY3RhbC1kdHIKPgo+IGZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA4NjE4MjcxODg3Y2ExMGFjNTEwOGZlN2UxZDgyYmE4ZjFi
MTUyY2Y5Ogo+Cj4gICBzcGk6IHNwaS1tZW06IExpbWl0IG9jdGFsIERUUiBjb25zdHJhaW50cyB0
byBvY3RhbCBEVFIgc2l0dWF0aW9ucwo+ICAgKDIwMjYtMDEtMTIgMTI6NDA6MzAgKzAwMDApCgpQ
dWxsZWQgaW4gbmFuZC9uZXh0IQoKSSB0aGVuIGFwcGxpZWQgdGhlIHJlc3Qgb2YgdGhlIHNlcmll
cyBvbiB0b3Agb2YgaXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
