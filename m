Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BCAEB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gn1tZ4HzhnxL0AeNjubSoUzp/2VI4AEnZHWCMo/518=; b=Mjc99i3Q0yHe8+
	3d4e9leTzsZh+nVkiCSYxMXB6z9BUoCi8JAY4UU1FekRZRD7fbHV/5/56mJPpKEguEit3eVBLMIaV
	tmwyQ3iCRu17aBSt8eJWkW+J+XshOJHqcBYi2XOkL7V1vF5zhfi++z486W2/pqEWXMjwxUBwsFyua
	c1uI+iBYKm6PgphSvMxKwecAAI40BzDh/4BfhFOGlkdyvd645Kp6vyDTobaeNTnHQma1eBRU/W7Zn
	UKJOV6jztW5DUIvejwabFgs+lQyobHmQRr8r2azEJU8zm/fYhzADsOwajZPCDE4vlYs1QwgP1OrTX
	ypPSZCyy8POt+S+CODtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDyE-000pkN-07;
	Mon, 17 Jul 2023 02:28:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDy9-000pgS-1Z;
	Mon, 17 Jul 2023 02:28:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F34F060ED8;
	Mon, 17 Jul 2023 02:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B1AC433C8;
	Mon, 17 Jul 2023 02:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689560892;
	bh=2Kj34htP07htQDr7cIULcxX7lXKfBQpNQ0L7gvFCx2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErdMiqZmH7J8giFAn+3gTSB9YLskKg8iBee0A7ufEnDP/ZnWIrwxwr5kZYT3xDjAW
	 tYi7OnhG1meD7TV53ljxpxW6n09KRWJ1p9Y7rw9zCisDWnOqZSoWnoDoermnUISFTD
	 GMZhKn6wfgcfUPQ1M1qtUWCgWTG+8HYYSNToAzYTovC2ZESuMuhN7uiHbPPdgeIS5e
	 7at6qLup3b1Ue8auure53tOtCsbW8Xa/6dm/gmYDWk/bX46FebdI5Nm1eImLD5UsBC
	 J/FBfp9wKySG1KaT0YR6pUmYHxRJfF6kucCCfPXQeTIdCtUJw/NjC0lhho/xsMcXia
	 7wjt87/aTgg/g==
Date: Mon, 17 Jul 2023 07:57:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] mtd: rawnand: qcom: Fix alignment with open
 parenthesis
Message-ID: <20230717022759.GC5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_192813_613979_65497625 
X-CRM114-Status: GOOD (  16.07  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MDdQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBGaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdhcm5pbmc6Cj4gICAgIAkiQ0hF
Q0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcyIKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKQWNrZWQt
Ynk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgoKLSBNYW5pCgo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAxNiArKysrKysrLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IDAxMzZkZjAxNzM4ZS4uNTRhN2I0
OWJkYTg3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0yMzQ4LDcgKzIz
NDgsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFuZF9vb2JsYXlvdXRfZWNjKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBpbnQgc2VjdGlvbiwKPiAgfQo+ICAKPiAgc3RhdGljIGludCBxY29tX25hbmRfb29i
bGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+IC0JCQkJICAg
ICBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKm9vYnJlZ2lvbikKPiArCQkJCSAgICBzdHJ1Y3QgbXRk
X29vYl9yZWdpb24gKm9vYnJlZ2lvbikKPiAgewo+ICAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9
IG10ZF90b19uYW5kKG10ZCk7Cj4gIAlzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgKmhvc3QgPSB0b19x
Y29tX25hbmRfaG9zdChjaGlwKTsKPiBAQCAtMjU5Myw3ICsyNTkzLDcgQEAgc3RhdGljIGludCBx
Y29tX29wX2NtZF9tYXBwaW5nKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMsIHU4
IGNtZCwKPiAgLyogTkFORCBmcmFtZXdvcmsgLT5leGVjX29wKCkgaG9va3MgYW5kIHJlbGF0ZWQg
aGVscGVycyAqLwo+ICBzdGF0aWMgdm9pZCBxY29tX3BhcnNlX2luc3RydWN0aW9ucyhzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLAo+ICAJCQkJICAgIGNvbnN0IHN0cnVjdCBuYW5kX3N1Ym9wICpzdWJv
cCwKPiAtCQkJCQlzdHJ1Y3QgcWNvbV9vcCAqcV9vcCkKPiArCQkJCSAgICBzdHJ1Y3QgcWNvbV9v
cCAqcV9vcCkKPiAgewo+ICAJc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYyA9IGdl
dF9xY29tX25hbmRfY29udHJvbGxlcihjaGlwKTsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX29wX2lu
c3RyICppbnN0ciA9IE5VTEw7Cj4gQEAgLTMwODksMTkgKzMwODksMTcgQEAgc3RhdGljIGludCBx
Y29tX25hbmRjX2FsbG9jKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMpCj4gIAkg
Ki8KPiAgCW5hbmRjLT5idWZfc2l6ZSA9IDUzMjsKPiAgCj4gLQluYW5kYy0+ZGF0YV9idWZmZXIg
PSBkZXZtX2t6YWxsb2MobmFuZGMtPmRldiwgbmFuZGMtPmJ1Zl9zaXplLAo+IC0JCQkJCUdGUF9L
RVJORUwpOwo+ICsJbmFuZGMtPmRhdGFfYnVmZmVyID0gZGV2bV9remFsbG9jKG5hbmRjLT5kZXYs
IG5hbmRjLT5idWZfc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIW5hbmRjLT5kYXRhX2J1ZmZl
cikKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCj4gLQluYW5kYy0+cmVncyA9IGRldm1fa3phbGxv
YyhuYW5kYy0+ZGV2LCBzaXplb2YoKm5hbmRjLT5yZWdzKSwKPiAtCQkJCQlHRlBfS0VSTkVMKTsK
PiArCW5hbmRjLT5yZWdzID0gZGV2bV9remFsbG9jKG5hbmRjLT5kZXYsIHNpemVvZigqbmFuZGMt
PnJlZ3MpLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghbmFuZGMtPnJlZ3MpCj4gIAkJcmV0dXJuIC1F
Tk9NRU07Cj4gIAo+IC0JbmFuZGMtPnJlZ19yZWFkX2J1ZiA9IGRldm1fa2NhbGxvYyhuYW5kYy0+
ZGV2LAo+IC0JCQkJTUFYX1JFR19SRCwgc2l6ZW9mKCpuYW5kYy0+cmVnX3JlYWRfYnVmKSwKPiAt
CQkJCUdGUF9LRVJORUwpOwo+ICsJbmFuZGMtPnJlZ19yZWFkX2J1ZiA9IGRldm1fa2NhbGxvYyhu
YW5kYy0+ZGV2LCBNQVhfUkVHX1JELAo+ICsJCQkJCSAgIHNpemVvZigqbmFuZGMtPnJlZ19yZWFk
X2J1ZiksCj4gKwkJCQkJICAgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIW5hbmRjLT5yZWdfcmVhZF9i
dWYpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0tIAo+IDIuMzQuMQo+IAoKLS0gCuCuruCu
o+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
