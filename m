Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C12D78333
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMvWUuB1VS6KVVubVObMOSjNrwrEdN+KkoBFiQ/NPwU=; b=r4oU4yQnhcUQFc
	WRkOMh0IMF1n7PmqGx/HKI7bUQjkuk/DBEP0n0f+K+4CGAyJNg8yi4qeRH6G0I+nKX6PsAB/zTzmb
	UeGpmtnjTIxMyJCU1JWSvFEAuEQ/Yv0V0QCm0inXa8iOKz97sw3dbz3jlQ42pMMeYaj5EYvHpPpr+
	DQ58RfTW8UutEkGr/yPsf+dsV1caSoEfPJfdRavxnua00hIw0BXOkp5IIEZJ+wBunJ7EfRkJekx5I
	2zll7pbYlrpcAdAdHEj3N3Uh6cJuqG0kQKGN6idNgOVpXA4oLmvSDhIrwIXgmHsnzqIaEriMZVhj1
	hLMomEEtgFdqLLxbkvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9dZ-00000006vKp-2IUC;
	Mon, 02 Dec 2024 16:51:05 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9dX-00000006vK0-04iC
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 16:51:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A50740005;
	Mon,  2 Dec 2024 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733158259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SOQpcERUpWNCO6DfB8JnkTi1uPdgkPFL0MjAUUnaKc=;
	b=iqetGy2wlWIUvFBZdDt0uwmyZlhxoPXhMpKYn9pyAq2hC3uhUGeWaD5Rld2MDnCnqWeysw
	4qxpoG9cFfAoiuOHvUTSPfsi7tLtMgM+k3CkQ/nXw0NotmOLaPP7/0j/56IpTG/w1T5lGY
	Y00O7BE9e5BEAWqc2t3ouhisBQW8kNY3z1Y4IKb4UxqyUYBlCeKh9OSUPqPJn0E+TQNCWb
	aO+EXdNYnRPgZsZ0UmOEuiopFha27qVeUU1poqelkSqnQW1+VM9zL6q4UvDp+NnD7gfDIV
	YbEtZHBprLTWjWxh0QV8Vxwrd8xF4gcWzzwZNM1WEsfLMLgulxQZHb4Qcx4UfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <manivannan.sadhasivam@linaro.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-msm@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <quic_srichara@quicinc.com>,  <quic_nainmeht@quicinc.com>,
  <quic_laksd@quicinc.com>,  <quic_varada@quicinc.com>
Subject: Re: [PATCH 0/2] QPIC v2 fixes for SDX75
In-Reply-To: <20241119092058.480363-1-quic_mdalam@quicinc.com> (Md Sadre
	Alam's message of "Tue, 19 Nov 2024 14:50:56 +0530")
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 17:50:57 +0100
Message-ID: <877c8i6nbi.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085103_192577_09799AF1 
X-CRM114-Status: UNSURE (   4.14  )
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

CkhlbGxvLAoKT24gMTkvMTEvMjAyNCBhdCAxNDo1MDo1NiArMDUzMCwgTWQgU2FkcmUgQWxhbSA8
cXVpY19tZGFsYW1AcXVpY2luYy5jb20+IHdyb3RlOgoKPiBUaGVzZSBwYXRjaGVzIHdpbGwgZml4
IHRoZSBmb2xsb3dpbmc6Cj4gIAo+IDEpIG9uZmkgcGFyYW0gcGFnZSByZWFkIHdoaWNoIHdhcyBi
cm9rZW4gYnkgZXhlY19vcCgpIHBhdGNoLgo+Cj4gMikgRml4ZWQgb2Zmc2V0IHBhc3NlZCB0byBC
QU0gZnJvbSBRUElDIGJhc2UKCldvdWxkIHlvdSBtaW5kIGFkZGluZyBGaXhlcyBhbmQgQ2M6IHN0
YWJsZSB0YWdzIHRvIGVhY2ggcGF0Y2g/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
