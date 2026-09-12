Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FCEC88E45
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2026 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jMFJ8TCeZp6nACj9+d7BlNlgz5WHrDR9ooYgp36FI8=; b=aQfqroJpZxRwAx
	6G8PJY7fzE/+M8XzaMXqmBHAfz1rbBL4hTuRH8WUAlhv12EVJkaFzmG0VlfUXMLAGIHaDZXmUHVw7
	URBLWbRgrfk15RIxTNEghaLFzYjEiZIiUnWYeyvEy2NQ8q5bTBbA7KXx8klQZXhmlmIjLVKBwu1mX
	NY+4CyZZ7egvLm/TUvcZngiO5MRp1IOA2xd0Y7bwaM05GHrUrWis8GdEl434cPmAYprPBOsmSUuc6
	ovyWVR32ZV8RDDn9hnsKi5wgsAr22TcpRo/XSKn5pPSGncIF0DkkCydM+xC//2mX3tQ9XlJEuVxwR
	NjzC9NiAYGayMDeUH7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5CEH-00000000T9E-2pi5;
	Sat, 12 Sep 2026 01:08:29 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5CEF-00000000T8q-283l
	for linux-mtd@lists.infradead.org;
	Sat, 12 Sep 2026 01:08:28 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e56a1b327so303134d50.0
        for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2026 18:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789175305; cv=none;
        d=google.com; s=arc-20260327;
        b=NxxlY7REKNDsjxjAdaIWJAuBy3bFUPzPWF21KIgB+LqmvnEn7ZY6LqZBlbNRnO+DlC
         bML/np5jJh7yi7hQ+prZ43oUFK494iaCDJNzTryGY48MwtCFj46eumc6zsR8y+lUA8dj
         7YLtFSgMGKUSKKFogi1uBPWT743dLX4xL2L4DNvAcmYw5jz3IEVLGtp++9CYZjjw3BTd
         BNyvx8Gv2bMhiwRtJASO1JUWCbhkN7TwWRGdLUREGcecSU77I0RoK3lOuki2vixi260Z
         basQhbqVMFnAfshsTKS/NJqDcxQzobFevD9Odu3VP1tuHnjrjnb0ONQ7skW01V9PPqJu
         OL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKyJZHwsFn0BbxzZ5YQb+9hvZXMLKbPzB6qiWwqhbV8=;
        fh=e4faXRamLhwtVOnL5aIXKabaY6wYZC40aHZtHYTU7ps=;
        b=pBbrL25qy2qqOy4oIb708USQcgUlxR5M1FsBtw+KudE5mEdjB0BWfjxqbnaTSjB1bV
         WejbAql5/aN7/+NauIFDZZRYty8QlC3CcESPbwcVBJgRx1yEMOj78ER7oB+KBxQq6FVt
         EWznjXwfDIiHwCPLkvESu4EqHiJYQ3GN1iCliMG4d27SH/N+eL+MYNUofe0OF4WA9kt9
         fNndgk6Eiv8xBeFMX6Ves4PP8F8hWjMeZUCENZDDkDW4ur0LwhxXhNNL4wcKTJWoffzh
         yQvCl4Kpwq9ewGw5SqCHKQNRPwNUDdBESv6fmnOl00cavehinVat3k1QDl7dQrK893L0
         VZaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175305; x=1789780105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKyJZHwsFn0BbxzZ5YQb+9hvZXMLKbPzB6qiWwqhbV8=;
        b=gIKq3DdRDWPTLBftGK/qz/JcEb21u5iO31q7vEqqSntR3MbZex2uwqX5sq+gj7kc01
         LTHrYFUKAakxXqYnAjmOg1cu8oDrZohlD6uHvcbF2pSgELuUwB3gfCFQ/crsYGROXJWB
         rwTxNqjGpmZ21s/FS/3NC5pzKSLj7l6AemRTIRXBxQNsITxxNXWzB/H3yz/u211JaWno
         HWTxQXeAU6tzebeztoTgY2Tsrv9x7Yc3DeiYiv7IZxaXJGZy5eIMxaV8FqOap3TsjfAu
         QCLvAclruw9KvWLarL5Dx1NIHMRc56tSljQ1Lch9tD2MDZXLuvKbWT3njdauguZgcyYg
         fwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175305; x=1789780105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKyJZHwsFn0BbxzZ5YQb+9hvZXMLKbPzB6qiWwqhbV8=;
        b=H7ZY4JDdXq8Cythujb4XcDCK6t4md7j79RlT8watdmK+EK32BEu9kJSRd+XJ0ry+sD
         bSurQPuHeMIdDW5SMaTaqw0wJalfv/tbQ4Qs4DXgO/AvbLltQIzHQ6Sy2DVNhUfpJvmu
         r9ThZ4Ez2ewWVUjLOz1Qzf5kj17iROPZ8nlBYM59TbQCKieUN4RwyNZy6yCCIJB/GBWA
         Fwn22QoIxyFvrcz1+VP6RVCbpa8XWM+euPTvGn7VmIK8vfi33by9/2iCEVWXh6j3/Z4B
         csdxWVGfbIcssU8Fhf3yA5cIPrtJ0Bmj19C8WzX8oHBFJjsOUd9KVmI/N6NfwpxNyg/v
         6bdA==
