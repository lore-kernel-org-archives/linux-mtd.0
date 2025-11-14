Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11867CE7AFA
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/Rbb1oaeMI9iT07YeJX/o9k2RWkaMb+hmq8LJ/86cs=; b=o+ipFH1JqtTzzq
	UhAHqNwMRmbIpTncTF/1UGL2OK/EB9sateHQy9JZ2kzgdANrXYpG8UKlSiGNOtJNz5j/OeeHwXWWf
	35bwubrKHdxBeShpQ7p22W21Huw2omlM5uG+5G9mW3ZK6DO5iewz3SOj3kW8aV7QCsvR1zvsv+7W4
	o9Y4taxPGT0/iLxudNdfx1I9GJ6mw8oFLVNT7aFcZT586VMvlpNnbhodNcemwNgy7g9YGgFkv1ryz
	UjDiXf3s2Pl9Z+N32FXwFrqenWEZ9lcynmysghZEra1czDArYhas0OtlMSfeR0EyYjlVeDZ8pL1vs
	1jq0Bvszz7dIeml7ttrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy55-0000000CusU-2cIf;
	Fri, 14 Nov 2025 17:59:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJy52-0000000Cura-0uxE
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:59:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 02B001A1AAC;
	Fri, 14 Nov 2025 17:59:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCADA6060E;
	Fri, 14 Nov 2025 17:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D669010371986;
	Fri, 14 Nov 2025 18:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763143165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fxjWDAhiGHIrVKLLyLpbURlJYUa6BNAAgnVyv9OknRk=;
	b=iIPnDU+PQvTIZXo2LQIOxf7xD2nkQCD43UWa4+76C7nwGK9jKpu9ztiU2skBZ4QQ3EBY3L
	a7L7A8tUNUzvhWOg1679p7fkLJBh4GtW1Hc4o3ifz0LyPx38Ku0o8BDUfGw60sgW2wt5RB
	Ba2sm6xPkM6wsYA/231uV0Z5XfVQdRBSBjEk1xyZdCfSt+AzM0DG+gA/3hTpZcMVDQLkVs
	2paG4XG5sB3b85khCTa+WwhS6Af06d+PFtT82AXaS7B45RjljtQghrlNdGnlwzGcCca0fb
	Ix1AX/MURbJAR4FXTzHV3ikxya6QyaC2VxPaMxqN+GS6OwInmG6Vs/LjXjMThw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 0/6] Hello,
In-Reply-To: <8a370764-e093-4987-9a5f-3a8c1d6d900c@linaro.org> (Tudor
	Ambarus's message of "Wed, 12 Nov 2025 11:37:38 +0200")
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
	<c67466c0-c133-4fac-82d5-b412693f9d30@linaro.org>
	<87seej7fv6.fsf@bootlin.com>
	<8a370764-e093-4987-9a5f-3a8c1d6d900c@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 14 Nov 2025 18:59:21 +0100
Message-ID: <87a50ofqbq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095928_413335_D9769C49 
X-CRM114-Status: UNSURE (   7.55  )
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

SGVsbG8sCgo+Pj4+IEhlcmUgaXMgYSBzZXJpZXMgYWRkaW5nIHN1cHBvcnQgZm9yIDYgV2luYm9u
ZCBTUEkgTk9SIGNoaXBzLiBEZXNjcmliaW5nCj4+Pj4gdGhlc2UgY2hpcHMgaXMgbmVlZGVkIG90
aGVyd2lzZSB0aGUgYmxvY2sgcHJvdGVjdGlvbiBmZWF0dXJlIGlzIG5vdAo+Pj4+IGF2YWlsYWJs
ZS4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGZpbmUgb3RoZXJ3aXNlLgo+Pj4KPj4+IEknbSBnbGFk
IHRvIHNlZSB0aGlzLCB5b3UncmUgYW4gbG9ja2luZyBleHBlcnQgbm93IDopLiBEbyB5b3UgY2Fy
ZSB0bwo+Pj4gZXh0ZW5kIHRoZSBTUEkgTk9SIHRlc3RpbmcgcmVxdWlyZW1lbnRzIFsxXSB3aXRo
IHN0ZXBzIG9uIGhvdyB0byB0ZXN0IHRoZQo+Pj4gbG9ja2luZz8gVGhlcmUncyBzb21lIHRlc3Rp
bmcgcHJvcG9zZWQgYXQgWzJdLCB3b3VsZCB5b3UgcGxlYXNlIGNoZWNrIGFuZAo+Pj4gcmV2aWV3
IGl0Pwo+PiAKPj4gR29vZCBpZGVhLiBMZXQgbWUgaGF2ZSBhIGxvb3QgYXQgd2hhdCBTZWFuIHBy
b3Bvc2VkLgo+Cj4gSSBwcm9wb3NlZCB0byBoaW0gYXMgd2VsbCB0byB1cGRhdGUgdGhlIHRlc3Rp
bmcgcmVxdWlyZW1lbnRzIGlmIGhlIGNhcmVzLAo+IGhlIHNhaWQgaGUnbGwgdGFrZSBhIGxvb2su
IFN5bmMgd2l0aCBoaW0gcGxlYXNlLgo+Cj4gQ2hlZXJzLAo+IHRhCj4KPj4gCj4+PiBbMV0gaHR0
cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9tdGQvc3BpLW5vci5odG1sI21pbmltdW0t
dGVzdGluZy1yZXF1aXJlbWVudHMKPj4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tdGQvOTJlOTlhOTYtNTU4Mi00OGE1LWE0ZjktZTliMzNmY2ZmMTcxQGxpbnV4LmRldi8KCkZv
ciBwZW9wbGUgd2hvIHdvdWxkIGxpa2UgdG8gZm9sbG93LCB0aGUgcHJvcG9zYWwgaXMgaGVyZToK
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI1MTExNC13aW5ib25kLXY2LTE4
LXJjMS1zcGktbm9yLXN3cC12MS0wLTQ4N2JjNzEyOTkzMUBib290bGluLmNvbS9ULyNtYmFlOGI4
NzQxODFlYjA0MDFiMzAxNDJmNDIzYjczYjYzODlhMGM1NAoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
