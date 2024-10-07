Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013E1CFB440
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iBBlOEP+AfXj37+rXCzcg2cjVWKb9Q3tG4b1dTqPFE=; b=BhcfJrpNwaRSQ7
	fqzrdhREfLxaa4mLBGQwTQ9WdK7QXVpLxNc4PZ+gfsf+FWVPzY/ZWUHr2mkXbFc+UQuC5MYD/uSNz
	BnI6WzMHC1Am4qIRWtYCSPHaKLqjhGQYbfS3oZtLTByyeuQeJ56uhd2v5gc+JL/uXx5/or9qCsDdE
	bpWwaSD8DQBaABFUc0vn0yJwU+6c6FNjlyVNGioUdlrfPeG+zIoonCXJXSWDgM6i4tcEKhhUt95+8
	nKK084Fzj8pG/YRUfcyOQG2DPOE6Q52PxhZF+Oj+jc/SN/I7Is4mQbLIBwgeST3NYPiPmgGfHgmqG
	jNlibWKh1ZdZcVTlrh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjCa-00000001mfN-1vGs;
	Mon, 07 Oct 2024 08:34:48 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjBO-00000001mNn-36sW
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 08:33:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC6F7C0011;
	Mon,  7 Oct 2024 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728290012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Hv+QF0dRJ2k6EVk0uFwLfeCUGUaSBoGwqxeMLRcXqM=;
	b=bktzmFqTG68wWf6m+vXzP+JSjNzZ+mXk5kzyTR/41+OPoM/mmSsY2JOvGZdaB9OxkRvv4m
	q6+oEHbiItdYhgZ/yzkPI9ylG9C4yUqxC7/ZLfN7b6nwB+ljdenrbQAdOX/CUlyNh4w/6M
	h981bvc416/DtUOP6iqlqdb4Ys3kXSFc+EXFpa8uWq+qd9Hwb+xK/SYIY1GTtHAaznFgRs
	i7alzKAiRiyQ7zffIhVdhhW3bzvxRQ/DTqd/MQSgx7mskRNriIGhRv3d2F1Yhh+maoM8Z0
	HP3hKDFCiRzQUuixdPFTNd1tsf1J5quizzhBFRu5oJbinmonMyPAI572XPVl4Q==
Date: Mon, 7 Oct 2024 10:33:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw,
 leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spi-nand: Add fixups for read retry
Message-ID: <20241007103331.55f37dcb@xps-13>
In-Reply-To: <CAAyq3SbP4kSW47ZaT7V9ZzeHauj_EwfU5GPipZjNK6j69qm7Vw@mail.gmail.com>
References: <20240905055333.2363358-1-linchengming884@gmail.com>
	<20240905055333.2363358-2-linchengming884@gmail.com>
	<20241001114039.67bab21e@xps-13>
	<CAAyq3SbP4kSW47ZaT7V9ZzeHauj_EwfU5GPipZjNK6j69qm7Vw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_013334_943374_D9643445 
X-CRM114-Status: GOOD (  12.43  )
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

SGkgQ2hlbmcgTWluZywKCj4gPiA+IEBAIC0zMjUsNyArMzczLDggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGluYW5kX2luZm8gbWFjcm9uaXhfc3BpbmFuZF90YWJsZVtdID0gewo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ1cGRhdGVfY2FjaGVfdmFy
aWFudHMpLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9IQVNfUUVfQklULAo+ID4g
PiAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5
b3V0LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG14MzVsZjFnZTRh
Yl9lY2NfZ2V0X3N0YXR1cykpLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG14MzVsZjFnZTRhYl9lY2NfZ2V0X3N0YXR1cyksCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICBTUElOQU5EX0ZJWFVQUygmcmVhZF9yZXRyeV9maXh1cHMpKSwKPiA+ID4gICAgICAgU1BJTkFO
RF9JTkZPKCJNWDM1VUYxR0U0QUMiLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9J
RChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweDkyLCAweDAxKSwKPiA+ID4g
ICAgICAgICAgICAgICAgICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMTAyNCwgMjAs
IDEsIDEsIDEpLCAgCj4gPgo+ID4gSSBleHBlY3QgYSBwYXRjaCB0YXJnZXRpbmcgdGhlIGNvcmUg
Zmlyc3QsIGFuZCB0aGVuIHRoZSBjaGFuZ2VzIGluIHRoZQo+ID4gTWFjcm9uaXggZHJpdmVyLiAg
Cj4gCj4gR290IGl0LCBzbyBkbyB5b3UgcHJlZmVyIHRoYXQgd2Ugc3dpdGNoIHRvIHVzaW5nIGZs
YWdzIGluc3RlYWQ/CgpOb3QgbmVjZXNzYXJpbHksIGRpZCBJPwoKLi4uCgo+ID4gPiAgICAgICBj
b25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFjdHVyZXIgKm1hbnVmYWN0dXJlcjsKPiA+ID4gICAg
ICAgdm9pZCAqcHJpdjsKPiA+ID4gKyAgICAgaW50IHJlYWRfcmV0cmllczsgIAo+ID4KPiA+IEFu
eSByZWFzb24gdG8ga2VlcCB0aGlzIHZhcmlhYmxlIHNpZ25lZD8gIAo+IAo+IE5vLCB3ZSBjYW4g
c2ltcGx5IGNoYW5nZSBmcm9tIGludCB0byB1OC4KCkp1c3QgdW5zaWduZWQgaW50IGlzIGZpbmUu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
