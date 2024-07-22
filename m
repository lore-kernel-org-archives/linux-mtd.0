Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366DEC3DA5D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3HDU3Ef8OLfluH0wBF9Y8PrcRdgCvtOBytsB9DmIkk=; b=fD8zlkrfHXzvb+
	Er7dA6QHf4kvdH0/tB9O2W0brdkygroUYLwf4u4nW25Ma3GNnPFo+TFtMihbcBqbutw/3/Ofl6PkA
	Y8q7rPENRsgCdic7/+L72Z4QcgRbGlKM/6GWLtClCvVkk4RwovAgHC2yjkm1w187v1SQX3gO+fSQ+
	2ynUzG7jz87dU6ClBygyloabDqqBWMgDg6G5tcrJX6oEDaPAzUP2T86PbrpkAGrtJtHHIVxNs/wPx
	EN+teY9pRlh99upGRIaBfQbvzcRdwNv8eHGJmGcrV2nPdIhJ1KgwlcucLrgNUqcW/lQAtmhI4xuJw
	0EOqkkHwaQn0xGkQcsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvz6-0000000A5gg-321n;
	Mon, 22 Jul 2024 16:34:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvz4-0000000A5f8-0moq
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 16:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721666036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FsMiBIkevMqXBW2DcNPEnH7DY2ezXcbrlK8J00Zf6Qo=;
	b=D0QagGetdgFC6NGHb3Cr1nFLpyAAxBsUDcs2dRPyHgJvOt4x9yLL8UH2TNQ12TpmhnaLkk
	B4Jh8cL+WIcXds+rdvPsziyAP0JUgqeUxuq9c2m7jUi2KpIUh0Nqo6pinkF27rrt9Rm27F
	aUCgMO/4X8j5aFA/QalSd3Y21lxc6us=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-cx4EgXcrPJqA73xkeFXvAw-1; Mon, 22 Jul 2024 12:33:52 -0400
X-MC-Unique: cx4EgXcrPJqA73xkeFXvAw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42667cc80e8so33984335e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2024 09:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721666031; x=1722270831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsMiBIkevMqXBW2DcNPEnH7DY2ezXcbrlK8J00Zf6Qo=;
        b=W+wltjI6iD/XmZ4SBFk74qmkM9L2/UlBWNFykj7yZbHgpDtGD/evhgF/ghDjJ0GX6a
         tQJ9g+i4ZuoJPTrMYubI2U/cgBOI3qVT551h/LJ+cXCMxZJnx0PDavrpLhUhAYC9UR32
         qzBr64uLrEd5w58kuo6cNq1VTLn6aqXzSiDY/tvUWDfBPFPPS+uG/sqO7ZHf88SpgObW
         0KuQmvpYuUQbU4Q3ckvJOJGcdu83RFNbL+Y/h4ui+jyJ83/JGKZiLi5Tck5nQP4t2y0s
         VlKVJcSVNHEeyD1KZOH1Jxk0b2bhlpK/CvIcB7VzaTs30TQrTINziasVRwsiipZmjpYB
         HJMA==
X-Forwarded-Encrypted: i=1; AJvYcCUEELrVqBxJOeguAa2rwDsja0TAbEaHUwkRJZ2FStKaDnhUsqQN9qdmtNR5G22caViZrkhnGYjjF0QlrWC5IWU05jRqYH+JupVLsDGCLQ==
X-Gm-Message-State: AOJu0YxvIZYHZy95MSNxU3z1AXOFcgxo/NY7OPRBeMHZvaPXQwGUrwPR
	lp9jSdbJcMjEy6SUM+jKBtJxlVSuz3OuXR9wB6zbTE5P49QhmfFUW09LNHfzjxjwXaCoOdn9u/g
	HFDfAxckkBgdOLoWKZIL4XdElYfqoWpB60iSyfwWfXIEr6TW1qugg1LLpT939pB4=
X-Received: by 2002:a05:600c:5249:b0:426:6710:223c with SMTP id 5b1f17b1804b1-427ecfdfbfdmr3456055e9.9.1721666031477;
        Mon, 22 Jul 2024 09:33:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhKPZMMgKyz4fSPYvf9iTPhG7gauOPL0vg5XbFth0P+eIWasAnvRYSb0MhB0GEllFAUXFdAQ==
X-Received: by 2002:a05:600c:5249:b0:426:6710:223c with SMTP id 5b1f17b1804b1-427ecfdfbfdmr3455885e9.9.1721666031086;
        Mon, 22 Jul 2024 09:33:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6? ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8e42bsm164383095e9.30.2024.07.22.09.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 09:33:50 -0700 (PDT)
