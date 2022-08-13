Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A64AC25B0F
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Aug 2022 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pExjFDCKI0IYavH6xKdG3vJH4jAOPkyxAwpu8PW6MWE=; b=JL/A3J9whW3V/C
	pw57RPCrzJuupbS31wh+dnYDqIHHD5wAx4Epcod6JB0qjtpov2FgjVAIGkjkwe+E8E/KtLn3iifDs
	DztDS2yz1MCL7HdoBE99VR8H2hZ2ukJJrh6/c73UZWb/H7U8v9B6SvQS6lug4aDSv646mkyjkih88
	IAZJw1wq597MmLV/V4D8lSkQUHLlDE5OhndplJlcNkvZXsOP1aySu9gorm7OVSNYIaPCKF1sGkYms
	lq046rbUaJ8mVX9acqakcQ9dPg0JG7H2JalcVZGRxgl07s9n8GQY7z3tB4pn+V7DxgNemlNzoqbdJ
	Ud0cKkwkvnpdQrpP7iFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMoVb-00E0ex-RI; Sat, 13 Aug 2022 10:36:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMoVW-00E0cw-4b
	for linux-mtd@lists.infradead.org; Sat, 13 Aug 2022 10:36:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D23C60C14;
	Sat, 13 Aug 2022 10:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AB0C433D6;
	Sat, 13 Aug 2022 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660387000;
	bh=7mIZHSjJYEgjlM6OtTewo5Axnmw7W+GJc+3V/D6BXSw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=G15dK2hytzy03E+mGtRc/gNcBAcWC9Mgridej0ODrXKBfA/FAGAP5U5AAOV6qa8Qu
	 qv6HHzQiRehQ8b92VXBFECxyXMYDNuEsiHrvNMTenRraNLwrUURn/0JXN84Ei3/Rvd
	 Cuvb3KLN8JzqBbfyar/juNkPuwC7nllQlDWM5//vzEOb8mJKoyArFlsQoX14iEtlOi
	 93IFIOtAOyKNNIU/4O2e6i0AZ5DRIldAQ44HC0Hz6E5DalKgk8R2xSgDi1bPINag/k
	 W4RhEwdiVXRhpVGZ3EgYfT8QE+NtQOEZP6CC9NirP91koMsL3Nzw7aptSv2Orpcl38
	 jScnKUOdOU6cQ==
Received: by pali.im (Postfix)
	id B2676C30; Sat, 13 Aug 2022 12:36:37 +0200 (CEST)
Date: Sat, 13 Aug 2022 12:36:37 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Scott Wood <oss@buserror.net>, u-boot@lists.denx.de,
	linux-mtd@lists.infradead.org
Subject: Re: Have fsl_elbc_nand controllers subpage write support?
Message-ID: <20220813103637.2qiikhitegxctlak@pali>
References: <20220807120027.2zz43afbqtqljhul@pali>
 <20220807141300.tatzjlsjyhcxgegs@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220807141300.tatzjlsjyhcxgegs@pali>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_033642_233326_A96EC27C 
X-CRM114-Status: GOOD (  19.08  )
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

