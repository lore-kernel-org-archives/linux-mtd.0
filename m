Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7370EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rb6Up0ugrj9zYMqPpMYS/GeBuPPTl8UR59yUC1LUysg=; b=36BM8yOENHm29A
	k2TfhLtLovkb3DaewJTFOGxMaNIhT2DJE1tR1uGJqaE5wPHJDURav0Jgu4L0ttQ9WJqEKJO2LdKV/
	TJH+WrHw4IWH5mLd/arMgL65Ghu37uFdDxGXqKXMiwXV4geoSpu6/PTNKxS+pZpDmHGlAE1ltFWGr
	+U0/kLFSiQTQnhLY76WEdoV19gD3/DGuY0DHPobyR7rQwOCUYk6F/ROuIxn7Wb0xQw/3SwmwRjHDE
	3FNtAcdqcsbMRuCzMe1OF26JSepxFLAQijqe7bbggrImFgN9qgRxpVHd/d8XPx0rRAJ6WWJyPa7Q8
	FDRSnvZPFB/bl/0wfhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaq5-000CzP-0O;
	Wed, 12 Jul 2023 14:29:09 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaq1-000Cvp-1F
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:29:07 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:964:4b04:3697:f6ff:fe5d:314])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 36CESiBO564786
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 15:28:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1689172119; bh=sk+FPXXnrjQY//r/C0seGC8cejqHanoKfLCIbFRF9IQ=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=Yy4uQ1YAqHcj2pchhpLv0u4XG6Zm8/rVCIRaMFjPxsHU+imwdk5Cr5LQFT+gfzT6Q
	 Tey9PR5rte1qmKegvGpOFBGGL1gnAOENBA0Y8vBywk2/LK8LhkERm1Oh1lUgYKgJlZ
	 U+RdMqYCK1EgrACfgBJQe3dJg7oEI828QcsuWNnk=
Received: from miraculix.mork.no ([IPv6:2a01:799:964:4b0a:9af7:269:d286:bcf0])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 36CESduU2250823
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:28:39 +0200
Received: (nullmailer pid 588999 invoked by uid 1000);
	Wed, 12 Jul 2023 14:28:39 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>, linux-fsdevel@kvack.org,
        ezequiel@collabora.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: MTD: Lots of mtdblock warnings on bootup logs
Organization: m
References: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
Date: Wed, 12 Jul 2023 16:28:39 +0200
In-Reply-To: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
	(Pintu Agarwal's message of "Wed, 12 Jul 2023 19:29:39 +0530")
Message-ID: <877cr5yzjc.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_072905_905289_6AF5A1C2 
X-CRM114-Status: GOOD (  13.76  )
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

UGludHUgQWdhcndhbCA8cGludHUucGluZ0BnbWFpbC5jb20+IHdyaXRlczoKCj4gS2VybmVsOiA1
LjE1IDsgYXJtNjQgOyBOQU5EICsgdWJpICsgc3F1YXNoZnMKPiBXZSBoYXZlIHNvbWUgUkFXIHBh
cnRpdGlvbnMgYW5kIG9uZSBVQkkgcGFydGl0aW9uICh3aXRoIHViaWZzL3NxdWFzaGZzIHZvbHVt
ZXMpLgo+Cj4gV2UgYXJlIHNlZWluZyBsYXJnZSBudW1iZXJzIG9mIHRoZXNlIGxvZ3Mgb24gdGhl
IHNlcmlhbCBjb25zb2xlIHRoYXQKPiBpbXBhY3QgdGhlIGJvb3QgdGltZS4KPiBbLi4uLl0KPiBb
ICAgIDkuNjY3MjQwXVsgICAgVDldIENyZWF0aW5nIDU4IE1URCBwYXJ0aXRpb25zIG9uICIxYzk4
MDAwLm5hbmQiOgo+IFsuLi4uXQo+IFsgICAzOS45NzU3MDddWyAgVDUxOV0gbXRkYmxvY2s6IE1U
RCBkZXZpY2UgJ3VlZmlfYScgaXMgTkFORCwgcGxlYXNlCj4gY29uc2lkZXIgdXNpbmcgVUJJIGJs
b2NrIGRldmljZXMgaW5zdGVhZC4KPiBbICAgMzkuOTc1NzA3XVsgIFQ1MTldIG10ZGJsb2NrOiBN
VEQgZGV2aWNlICd1ZWZpX2InIGlzIE5BTkQsIHBsZWFzZQo+IGNvbnNpZGVyIHVzaW5nIFVCSSBi
bG9jayBkZXZpY2VzIGluc3RlYWQuCj4gWy4uLi5dCj4KPiBUaGlzIHdhcyBhZGRlZCBhcyBwYXJ0
IG9mIHRoaXMgY29tbWl0Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvbXRkL210ZGJsb2NrLmM/
aD12NS4xNS4xMjAmaWQ9ZjQxYzk0MThjNTg5OGMwMTYzNDY3NTE1MDY5NmRhMjkwZmI4Njc5Ngo+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9s
aW51eC5naXQvY29tbWl0L2RyaXZlcnMvbXRkL210ZGJsb2NrLmM/aD12NS4xNS4xMjAmaWQ9ZTA3
NDAzYThjNmJlMDE4NTdmZjc1MDYwYjJkZjlhMWFhODMyMGZlNQoKWW91IGhhdmUgNS4xNS53aGF0
IGV4YWN0bHk/ICBjb21taXQgZjQxYzk0MThjNTg5OCB3YXMgYWRkZWQgaW4gdjUuMTUuNDYuCllv
dXIgbG9nIGxvb2tzIGxpa2UgaXQgaXMgbWlzc2luZy4KCkZXSVcsIGNvbW1pdCBmNDFjOTQxOGM1
ODk4IHdhcyBzdXBwb3NlZCB0byBmaXggZXhhY3RseSB0aGF0IHByb2JsZW0gd2l0aApjb21taXQg
ZTA3NDAzYThjNmJlMDEuCgpCdXQgdG8gY2F0Y2ggYWN0dWFsIG1vdW50cyBpdCB3aWxsIHN0aWxs
IHdhcm4gaWYgdGhlIG10ZGJsb2NrIGRldmljZSBpcwpvcGVuZWQuICBUaGlzIGNhbiBvYnZpb3Vz
bHkgY2F1c2UgZmFsc2UgcG9zaXRpdmVzIGlmIHlvdSBlLmcgaGF2ZSBzb21lCnNjcmlwdCByZWFk
aW5nIGZyb20gdGhlIG10ZGJsb2NrIGRldmljZXMuICBJZiB5b3UgYXJlIHJ1bm5pbmcgdjUuMTUu
NDYgb3IKbGF0ZXIgdGhlbiB0aGVyZSAqaXMqIHNvbWV0aGluZyBhY2Nlc3NpbmcgdGhvc2UgZGV2
aWNlcy4gWW91J2xsIGhhdmUgdG8KZmlndXJlIG91dCB3aGF0IGl0IGlzIGFuZCBzdG9wIGl0IHRv
IGF2b2lkIHRoZSB3YXJuaW5nLgoKCkJqw7hybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
