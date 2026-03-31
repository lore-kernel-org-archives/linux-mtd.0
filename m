Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40C2FF60EE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wueUauR2IwUMewkG+tscnu7/6vjB/zBnkbjTRak/W4=; b=Bhhv5KbKUKgmAE
	bNB2P3zrnMgDOTj/IffBlL2l22qdaL0oaLFFW94qZI1PmoTJ1TqCRMPzpBwJ2kMUqaFEWpgJh0rlE
	9Z8wyjFY+cH8rsE56/btgEqruWUjXWLpLSoLf/0V55DqW5FrRQPL+UWqBzt+cuTz99WYkcBOivaEi
	1Y1JUs9ZIcToRAfssxAQgmMlLyL+wI37JXJGsPCAhK6kYflsyqgDsPIRhf3D6/HPHCBSQKRSiC1FA
	OiUFsBBUK89kzKATyjGJlHzqchMHW/S8GipNTUiBE2tm03ZsYQkdEtM1SOQRXuZOWlnQ9KpIGdorl
	P9vy6GfkT0VdJmeqzBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VKC-0000000Cga8-1o8o;
	Tue, 31 Mar 2026 09:23:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VK9-0000000CgZi-1Y9w
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 09:23:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E3A84E42884;
	Tue, 31 Mar 2026 09:23:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE17F6029D;
	Tue, 31 Mar 2026 09:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6B3210451114;
	Tue, 31 Mar 2026 11:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774949008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fkBjjN7bhpG5aw4pPbOMePbSqonLTcmD2I2uQB/bMjk=;
	b=ZHnjeBZJluQoayfHtxxX3c10BPU4KWGyV1gVTK5ZdH8P8kFLWrPjaHonn7FVTSNAyaxIPm
	zqA5nCnxGEkINET8MEv8ZAL9d/9AhEQjjKLzEnXKldLrNgstNgHXh/9fouSuUvW2IxkCN3
	7gYwb7rnXrFlSfph/kkH0uXW+SeI3hHVLgrb04DYJnECHUs8pOqOrGDz6zXBdp0yXjWGs7
	i9vfCfmf1ymHpgEbCtpLQqQJ5CElhLbuisSx/EpOpG1oz+1ib94CaSmSvLY2jLWzMlaSgw
	fdHfHt6aeuJhO7pPiEzPH7a58CS8ug5ozTOfb6vMb7LnwtodY/Ufu0Rx7n3yuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,  Mark Brown <broonie@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,  Eberhard Stoll
 <eberhard.stoll@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