X-Forwarded-Encrypted: i=1; AKwUvBxvP77GbzBlUrN/mws4MvRp3xdFWHF25IkmRVrxRwXXTkrmsiz7BDuuex6okl3iMLBE1wquCYv/AdM=@lists.infradead.org
X-Gm-Message-State: AFuF++lFK8y0UMh5gN0t55gLl0M6igvIsNpxMtjQ/SO8mFNHhYN44Skn
	AYWlkUVoqrSk0OViR94jWaczwQIfRYbgNnZKo4q/64JSjBVcSpwufmok8jTpFLimulhNygUk0v4
	EPJ4RA80l2prHSuZptKBgTWg6tCCp0Eo=
X-Gm-Gg: AYBFou0aurvnEE9sGWPAy7p39v64R7i69eivxBweZKcew2R7R26+eBP8wXonLY7jufl
	DbnUK8cjPzJy3Oxeq3/TEtzZk9ldlUyzLcPJCoo/ouaf35BifKY854m0eylI4BsAT+8faBu5C5+
	Q6W/wPxhRkk3NZUF2AfBNR36bQi9xqqrOqpzrHbcHoGOqMMEznXpC/teusO3PlEDOiSPCf58yzK
	T52PO7D7y7jPbGUr5MYCJXpbNYC9ejyWuqYhvO/ksn2Ddklt6rmStsa6IOxg2Ms0rT+4BO+i4xg
	QU5TY52GhBlX1DtXAqjaah0xnLzdyHC/FGb0DJZnTninenoCDwcHjeGVOR0dJYOKDBaM2ZoxwQd
	8ZurEVwxyllJpedX3pDHpY1gvi4/uemIBWdW0Iy7AW9HQ
X-Received: by 2002:a05:690e:440c:b0:66c:7f92:176c with SMTP id
 956f58d0204a3-6712454b9f9mr2374904d50.2.1789175305542; Fri, 11 Sep 2026
 18:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com>
In-Reply-To: <20260823152648.23136-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 06:38:13 +0530
X-Gm-Features: AcwNN1VQytEq1qS-XLzgRJP3xvclzDl0_eCXcNycdIuh8Uwjwmu232U5iEo2u2s
Message-ID: <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: dwmw2@infradead.org, richard@nod.at
Cc: kees@kernel.org, viro@zeniv.linux.org.uk, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_180827_563045_EDF55DEC 
X-CRM114-Status: GOOD (  19.78  )
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