Message-ID: <d7b13cc3-d7b7-4cf2-b08a-4228efe04f53@redhat.com>
Date: Mon, 22 Jul 2024 18:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Knop Ryszard <ryszard.knop@intel.com>
References: <20240719152542.1554440-1-jfalempe@redhat.com>
 <1868573045.102281.1721661681881.JavaMail.zimbra@nod.at>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1868573045.102281.1721661681881.JavaMail.zimbra@nod.at>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_093358_320255_FA4D11CA 
X-CRM114-Status: GOOD (  15.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyMi8wNy8yMDI0IDE3OjIxLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gLS0tLS0g
VXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBCZXRyZWZmOiBbUEFUQ0hdIG10ZDogbXRkb29w
czogRml4IGttc2dkdW1wIHBhcmFtZXRlciByZW5hbWluZy4KPiAKPj4gV2hlbiB0aGUga21zZ19k
dW1wZXIgY2FsbGJhY2sgcGFyYW1ldGVyIGNoYW5nZWQsIHRoZSByZWFzb24gdmFyaWFibGUKPj4g
aW4gbXRkb29wc19kb19kdW1wKCkgd2FzIG5vdCB1cGRhdGVkIGFjY29yZGluZ2x5Lgo+PiBUaGlz
IGJyZWFrcyB0aGUgYnVpbGQgd2l0aCBtdGRvb3BzLgo+Pgo+PiBGaXhlczogZTFhMjYxYmE1OTll
ICgicHJpbnRrOiBBZGQgYSBzaG9ydCBkZXNjcmlwdGlvbiBzdHJpbmcgdG8ga21zZ19kdW1wKCki
KQo+PiBSZXBvcnRlZC1ieTogS25vcCBSeXN6YXJkIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+Cj4+
IC0tLQo+Pgo+PiBUaGUgb2ZmZW5kZWQgY29tbWl0IGlzIGluIHRoZSBkcm0tbWlzYyB0cmVlLCBi
ZWNhdXNlIGl0IHdhcyBuZWVkZWQKPj4gYnkgZHJtX3BhbmljLiBTbyBJIHdpbGwgcHVzaCB0aGUg
Zml4IHRoZXJlIHRvby4KPj4KPj4gZHJpdmVycy9tdGQvbXRkb29wcy5jIHwgNCArKy0tCj4+IDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9tdGRvb3BzLmMgYi9kcml2ZXJzL210ZC9tdGRvb3BzLmMKPj4g
aW5kZXggODZkNDlkYjkxOTZkLi43YmYzNzc3ZTFmMTMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bXRkL210ZG9vcHMuYwo+PiArKysgYi9kcml2ZXJzL210ZC9tdGRvb3BzLmMKPj4gQEAgLTMwNSw3
ICszMDUsNyBAQCBzdGF0aWMgdm9pZCBtdGRvb3BzX2RvX2R1bXAoc3RydWN0IGttc2dfZHVtcGVy
ICpkdW1wZXIsCj4+IAlzdHJ1Y3Qga21zZ19kdW1wX2l0ZXIgaXRlcjsKPj4KPj4gCS8qIE9ubHkg
ZHVtcCBvb3BzZXMgaWYgZHVtcF9vb3BzIGlzIHNldCAqLwo+PiAtCWlmIChyZWFzb24gPT0gS01T
R19EVU1QX09PUFMgJiYgIWR1bXBfb29wcykKPj4gKwlpZiAoZGV0YWlsLT5yZWFzb24gPT0gS01T
R19EVU1QX09PUFMgJiYgIWR1bXBfb29wcykKPj4gCQlyZXR1cm47Cj4+Cj4+IAlrbXNnX2R1bXBf
cmV3aW5kKCZpdGVyKTsKPj4gQEAgLTMxNyw3ICszMTcsNyBAQCBzdGF0aWMgdm9pZCBtdGRvb3Bz
X2RvX2R1bXAoc3RydWN0IGttc2dfZHVtcGVyICpkdW1wZXIsCj4+IAkJCSAgICAgcmVjb3JkX3Np
emUgLSBzaXplb2Yoc3RydWN0IG10ZG9vcHNfaGRyKSwgTlVMTCk7Cj4+IAljbGVhcl9iaXQoMCwg
JmN4dC0+b29wc19idWZfYnVzeSk7Cj4+Cj4+IC0JaWYgKHJlYXNvbiAhPSBLTVNHX0RVTVBfT09Q
Uykgewo+PiArCWlmIChkZXRhaWwtPnJlYXNvbiAhPSBLTVNHX0RVTVBfT09QUykgewo+IAo+IEFj
a2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKSSBwdXNoZWQgaXQg
dG8gZHJtLW1pc2MtbmV4dC4KClRoYW5rcyBhIGxvdC4KCj4gCj4gVGhhbmtzLAo+IC8vcmljaGFy
ZAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
