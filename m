Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB3AC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2I+dLuYr9h632Oz+k5v//tTzSRPTm3Gq3WspMpmm40=; b=ow/3bdmRUJkhpQ
	1tQxfM/GdCCFrNGu2TS8Nddvi0zfwo3ZkglGRltQqliBsl1Pm78tovMN9n+IawRgUootrl0qcKRqg
	b+C8yQ79BqQ0FEEgwnfs8pq4TPbyf8G6P8ql00GE5h4DU23nHBR318zMVfbhc4WXeCcf/Jwgts8cY
	MAXD/kWAklp8m28SScb2zm49syKRkMiTJDrnhfnYmdBL1HZsrxMScdon7aJccT+GZfdl2NZzSBZzD
	eX0T0GAkkAjubVADlD+j+hqAEH59+eurPMlm6MMcHX/v38DyosYSwctWq84oK2UZCNwpy+y1C7PPy
	EGQsnotpfKCUTLhAMXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZXJ-00EJ2S-35;
	Mon, 13 Nov 2023 16:11:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZXH-00EJ25-1V
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 16:11:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32df66c691dso2684770f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2023 08:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699891897; x=1700496697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvmPP40QAmaSDip2r3L5S1EZ53Tf38T1B8bFC5L/BSg=;
        b=BnMO9Wn1ObUDyOQcXKOpak8YNi3nDXrui+XtzLO1ZrApfjtx5/iliiy1eS6NMcf9jY
         L6vDp+dlKn5jFBtNI/eEudo/C+NSkWKOEUfQZz0dFRZI8aAZyOyIqE6Q5+rMaiNAnd0b
         s8nSrAMg8SUF7eDnUI6Sn8KKB08iZ149jachve6gyzYDJrcq9h4GxVyDcpywpEmuXXTy
         +5N7Ddy5weGX7wfMupT5OFx9dQoVJqatZOiHoMhP4PiV36fpEzZM/QnjdAJxH4i+bbkN
         O39JZL0+qqXZM7PE3Vqk/GQlb+4jtS/GGitc3/rEVMUNC9x+PuuMIXNbbc/aoxqrVqw4
         qS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891897; x=1700496697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvmPP40QAmaSDip2r3L5S1EZ53Tf38T1B8bFC5L/BSg=;
        b=EUkKempoVEK+WAe+969ZI08VXb7/8QZQYJQk2H7ubschUm6v1fLvN+wnM4nPrdN+v7
         J0N7M9QXJ5zp4PI9d76ByCIX7A4Rlb+DTTU+vTQwfXmN+uXJyCayq9IcfGE8QZrhuBxj
         7twx0XfkVWEFmRMS4xQHsE3mET704sd7CNCRFJsOW5fKsfyjI+UYlx+LpLPUeSQWrkmM
         krzFhd7GFaFv/d+6siHr6gQ+yDcWK0z9VzKd2YkP9536B7ZHw/eLjajMG7i6hT5im9yS
         vpAwS9tlnohnNNxHKdJ5sjJ7XL7/FlJ9h9erQggwI8bLsseAqpGoNp7c90TndMYC0X2R
         WxLA==
X-Gm-Message-State: AOJu0YzbFLQUeQ3TjLP2t/jNrTAoRfIEVAeyrSzcnK/bW9/6GIDWS8jm
	XqPFXJPEfzrgu9dk1+S+pk3RL2QC0ECMw80d+dk=
X-Google-Smtp-Source: AGHT+IHaRisWpjOsj5b+sS6PZcT4DTSUWt2n7ssMISYOAaBun9wlinKFs+GM3jPVDHxW/YbMG50KW6OUdWBrSec3VTg=
X-Received: by 2002:a05:6000:1447:b0:331:393d:aea1 with SMTP id
 v7-20020a056000144700b00331393daea1mr5143254wrx.13.1699891896874; Mon, 13 Nov
 2023 08:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20231113131634.614467-1-debug.penguin32@gmail.com>
 <20231113155354.620298-1-debug.penguin32@gmail.com> <ZVJJAReXiEVc35HZ@smile.fi.intel.com>
In-Reply-To: <ZVJJAReXiEVc35HZ@smile.fi.intel.com>
From: Ronald Monthero <debug.penguin32@gmail.com>
Date: Tue, 14 Nov 2023 02:11:25 +1000
Message-ID: <CALk6UxpBbbvRKo1L-KZ-5C_1YEZfZtiQGJmvVzH2j_y1oA+0Sg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand
 controller response
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de, 
	martin.blumenstingl@googlemail.com, paul@crapouillou.net, robh@kernel.org, 
	u.kleine-koenig@pengutronix.de, AVKrasnov@sberdevices.ru, 
	r.czerwinski@pengutronix.de, jaimeliao.tw@gmail.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_081139_528281_888BECA7 
X-CRM114-Status: GOOD (  16.91  )
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

