Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EB1C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kuz9wBEkDZf+GEVO58y7y5sGFJtQVgQL1sbeQG1jOHY=; b=rqhsXXG4redns+
	mmrM3vfZRJpNKOoO+zTjLy2RlUPw+yQlxYCO1ZaEMZuq1L3PX72BfMXWsXh3RlSREipoRdRR2+eXV
	rStobUfvOt7tNNf8Jb21dJWYWXZ6DBnvzeIYCePMeQygqLzja+xrdBIgsU1DEft4HS09LkZr6RPlK
	sBwVscTv6hjM4625jjLVnPvxiA2PCLdFkeerNrk4UMOwU+BYoUGvjzBAjSE77qDYh8PeeFBWyImRF
	rpLMSnSeiOQIlBTLe99zvgeb4VMcFK8J6DdKYVcgMlzJ6Hpav8TGB+sxuKcnC/kiu2vAiSu0enj9p
	bG+8vtyv7FrZzDpG8V4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHXs-0066dn-B5; Fri, 15 Jul 2022 09:23:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCHXp-0066bs-0b
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 09:23:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CC36FCE2D3B;
	Fri, 15 Jul 2022 09:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BCDC3411E;
	Fri, 15 Jul 2022 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657877006;
	bh=zYaOTja4AIBD/WAKQ57pm5wPsgAuCtuZjUduy4rsppI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rvNxhMjRwcpvomEqfUu2I/STcWxYcOI0zICdthmOcc6kV2nluRIoTBraaUywHI+UC
	 cT16yBFVX7ufZ71Pr0Ob1lxDXb2HIU6flVZ7Mkb3HcVZIPtxFFGqewszpU1zKp2Ejr
	 5LHj0q4KujT0lpww71Egrllijvk7tPZJiUubR76bd7u//vmguiid6nN2na6J5mGH1U
	 S5IWc+i6HomW2fBVeHXIauXydCDW87W5fYY9/g0SZ2qo0SrEb+871wekeMRvXRF9id
	 IYrgs23Zuz7ffEPX215wvcn7wpUtk6OS4dOuWURmRj7gzRSqkYpAowbj50ulLXeDJ5
	 exfdAKpPNHJiw==
Date: Fri, 15 Jul 2022 11:23:21 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsl_elbc: Fix none ECC mode
Message-ID: <20220715112321.6c8ba00e@dellmb>
In-Reply-To: <20220707184328.3845-1-pali@kernel.org>
References: <20220707184328.3845-1-pali@kernel.org>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_022333_320643_71D13D02 
X-CRM114-Status: GOOD (  12.29  )
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

T24gVGh1LCAgNyBKdWwgMjAyMiAyMDo0MzoyOCArMDIwMApQYWxpIFJvaMOhciA8cGFsaUBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ29tbWl0IGY2NDI0YzIyYWEzNiAoIm10ZDogcmF3bmFuZDogZnNs
X2VsYmM6IE1ha2UgU1cgRUNDIHdvcmsiKSBhZGRlZAo+IHN1cHBvcnQgZm9yIHNwZWNpZnlpbmcg
RUNDIG1vZGUgdmlhIERUUyBhbmQgc2tpcHBpbmcgYXV0b2RldGVjdGlvbi4KPiAKPiBCdXQgaXQg
YnJva2UgZXhwbGljaXQgc3BlY2lmaWNhdGlvbiBvZiBIVyBFQ0MgbW9kZSBpbiBEVFMgYXMgY29y
cmVjdAo+IHNldHRpbmdzIGZvciBIVyBFQ0MgbW9kZSBhcmUgYXBwbGllZCBvbmx5IHdoZW4gTk9O
RSBtb2RlIG9yIG5vdGhpbmcgd2FzCj4gc3BlY2lmaWVkIGluIERUUyBmaWxlLgo+IAo+IEFsc28g
aXQgc3RhcnRlZCBhbGlhc2luZyBOT05FIG1vZGUgdG8gYmUgc2FtZSBhcyB3aGVuIEVDQyBtb2Rl
IHdhcyBub3QKPiBzcGVjaWZpZWQgYW5kIGRpc2FsbG93ZWQgdXNhZ2Ugb2YgT05fRElFIG1vZGUu
Cj4gCj4gRml4IGFsbCB0aGVzZSBpc3N1ZXMuIFVzZSBhdXRvZGV0ZWN0aW9uIG9mIEVDQyBtb2Rl
IG9ubHkgaW4gY2FzZSB3aGVuIG1vZGUKPiB3YXMgcmVhbGx5IG5vdCBzcGVjaWZpZWQgaW4gRFRT
IGZpbGUgYnkgY2hlY2tpbmcgdGhhdCBlY2MgdmFsdWUgaXMgaW52YWxpZC4KPiBTZXQgSFcgRUND
IHNldHRpbmdzIGVpdGhlciB3aGVuIEhXIEVDQyB3YXMgc3BlY2lmaWVkIGluIERUUyBvciBpdCB3
YXMKPiBhdXRvZGV0ZWN0ZWQuIEFuZCBkbyBub3QgZmFpbCB3aGVuIE9OX0RJRSBtb2RlIGlzIHNl
dC4KPiAKPiBGaXhlczogZjY0MjRjMjJhYTM2ICgibXRkOiByYXduYW5kOiBmc2xfZWxiYzogTWFr
ZSBTVyBFQ0Mgd29yayIpCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVs
Lm9yZz4KClJldmlld2VkLWJ5OiBNYXJlayBCZWjDum4gPGthYmVsQGtlcm5lbC5vcmc+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