SGVsbG8hCgpPbiBTdW5kYXkgMDcgQXVndXN0IDIwMjIgMTY6MTM6MDAgUGFsaSBSb2jDoXIgd3Jv
dGU6Cj4gT24gU3VuZGF5IDA3IEF1Z3VzdCAyMDIyIDE0OjAwOjI3IFBhbGkgUm9ow6FyIHdyb3Rl
Ogo+ID4gSGVsbG8gU2NvdHQhCj4gPiAKPiA+IEluIHBhc3QgeW91IGRpc2FibGVkIG5hbmQgc3Vi
cGFnZSB3cml0ZSBzdXBwb3J0IGZvciBmcmVlc2NhbGUgZUxCQyBhbmQKPiA+IElGQyBVLUJvb3Qg
bmFuZCBkcml2ZXJzIGluIGZvbGxvd2luZyBwYXRjaDoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3UtYm9vdC8yMDEyMTEwMjIzNDQzMi5HQTE4MTI5QGJ1c2Vycm9yLm5ldC8KPiA+IAo+ID4g
QnV0IGluIExpbnV4IGtlcm5lbCB5b3UgZGlzYWJsZWQgaXQgb25seSBpbiBmcmVlc2NhbGUgSUZD
IG5hbmQgZHJpdmVyOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMTMw
NDEwMjIzNDM3LkdBMjY5MDBAaG9tZS5idXNlcnJvci5uZXQvCj4gPiAKPiA+IGxldHRpbmcga2Vy
bmVsJ3MgZnJlZXNjYWxlIGVMQkMgZHJpdmVyIHRvIGhhdmUgZW5hYmxlZCBzdWJwYWdlIHdyaXRl
Cj4gPiBzdXBwb3J0Lgo+ID4gCj4gPiBJIHdvdWxkIGxpa2UgdG8gYXNrLCBoYXMgZnJlZXNjYWxl
IGVMQkMgbmFuZCBjb250cm9sbGVyIHN1cHBvcnQgZm9yCj4gPiBzdWJwYWdlIHdyaXRlcz8gT3Ig
bm90IGFuZCBpdCBzaG91bGQgYmUgZGlzYWJsZWQgYWxzbyBpbiBrZXJuZWw/Cj4gPiAKPiA+IE9y
IGhhcyBzb21lYm9keSBlbHNlIHRoZXNlIGRldGFpbHM/Cj4gCj4gTm93IEkgZm91bmQgZm9sbG93
aW5nIGNvbW1pdCBodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9mMDM0ZDg3ZGVmNTEK
PiB3aGljaCBzZWVtcyB0byBiZSBmaXhpbmcvZW11bGF0aW5nIHN1YnBhZ2Ugd3JpdGUgc3VwcG9y
dC4KCklmIHRoZXJlIGlzIG5vdCBhbnkgb2JqZWN0aW9ucyBJIHdvdWxkIHNlbmQgcGF0Y2ggdG8g
VS1ib290IGVMQkMgbmFuZApjb250cm9sbGVyIGRyaXZlciB3aGljaCB3b3VsZCByZW1vdmUgdGhh
dCBOQU5EX05PX1NVQlBBR0VfV1JJVEUgdG9vLiBBcwp0aG9zZSBzdWJwYWdlIHdyaXRlIGZ1bmN0
aW9ucyBhcmUgcHJlc2VudCBhbHNvIGluIFUtQm9vdCBkcml2ZXIuCgpBbnkgY29tbWVudHM/Cgo+
ID4gVGhlIG1haW4gaXNzdWUgaXMgdGhhdCBVLUJvb3QgbmFuZCBhbmQgVUJJIHN1cHBvcnQgZm9y
IGJvYXJkcyB3aXRoIGVMQkMKPiA+IGNvbnRyb2xsZXJzIGlzIGNvbXBhdGlibGUgd2l0aCBMaW51
eCBrZXJuZWwgbmFuZCBhbmQgVUJJIHN1cHBvcnQgYmVjYXVzZQo+ID4gdGhlc2UgdHdvIGRyaXZl
cnMgY2FsY3VsYXRlIFVCSSBnZW9tZXRyeSBkaWZmZXJlbnRseS4gVUJJIGhlYWRlciBvZmZzZXQK
PiA+IGlzIGNhbGN1bGF0ZWQgZnJvbSBuYW5kIHN1YnBhZ2Ugc2l6ZSBhbmQgbmFuZCBzdWJwYWdl
IHNpemUgb2J2aW91c2x5Cj4gPiBkZXBlbmRzIG9uIHRoZSBmYWN0IGlmIHN1YnBhZ2Ugd3JpdGUg
aXMgc3VwcG9ydGVkIG9yIG5vdC4KPiA+IAo+ID4gSSB3b3VsZCBsaWtlIHRvIGZpeCB0aGlzIGlz
c3VlLCBidXQgSSBkbyBub3Qga25vdyBpZiB3cm9uZyBpbmZvcm1hdGlvbgo+ID4gaXMgaW4gVS1C
b290IGRyaXZlciBvciBpbiBMaW51eCBrZXJuZWwgZHJpdmVyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