SGkgQW5keSwKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIEkgaGFkIG5vdCBzZWVuIHlvdXIgcmVz
cG9uc2UgYnkgdGhlbi4gSSB3aWxsCm1vZGlmeSBhbmQgc2VuZCBpdCBhZ2Fpbi4KCkJSLApSb24K
Ck9uIFR1ZSwgTm92IDE0LCAyMDIzIGF0IDI6MDTigK9BTSBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBZb3UgYXJlIHRvbyBxdWlj
ayB3aXRoIHYyLCBiZWxvdyBteSBjb21tZW50cyAobmV3IGFuZCBvbGQpLgo+Cj4gT24gVHVlLCBO
b3YgMTQsIDIwMjMgYXQgMDE6NTM6NTFBTSArMTAwMCwgUm9uYWxkIE1vbnRoZXJvIHdyb3RlOgo+
ID4gVW5kZXIgaGVhdnkgbG9hZCBpdCBpcyBsaWtlbHkgdGhhdCB0aGUgY29udHJvbGxlciBpcyBk
b25lCj4gPiB3aXRoIGl0cyBvd24gdGFzayBidXQgdGhlIHRocmVhZCB1bmxvY2tpbmcgdGhlIHdh
aXQgaXMgbm90Cj4gPiBzY2hlZHVsZWQgaW4gdGltZS4gSW5jcmVhc2luZyBJRkNfVElNRU9VVF9N
U0VDUyBhbGxvd3MgdGhlCj4gPiBjb250cm9sbGVyIHRvIHJlc3BvbmQgd2l0aGluIGFsbG93YWJs
ZSB0aW1lc2xpY2Ugb2YgMSBzZWMKPgo+IE1pc3NpbmcgcGVyaW9kIGF0IHRoZSBlbmQ/Cj4KPiA+
IGZzbCxpZmMtbmFuZCA3ZTgwMDAwMC5uYW5kOiBDb250cm9sbGVyIGlzIG5vdCByZXNwb25kaW5n
Cj4KPiA+IG1haW4vc21wX2ZzbS5jOjE4ODQgPGlucmN1OiByY3VfcHJlZW1wdCBkZXRlY3RlZCBz
dGFsbHMgb24gQ1BVcy90YXNrczoKPiA+IHJjdTogICAgVGFza3MgYmxvY2tlZCBvbiBsZXZlbC0w
IHJjdV9ub2RlIChDUFVzIDAtMSk6IFAxMTYvMjpiLi5sCj4gPiAgICAgICAgIChkZXRlY3RlZCBi
eSAxLCB0PTIxMDIgamlmZmllcywgZz03NzI5LCBxPTc1NCkKPiA+IHRhc2s6aXJxLzMxLWFybS1p
cnExIHN0YXRlOkQgc3RhY2s6IDAgcGlkOiAxMTYgcHBpZDogMiBmbGFnczoweDAwMDAwMDAwCj4g
PiBbPDgwNjRiOTdmPl0gKF9fc2NoZWR1bGUpIGZyb20gWzw4MDY0YmIwMT5dIChzY2hlZHVsZSsw
eDhkLzB4YzIpCj4gPiBbPDgwNjRiYjAxPl0gKHNjaGVkdWxlKSBmcm9tIFs8ODA2NGRhY2Q+XQo+
ID4gWzw4MDY0ZGFjZD5dIChydF9tdXRleF9zbG93bG9ja19ibG9jay5jb25zdHByb3AuMCkgZnJv
bSBbPDgwNjRkYjU3Pl0KPiA+IFs8ODA2NGRiNTc+XSAoX19ydF9tdXRleF9zbG93bG9jay5jb25z
dHByb3AuMCkgZnJvbSBbPDgwNjRkYmY3Pl0KPiA+IFs8ODA2NGRiZjc+XSAocnRfbXV0ZXhfc2xv
d2xvY2suY29uc3Rwcm9wLjApIGZyb20gWzw4MDRiMjA0Nz5dCj4KPiBBdCBsZWFzdCBhYm92ZSA5
IGxpbmVzIGFyZSBub3QgaW1wb3J0YW50IGFuZCBtYXkgYmUgcmVtb3ZlZC4KPgo+ID4gWzw4MDRi
MjA0Nz5dIChuYW5kX2dldF9kZXZpY2UpIGZyb20gWzw4MDRiNTMzNT5dIChuYW5kX3dyaXRlX29v
YisweDFiLzB4NGEpCj4gPiBbPDgwNGI1MzM1Pl0gKG5hbmRfd3JpdGVfb29iKSBmcm9tIFs8ODA0
YTM1ODU+XSAobXRkX3dyaXRlKzB4NDEvMHg1YykKPiA+IFs8ODA0YTM1ODU+XSAobXRkX3dyaXRl
KSBmcm9tIFs8ODA0YzFkNDc+XSAodWJpX2lvX3dyaXRlKzB4MTdmLzB4MjJjKQo+ID4gWzw4MDRj
MWQ0Nz5dICh1YmlfaW9fd3JpdGUpIGZyb20gWzw4MDRjMDQ3Yj5dICh1YmlfZWJhX3dyaXRlX2xl
YisweDViLzB4MWQwKQo+Cj4gLi4uCj4KPiA+IC0jZGVmaW5lIElGQ19USU1FT1VUX01TRUNTICAg
IDUwMCAgLyogTWF4aW11bSBudW1iZXIgb2YgbVNlY3MgdG8gd2FpdAo+ID4gKyNkZWZpbmUgSUZD
X1RJTUVPVVRfTVNFQ1MgICAgMTAwMCAgLyogTWF4aW11bSBudW1iZXIgb2YgbVNlY3MgdG8gd2Fp
dAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgSUZDIE5BTkQg
TWFjaGluZSAgICAqLwo+Cj4gV2hpbGUgYXQgaXQsIHlvdSBtYXkgaW1wcm92ZSB0aGUgY29tbWVu
dCwgZS5nLiwKPgo+ICAgIk1heGltdW0gdGltZW91dCB0byB3YWl0IGZvciBJUEMgTkFORCBNYWNo
aW5lIgo+Cj4gLS0KPiBXaXRoIEJlc3QgUmVnYXJkcywKPiBBbmR5IFNoZXZjaGVua28KPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
