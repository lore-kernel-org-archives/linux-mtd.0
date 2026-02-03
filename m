Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99CDE8783A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8uIoE6r1SoWbBewB5dKkDRMp4LA+P/WbTj1fjzCN58=; b=dstU9N99y4qHWK
	ET7FZ2DZJBksu6934P53yuR06LduXxKWw9w8CZA8hgCj9eoSOkbBQ2pj0Jx/T1TP+KY7AfSn+7aKq
	fk3pTGIaFcVT1sI9uUZ1Mm8xOtJxngB2YLjbjSold+r8PMUp++eEX3B6q7A6d9rG9TN2O5CDAU5YE
	/OP479sUhiSR4pc2/yUu27XG743IB6FrbHgxn4YYQaf0RN9mtVC/Qt9q7OaOTy3z1BK/tBywpH2ug
	0xi4KeyVfmkQIt1m0gj8DQp/d9vJ16KCmZD8wodCA0m5wyNuYnceCa1lzE9GGMgAT0Y3JBI7Su5hD
	fibHAV5LxLFPiPunx08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHGn-00000006kPv-0EkE;
	Tue, 03 Feb 2026 14:20:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHGj-00000006kO8-1u6f
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 14:20:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10F214E423DF;
	Tue,  3 Feb 2026 14:20:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D67B060728;
	Tue,  3 Feb 2026 14:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A28D5119A8888;
	Tue,  3 Feb 2026 15:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770128436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YzHWWLyPmYVYllBbHIN2b996bUg6VSpCKy2fOccKpUA=;
	b=ITm17GomWUm3JBxrTsaokQAr56Gc76Yiuz7QkjAbmc5xKNyFmsIw8ZYF+sR7ZbrUjNqsjR
	4hMwKE6Pep4iqQVALMeMMSZSpvGWx+kT6aRqTiOAwJuJ6RwKNx0FuI07TixY4OQ2LtCpp1
	hg14v2KaywJPYxSmYLSMudYf2Z9RtZL+0xURZIwm5s5c4cDfuhzbb4eM2HGVDbjuCl6FOu
	s+9ukkIZ/waeW9gBtHFDmBnyOfPJcnIDv3kHybTu+6Mc1EO25XxewpjGVu2VdrtW+SfaP3
	KvqEYs+a3xLsovzrNrGqroHMloRf27tqs5V0PNXPmrwP6GnZNtxpAOGr2Y0ZbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Xilin Wu
 <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
	(Junhao Xie's message of "Sat, 31 Jan 2026 00:45:14 +0800")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
	<86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
	<87ecn7jin5.fsf@bootlin.com>
	<8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 03 Feb 2026 15:20:28 +0100
Message-ID: <87jywthpsj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062041_621942_AF947A65 
X-CRM114-Status: GOOD (  15.15  )
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

Cj4+PiBGb3Igc29tZXRoaW5nIGxpa2UgdGhlICJEUFAiIHBhcnRpdGlvbiwgSSB0aGluayBpdCdz
IGJldHRlciB0byBhY2Nlc3MgaXQKPj4+IGZyb20gdXNlcnNwYWNlIHRoYW4gZnJvbSBrZXJuZWwu
Cj4+IElmIGl0J3MgYSBNQUMgYWRkcmVzcyB0aGF0IHlvdSBhcmUgYWNjZXNzaW5nLCBkaXJlY3Qg
dXNlcnNwYWNlIGRvZXMgbm90Cj4+IHNvdW5kIGxpa2UgYSBnb29kIGZpdC4gSWYgSSBtYXksIE5W
TUVNIGNlbGxzIGFyZSB0aGVyZSBleGFjdGx5IGZvciB0aGlzCj4+IHB1cnBvc2U6IGlkZW50aWZ5
aW5nIHRoZSBjb250ZW50IG9mIGEgc3VicGFydCBvZiBhIHN0b3JhZ2UgZGV2aWNlIGluIGEKPj4g
c3RvcmFnZSBhZ25vc3RpYyB3YXkuIFRoZSBOVk1FTSBjZWxscyBhcmUgbWFkZSBhdmFpbGFibGUg
dG8gaW4ta2VybmVsCj4+IGRyaXZlcnMgKGllLiBuZXR3b3JrIGRldmljZXMgaGF2ZSBhbGwgdGhl
IGluZnJhc3RydWN0dXJlIHRvIGdldCB0aGUgTUFDCj4+IGFkZHJlc3MgZnJvbSB0aGVyZSkgYW5k
IHRoZWlyIGNvbnRlbnQgaXMgYWxzbyBleHBvc2VkIHRvIHVzZXJzcGFjZQo+PiB0aHJvdWdoIHN5
c2ZzIG5vdy4KPgo+IFF1YWxjb21tJ3MgU1BJLU5PUiBib290IGZpcm13YXJlIHVzZXMgYSBHUFQg
cGFydGl0aW9uIHRhYmxlLiBUaGUgIkRQUCIKPiBwYXJ0aXRpb24gY29udGFpbnMgYSBGQVQgZmls
ZSBzeXN0ZW0sIGFuZCB0aGUgTUFDIGFkZHJlc3MgaXMgc3RvcmVkIGluCj4gb25lIG9mIHRoZXNl
IGZpbGVzLgo+Cj4gQmVjYXVzZSB0aGUgZGF0YSBpcyBzdG9yZWQgaW5zaWRlIGEgZmlsZXN5c3Rl
bSByYXRoZXIgdGhhbiBhdCBhIGZpeGVkCj4gb2Zmc2V0LCBpdCBkb2VzIG5vdCBmaXQgd2VsbCB3
aXRoIHRoZSBOVk1FTSBtb2RlbCwgd2hpY2ggYXNzdW1lcyBzaW1wbGUKPiBvZmZzZXQtYmFzZWQg
YWNjZXNzLgoKTm90IGFueW1vcmUsIHRoZXJlIGFyZSBudm1lbSBsYXlvdXRzIG5vdyB0aGF0IGFy
ZSBtdWNoIG1vcmUKZmxleGlibGUsIHNvIGlmIGEgbmV0d29yayBkcml2ZXIgc2hhbGwgZ2V0IHRo
aXMgTUFDIGFkZHJlc3MsIGl0IGlzIHN0aWxsCmRvYWJsZS4KCk90aGVyd2lzZSB0aGVyZSBpcyBu
byBzdWNoIG5lZWQsIGFuZCBpbiB0aGUgY2FzZSBvZiBhIGZpbGUgaW4gYSBGQVQKZmlsZXN5c3Rl
bSwgSSBndWVzcyBpdCBpcyBwcmVmZXJhYmxlIHRvIHVzZSBtdGRibG9jay91YmlibG9jayBpbiBv
cmRlcgp0byBleHBvc2UgYSBibG9jayBkZXZpY2UgYW5kIG1vdW50IGl0IGZyb20gdXNlcnNwYWNl
LgoKUGxlYXNlIG5vdGUgdGhhdCBleHBvc2luZyBhIEZBVCBmaWxlc3lzdGVtIG9uIHRvcCBvZiBh
IFNQSSBOT1IgaXMgdmVyeQppbmFwcHJvcHJpYXRlLiBGQVQgaXMgYSBibG9jayBmaWxlc3lzdGVt
LCBub3QgYXdhcmUgb2YgYWxsIHRoZSBNVEQKc3BlY2lmaWNpdGllcyAobGlrZSBiYWQgYmxvY2tz
KS4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
