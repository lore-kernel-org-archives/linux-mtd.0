Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0E6E6BF11
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bftv276yyw/i4uzGSrIW5FJqVbE11S9PhSemAWnrCck=; b=alkuAPjRofGcCm
	2C5EgKcvnXf0urcv7bCtJ3yNNILuPUOKovIcyOpGtXv27iWHjrKDMuJPEDtXJs1alD5eRHCt3dUpI
	0nefb2RHB6IcN/WDS0BP/O1puSINimKq+d8isZmganqN5bjshUr/VHDw3lYuToknS12SEOUOYBTwz
	WLkjUGoT6gwuTgfN1xxOOFklLW5X7E286RkvHxrO+9ajb+THqAYiqKmOo9jbNlCPhvKRAL7OCitdZ
	2LhNIxwnou3bVz1wVAU+x8nATPYXyo5kt4EceejRR8R6yZ7/uCuF8BDdNdiajj5/1N4OZQiAFYsHe
	M3lg619SQSNl745lQqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpD1-00000001ZGw-1cJT;
	Fri, 30 Jan 2026 14:10:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpCy-00000001ZGQ-2XEB
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 14:10:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9FB391A2B3A;
	Fri, 30 Jan 2026 14:10:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71A896075A;
	Fri, 30 Jan 2026 14:10:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63704119A8874;
	Fri, 30 Jan 2026 15:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769782244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ecDc80eooQS9rlWWy0Md7i2Jn9Ijn5zzrwYvHvmNqtM=;
	b=tbZYpIjfTkEL05J9upskFufDDI1w6rhle+M3XAUwMupurQKBLsGw9vkjN4fJH49PEBp+En
	OklUD9QY8712XBHX23LRoAySawwuyJFAPSSutn2ApMNmx0mlWH3e159qEJobM4SDLtoUY1
	rTLdLPjQ72OmclqnHfQtYsvfm8ihgW1+2BBF3rJBI1wD98ammweJSYyON18a0UHK1YodhT
	ngpDwfHp66BO4VAk+Rz4Zzr6PZgfGSzQqQYvEI4LXkrjxfirJOSbSdZ9fD43zsDDAqtuiY
	hng9Ls9kcjdrVOLX5VHeCC5zNvE6eShhJdJZlNEq9yC1qicEeQEsZcVF4rBibQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Xilin Wu
 <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
In-Reply-To: <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
	(Junhao Xie's message of "Fri, 30 Jan 2026 21:39:48 +0800")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
	<86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 30 Jan 2026 15:10:38 +0100
Message-ID: <87ecn7jin5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_061048_773055_9615676D 
X-CRM114-Status: GOOD (  11.91  )
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

SGksCgo+PiBJIGRvbid0IGJlbGlldmUgeW91IGFuc3dlcmVkIG15IHF1ZXN0aW9uIHJlZ2FyZGlu
ZyBob3cgdG8gYWNjZXNzIHRoaXMKPj4gaW50ZXJmYWNlIGZyb20gdGhlIGtlcm5lbC4gT24gbWFu
eSBvZiB0aGVzZSBkZXZpY2VzIHdlIGNhbiBmaW5kIHRoZSBNQUMKPj4gYWRkcmVzc2VzIG9mIHRo
ZSBzeXN0ZW0gaW4gdGhlICJEUFAiIHBhcnRpdGlvbi4gRG8geW91IGhhdmUgYW55IGlkZWFzCj4+
IGFib3V0IGhvdyB3ZSBjb3VsZCBhY2Nlc3MgdGhpcyBmcm9tIHdpdGhpbiB0aGUga2VybmVsPwo+
Pgo+PiBSZWdhcmRzLAo+PiBCam9ybgo+Cj4gSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQuIEkgd2ls
bCBhZGQgYSBtb2R1bGUgcGFyYW0gaW4gdjMgZm9yIGRlZmF1bHQKPiByZWFkLW9ubHkgbW9kZS4g
ZS5nLjogL3N5cy9tb2R1bGUvcWNvbV9zY21fc3RvcmFnZS9wYXJhbWV0ZXJzL2FsbG93X3dyaXRl
Cj4KPiBGb3Igc29tZXRoaW5nIGxpa2UgdGhlICJEUFAiIHBhcnRpdGlvbiwgSSB0aGluayBpdCdz
IGJldHRlciB0byBhY2Nlc3MgaXQKPiBmcm9tIHVzZXJzcGFjZSB0aGFuIGZyb20ga2VybmVsLgoK
SWYgaXQncyBhIE1BQyBhZGRyZXNzIHRoYXQgeW91IGFyZSBhY2Nlc3NpbmcsIGRpcmVjdCB1c2Vy
c3BhY2UgZG9lcyBub3QKc291bmQgbGlrZSBhIGdvb2QgZml0LiBJZiBJIG1heSwgTlZNRU0gY2Vs
bHMgYXJlIHRoZXJlIGV4YWN0bHkgZm9yIHRoaXMKcHVycG9zZTogaWRlbnRpZnlpbmcgdGhlIGNv
bnRlbnQgb2YgYSBzdWJwYXJ0IG9mIGEgc3RvcmFnZSBkZXZpY2UgaW4gYQpzdG9yYWdlIGFnbm9z
dGljIHdheS4gVGhlIE5WTUVNIGNlbGxzIGFyZSBtYWRlIGF2YWlsYWJsZSB0byBpbi1rZXJuZWwK
ZHJpdmVycyAoaWUuIG5ldHdvcmsgZGV2aWNlcyBoYXZlIGFsbCB0aGUgaW5mcmFzdHJ1Y3R1cmUg
dG8gZ2V0IHRoZSBNQUMKYWRkcmVzcyBmcm9tIHRoZXJlKSBhbmQgdGhlaXIgY29udGVudCBpcyBh
bHNvIGV4cG9zZWQgdG8gdXNlcnNwYWNlCnRocm91Z2ggc3lzZnMgbm93LgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