In-Reply-To: <a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de> (Frieder
	Schrempf's message of "Tue, 10 Mar 2026 15:16:47 +0100")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
	<87wlzlnioh.fsf@bootlin.com>
	<a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 31 Mar 2026 11:23:24 +0200
Message-ID: <87ecl09wtv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_022349_542739_AB872578 
X-CRM114-Status: GOOD (  18.24  )
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

SGkgRnJpZWRlciwKCj4gVGhlIHNhbXBsaW5nIHBvaW50IGRlbGF5IGlzIGNvdXBsZWQgdG8gdGhl
IGNsb2NrIGZyZXF1ZW5jeS4gU28gaWYgdGhlCj4gY2xvY2sgY2hhbmdlcyBwZXItb3AsIHdlIGFs
c28gbmVlZCB0byBjaGFuZ2UgdGhlIHNhbXBsaW5nIGRlbGF5IHBlci1vcC4KPgo+IEluIGdlbmVy
YWwsIGlmIHdlIHdhbnQgdG8gYXZvaWQgc3dpdGNoaW5nIHRoZSBwYXJhbWV0ZXJzIGJhY2sgYW5k
IGZvcnRoCj4gaW4gY2FzZXMgb2YgYWx0ZXJuYXRpbmcgb3BzIHdpdGggZGlmZmVyZW50IG1heCBm
cmVxdWVuY2llcywgd2Ugc2hvdWxkCj4gbWF5YmUgZG8gc29tZSAibWluIG9mIHRoZSBtYXgiIGNh
bGN1bGF0aW9uIGFuZCB1c2UgdGhlIHJlc3VsdGluZwo+IGZyZXF1ZW5jeSBmb3IgYWxsIG9wcy4K
Pgo+IElzIHRoYXQgd2hhdCB5b3UgbWVhbj8KCk5vdCBleGFjdGx5LCBJIGFtIG5vdCBhZnJhaWQg
YnkgdGhlIHRpbWUgaXQgd291bGQgdGFrZSB0byBzd2l0Y2gsIEkgYW0KYWZyYWlkIGJ5IHRoZSBs
aWtlbGlob29kIHRoYXQgYm90aCB0aGUgUEhZIHR1bmluZyBzZXJpZXMgYW5kIHlvdXIgc2VyaWVz
Cm1pZ2h0IHdhbnQgdG8gZm9yY2UgYSBkaWZmZXJlbnQgbWF4aW11bSBmcmVxdWVuY3kuIEZvciBp
bnN0YW5jZSB3aXRoIFRJCmRlc2lnbnMsIHdoZW4gZW50ZXJpbmcgUEhZIG1vZGUsIHRoZSBmcmVx
dWVuY3kgaXMgMTY2TUh6LCBwZXJpb2QuIFlvdQpjYW5ub3QgbG93ZXIgaXQgYmVjYXVzZSBieSBk
ZXNpZ24sIHlvdSBieXBhc3MgdGhlIFNQSSBkaXZpc29ycy4KCj4gV2UgY291bGQgZXZlbiBzZXQg
YSB0aHJlc2hvbGQgdG8gZGVjaWRlIGJldHdlZW4gdXNpbmcgYSBjb21tb24gIm1pbiBvZgo+IHRo
ZSBtYXgiIGZyZXF1ZW5jeSBvciBkbyB0aGUgc3dpdGNoaW5nIHBlci1vcC4KPgo+IE9uZSBvdGhl
ciBwb3NzaWJpbGl0eSB3b3VsZCBiZSB0byBzb21laG93IGNhY2hlIHRoZSBwZXItb3AgZnJlcXVl
bmNpZXMKPiBhbmQgY2FsY3VsYXRlZCBzYW1wbGluZyBkZWxheSB2YWx1ZXMgc28gdGhleSBjYW4g
YmUgcmV1c2VkIHdoZW4KPiBzd2l0Y2hpbmcgd2l0aG91dCBtdWNoIG92ZXJoZWFkLgo+Cj4gVGhl
cmUgaXMgb25lIG1vcmUgaXNzdWUgdGhhdCBpcyBub3QgeWV0IGNvdmVyZWQgYnkgdGhpcyBzZXJp
ZXM6IEJlZm9yZQo+IHNwaW5hbmRfaWRfZGV0ZWN0KCkgd2UgZG9uJ3Qga25vdyB5ZXQgd2hhdCBS
WCBzYW1wbGluZyBkZWxheSB2YWx1ZSB0aGUKPiBjaGlwIHJlcXVpcmVzLCBidXQgd2UgYWxyZWFk
eSB1c2UgcmVhZC1zdGF0dXMgYW5kIHJlYWQtaWQgb3BlcmF0aW9ucyBhdAo+IG1heGltdW0gY2hp
cCBjbG9jay4KCk5vdCBleGFjdGx5ICJtYXhpbXVtIGNoaXAgY2xvY2siIGFzIGluIFNhbnRob3No
J3Mgd29yaywgYnV0IGluZGVlZCB3ZQpydW4gdGhlc2UgYXQgdGhlIGZyZXF1ZW5jeSBnaXZlbiBp
biB0aGUgRFQgYXMgYmVpbiB0aGUgbWF4aW11bQpmcmVxdWVuY3kuIElmIHRoYXQncyBub3QgY29y
cmVjdCwgeW91IG11c3QgbG93ZXIgaXQgaW4gdGhlIERULiBUaGF0IGlzCndoeSBJIGFtIGluIGZh
dm91ciBvZiBoYXZpbmcgdHdvIG1heGltdW0gZnJlcXVlbmNpZXM6IHRoZSBzdGFuZGFyZCBvbmUs
CnRoYXQganVzdCB3b3Jrcywgd2hpY2ggaXMgdGhlIG9uZSBmb3Igbm9uIG9wdGltaXplZCBzZXR0
aW5ncyAodGhlIG9uZSB3ZQphY3R1YWxseSB1c2UgdG9kYXkpIGFuZCBhbm90aGVyIG9uZSwgd2hl
biB0dW5pbmcgdGhlIGJ1cyB0aW1pbmdzLgoKPiBGb3IgZXhhbXBsZSBvbiBXaW5ib25kIFcyNU4w
NEtWIHRoaXMgbGVhZHMgdG8gZGV0ZWN0aW9uIGZhaWx1cmVzLiBTbyB3ZQo+IHNob3VsZCBtYXli
ZSBpbnRyb2R1Y2Ugc29tZSBraW5kIG9mIHJlZHVjZWQgY2xvY2sgc2V0cG9pbnQgZm9yIHRoZQo+
IGluaXRpYWwgZGV0ZWN0aW9uLCB0aGF0IGlzIHNhZmUgdG8gYmUgdXNlZCB3aXRob3V0IFJYIHNh
bXBsaW5nIGRlbGF5Cj4gY29tcGVuc2F0aW9uLgoKVGhhdCBzaG91bGQgYmUgdGhlIERUIG1heCBm
cmVxdWVuY3ksIG5vPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
