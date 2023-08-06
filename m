Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DA7C001DE
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Aug 2023 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mSTC2IU9qxy52mu2TXmZh9kF9Ed+5OyEzaeGCTxBVE=; b=cduUeHnlSkhKNm
	I2tZObDwrmP1ibj2/cIcV7N9pz/x6Zcj8uStgrN7srBgU9hECYXX8CjEfRKW/1SWBCmIWB0eFhqlq
	vzYkVO0OYW1Y9vDzSO3c8lxYuq9UYShzBbingOLx8AgJGxqZETi5qk9HlzmJse/dXjiRVcUqOQsiG
	cWCPY6zQfUWxkhFOrZTJqQB1X8zbXk783tcOh8tIUJW2ag+6OX//L4aU0zepzHoerdmUZPFlqTG8G
	EtpWtpP/t3xU7xOxi+Kz9OX4gYKewlXWe4PXoZqtNQqo0y3TpQEAMaOBrmKCdrbpWBk1n6jNjkysa
	tzzNF0PNlBBh3dYvPP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSeCB-00FTmW-3B;
	Sun, 06 Aug 2023 13:53:23 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSeC7-00FTlc-1W
	for linux-mtd@lists.infradead.org;
	Sun, 06 Aug 2023 13:53:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A97F60002;
	Sun,  6 Aug 2023 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691329992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TJwmH1VAaVUby7B2ggdKHz6qTZN1WrfvAnDCRYPT2M=;
	b=LVBbhNkVmDLL8S5YYhzxmw8HeNAwsDUhfSmGoubZw5qz6fjFv0oJQS9edRoU1BHV6c+TtJ
	iuxF9lL6WcVGlSUEznhyiPw8lc9rmVsoMuvpqBLJUSzTN3CNytBCM5QEFe9HHy9lHc9SlT
	sZe4EYE3L+b7y+AN3lc686xsqVIXBo8LDUp/I9y4dszjM2NcUHh6WPVw7qzVmpFaQ/oePJ
	yGTDwqMGeT1BJYCzaRpFYVmwUE8T1vXZKuF/PvXnc6KN1dhvuipmwRhlg32XWLZ/jDdqH9
	2+PO98fIIXQjLZPsbw51xUwA4YheByP2Z1EXf9X7ny6vtCnRGX41+r0ThHuQag==
Date: Sun, 6 Aug 2023 15:53:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
 dan.carpenter@linaro.org
Subject: Re: [PATCH 00/10] mtd: rawnand: qcom: Bunch of fixes and cleanups
Message-ID: <20230806155309.25427927@xps-13>
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_065319_674550_3E3F9562 
X-CRM114-Status: UNSURE (   8.69  )
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

SGkgTWFuaXZhbm5hbiwKCm1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnIHdyb3RlIG9u
IFNhdCwgIDUgQXVnIDIwMjMgMjM6MTE6MzYKKzA1MzA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBUaGlz
IHNlcmllcyBoYXMgZml4ZXMgZm9yIHRoZSBzbWF0Y2ggd2FybmluZ3MgcmVwb3J0ZWQgYnkgS2J1
aWxkIGJvdCBbMV0KPiBhbmQgYWxzbyBzZXZlcmFsIGNsZWFudXAgcGF0Y2hlcyBiYXNlZCBvbiBt
eSBjb2RlIG9ic2VydmF0aW9uLgo+IAo+IEkndmUgb25seSBjb21waWxlIHRlc3RlZCB0aGlzIHNl
cmllcy4gU28gbGV0J3Mgd2FpdCBmb3IgU2FkcmUvU3JpY2hhcmFuIHRvCj4gZ2l2ZSBhIHRlc3Rl
ZC1ieSB0YWcgdG8gbWFrZSBzdXJlIEkgZGlkbid0IG1lc3MgdXAgYW55dGhpbmcuCgpJIHJldmll
d2VkIGFsbCB0aGUgcGF0Y2hlcywgdGhleSBsb29rIGdvb2QgdG8gbWUuIEknbSB3YWl0aW5nIGZv
ciB0aGUKdGVzdHMuIFBsZWFzZSBwcm92aWRlIHRoZSBvdXRwdXQgb2YgbmFuZGJpdGVycnMgLWku
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