T24gU3VuLCBBdWcgMjMsIDIwMjYgYXQgODo1N+KAr1BNIERlZXBhbnNodSBLYXJ0aWtleQo8a2Fy
dGlrZXk0MDZAZ21haWwuY29tPiB3cm90ZToKPgo+IGpmZnMyX2FsbG9jX2lub2RlKCkgZG9lcyBu
b3QgaW5pdGlhbGl6ZSBmLT50YXJnZXQgYmVmb3JlIHJldHVybmluZwo+IHRoZSBuZXcgaW5vZGUu
IEl0IGlzIG5vcm1hbGx5IGNsZWFyZWQgbGF0ZXIgYnkKPiBqZmZzMl9pbml0X2lub2RlX2luZm8o
KSwgY2FsbGVkIGZyb20gamZmczJfaWdldCgpLCBidXQgdGhhdCBydW5zCj4gb25seSBhZnRlciBh
bGxvY19pbm9kZSgpIGhhcyBhbHJlYWR5IHJldHVybmVkIHN1Y2Nlc3NmdWxseS4KPgo+IElmIGlu
b2RlX2luaXRfYWx3YXlzKCkgZmFpbHMgaW4gYmV0d2VlbiwgYWxsb2NfaW5vZGUoKSBjYWxscwo+
IC0+ZnJlZV9pbm9kZSgpIGRpcmVjdGx5IG9uIHRoZSBoYWxmLWluaXRpYWxpemVkIGlub2RlLgo+
IGpmZnMyX2ZyZWVfaW5vZGUoKSB0aGVuIGRvZXMga2ZyZWUoZi0+dGFyZ2V0KSBvbiB3aGF0ZXZl
ciBzdGFsZQo+IHZhbHVlIHdhcyBsZWZ0IGluIHRoZSByZXVzZWQgc2xhYiBvYmplY3QsIHdoaWNo
IGNhbiBiZSBhIHBvaW50ZXIKPiB0aGF0IHdhcyBhbHJlYWR5IGZyZWVkLCBjYXVzaW5nIGEgZG91
YmxlLWZyZWUuCj4KPiBJbml0aWFsaXplIGYtPnRhcmdldCB0byBOVUxMIGluIGpmZnMyX2FsbG9j
X2lub2RlKCkgdG8gY2xvc2UgdGhpcwo+IHdpbmRvdywgYW5kIGNsZWFyIGl0IGluIGpmZnMyX2Zy
ZWVfaW5vZGUoKSBhZnRlciBmcmVlaW5nIGl0IHNvIGEKPiByZXVzZWQgb3IgcmUtZnJlZWQgb2Jq
ZWN0IGNhbiBuZXZlciBjYXJyeSBhIGRhbmdsaW5nIHBvaW50ZXIuCj4KPiBGaXhlczogNGZkY2Zh
YjViNTUzICgiamZmczI6IGZpeCB1c2UtYWZ0ZXItZnJlZSBvbiBzeW1saW5rIHRyYXZlcnNhbCIp
Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCs2NzVlODRmZGYzZGRlNjdiNDk0NkBzeXprYWxsZXIuYXBw
c3BvdG1haWwuY29tCj4gQ2xvc2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/
ZXh0aWQ9Njc1ZTg0ZmRmM2RkZTY3YjQ5NDYKPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYW5zaHUgS2Fy
dGlrZXkgPGthcnRpa2V5NDA2QGdtYWlsLmNvbT4KPiAtLS0KPiAgZnMvamZmczIvc3VwZXIuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL2pmZnMyL3N1cGVyLmMgYi9mcy9qZmZzMi9zdXBlci5jCj4gaW5kZXggODEzOTZhMDkyYmE4
Li4zMGQ3NTNkNGMyNjMgMTAwNjQ0Cj4gLS0tIGEvZnMvamZmczIvc3VwZXIuYwo+ICsrKyBiL2Zz
L2pmZnMyL3N1cGVyLmMKPiBAQCAtNDIsNiArNDIsNyBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpq
ZmZzMl9hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQo+ICAgICAgICAgZiA9IGFs
bG9jX2lub2RlX3NiKHNiLCBqZmZzMl9pbm9kZV9jYWNoZXAsIEdGUF9LRVJORUwpOwo+ICAgICAg
ICAgaWYgKCFmKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgIGYtPnRh
cmdldCA9IE5VTEw7Cj4gICAgICAgICByZXR1cm4gJmYtPnZmc19pbm9kZTsKPiAgfQo+Cj4gQEAg
LTUwLDYgKzUxLDcgQEAgc3RhdGljIHZvaWQgamZmczJfZnJlZV9pbm9kZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlKQo+ICAgICAgICAgc3RydWN0IGpmZnMyX2lub2RlX2luZm8gKmYgPSBKRkZTMl9JTk9E
RV9JTkZPKGlub2RlKTsKPgo+ICAgICAgICAga2ZyZWUoZi0+dGFyZ2V0KTsKPiArICAgICAgIGYt
PnRhcmdldCA9IE5VTEw7Cj4gICAgICAgICBrbWVtX2NhY2hlX2ZyZWUoamZmczJfaW5vZGVfY2Fj
aGVwLCBmKTsKPiAgfQo+Cj4gLS0KPiAyLjM0LjEKPgoKR2VudGxlIFJlbWluZGVyLiBQbGVhc2Ug
bGV0IG1lIGtub3cgdGhlIHN0YXR1cyBvZiB0aGlzIHBhdGNoLgoKVGhhbmtzCgpEZWVwYW5zaHUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
