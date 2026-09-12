Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E998C88E45
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Sep 2026 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VutHCzwIxvHNnEhdUXBZq5z67MSe6bEJs0uZ7hrlTPc=; b=Eb6pZsdbU993L9
	kFh1sCc1AxaDnfGvD/xqqJWegGjh/txuLB9wElp/LUtkg3i+rwU4rwAvtpEMmtPloPZTwxLE5y6hj
	AJz4TKe85pHLidlt+5G5Qy5YBPNHyUs6bi9HoPeKufOwhutN8iovPk6JU99LCcUHVJFzzm9MbAanv
	ewjjx43wFjLYM3bwdauW7k2If4Ggj5YMZd618yWt9Pio+nWglqNFxqNdAivDCWaiINlcAN8/6wUdb
	Rpo4VpmA9OSJxdTVjdzOBPmnuLhjQnXFM7re3PU4K15gqR1zYtNX6bsb/QnvMhfJnST3o1dvuftVl
	SFpoBnbHYA9SpqUsDV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Iel-00000000fyh-07uw;
	Sat, 12 Sep 2026 08:00:15 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Iei-00000000fxV-0Ta4
	for linux-mtd@lists.infradead.org;
	Sat, 12 Sep 2026 08:00:13 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab20a33so259622d50.1
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 01:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789200011; cv=none;
        d=google.com; s=arc-20260327;
        b=aRre4v1im64GV0tEAeOl1nEli8Ow67wGbwmipEpQar8L5hmJ1y9cKuqmIZNWiO60L8
         SubeIl7NE+FIj5eU+mCUVL+iP49AivTXxUkDWxtoq1TZpltCGOIzlaBxcV4cqE4D2bSU
         THib5/QWuuOBh3xmJ0Tuw6hRj8txjezoivPct2Z0nm8Sm1K1YB8serTWj9k0PeT5GZ4k
         OfHhfazOSA9+NIAElT5Bzc/8zDnBddesJYlZB2iYvEQPSrNXPTDqW6VyuKrd9mweLpjF
         V+MPS6ncSD5F5V/w2WKoHzC5GS3yVfYwv4yy5EeH3Tm/wWJacoi/qQY+42Wd46fXB0Yh
         Q4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oTqbRJVt84EGCV9WE0vPswWimELlakVhJJBstpXzZFg=;
        fh=sew/xBMQFVTewJrCvgXGv5oXuOw4moWsxpkqwb8X1fM=;
        b=fYXgaxhZ4JcL+Bzt+LU8YAldIam923h5DAdcWd7UiS1HXtgTwxq1wbUytOTLx4P3mA
         pd33h6536LrteV8kE72jbooXcdTqnr+PPlu2gSZCnwe2UusW6sLB1nf0Mei7q2wsk/kT
         meLUgB28tvQ6bPZWzH7PvEpi3PdeHqnjCx5cwCwokug7C1TfKH6SbqYEo12l7GZpSZZB
         oIpvriTroIe0k47JM2RU85InCw7eW9MAhSpXDObfcgMtlgggLJvQcrq0jgAFEXBOTafy
         w8knidsydbh1wyB69PthFusGNetrWDQL0WMhenFHvHh+Sr153eLkcExlhoR+WMTzi0Bt
         yDmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200011; x=1789804811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTqbRJVt84EGCV9WE0vPswWimELlakVhJJBstpXzZFg=;
        b=V6topSKzCXYyzNC64YWyTLOD1koCKZuzfWqO5vIixwajjVS0c5cDA59RIc3UQ/k+7P
         GcA0fL6erw4s1FWn8IMPAiVc5esmn64JJ4Llc7rv+neR5wDE7EvM+1KyZxJyPXhfXCxS
         SoLaT+VCIzGRcvh/kZeQ9UN/egZAWOY6SW5YlHhSe6wEEdIj2KUi3Ln7dRr7bNkPgQtt
         n4Chx6SoMWMuzN1GVNEkqrDA2wBK9fVEPV/+MPOK5iqNaltAj521nvK2FTYFYWPi4kd7
         PdTl4lDyDuCF/IBSg/KePZCtdcwj4paEhp7SzBawWjRpvk/deilBNNppcpOoPcWrFHSz
         oUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200011; x=1789804811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTqbRJVt84EGCV9WE0vPswWimELlakVhJJBstpXzZFg=;
        b=VAYSo+nRA9M+eeVLrOJfjhK/D4GjP4X8nYI347IPiwMWSHk/RICuoggFkEHqxfjcv/
         goevTLZoWLnpELf++qjLYY7B/KK8GSlcIRnKAKNrO3VOQ1O8MYQ0RCXZesXyY3nrAk7l
         PlHFr5+9kNq6CXJ1gm3OWqvLkUn+qnAnpT9ardAjONtLCmJPKui9ojJfhXnUiyTgAR8a
         0jlbpLods8/bHhn+CepD6Wj3ryeRhpa7JOxgnfoj3mcfNndzOuh0Gv4XoLpc98bbkdi/
         lQghq6khxdX7Nva/zpHTNVnuSlNxJ6b2iBArCzy3Bd5LvimOlIKpxFrovki+fPmuJ170
         oFlA==
X-Forwarded-Encrypted: i=1; AKwUvBy9hx9r6cLlgbI3JFQk6Y8Zess7rVaKbc8W+y3bR/7ZkScPl/EXwsQgM38L1YCE6ndWK82sr8Fv6GA=@lists.infradead.org
X-Gm-Message-State: AFuF++kgjg5+7LEWd4Qxk7cCnmsU/E6dgmgdtJTogvznByYvHNeZZXDd
	M4CNp/4XMRUoHKwX0IFN6B74d6jt9bPsLSNK423mva7Qt8TvsHX02bOT9E7CVRkEGCi4JbCf2oM
	jYUHafM0T+LFMArKDoWr6bATgFEsPEU6KUwm4
X-Gm-Gg: AYBFou3X31o3FEjVN8O7fgbLyDGiEkCMu2xRnDby27ETp0IFmBB2N2wJxEUvyCaYP/x
	VFWZFHNcoHsXKD5/stQvJBZKjymyy3Dr83Gp/AhodhdGkRgyMSQutF5L8p1qUhvkjZ7B+IgjjKj
	LVWV+hQiav5NKU0KSAwQvwVA0hV+rxkvMUMt1HbiBXOLdYGSOmBj06YUhNoH8AMt3kAIdEl3L6n
	29RqTOyqKGjsiyVEDZqkpQn4rg3VmkyELRwEy9xKS5i27ohkz5dq5Zf4WaPY2Gc39AkCTVN9JtW
	zKOF+gUnMsgeeijIusUgLmHl8LU8lUeZLu9G1YJcfe+JODPZTVu6IixdLHOlPmgrUQNzRqlFW1m
	7Or/LoxJt/dYjvV9TBT3+yGwTa3Rs3MGUWNc5FbjkyJa+sg==
X-Received: by 2002:a05:690e:134c:b0:671:2114:2bf6 with SMTP id
 956f58d0204a3-67135aa5837mr325455d50.48.1789200010722; Sat, 12 Sep 2026
 01:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com> <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
 <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
In-Reply-To: <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sat, 12 Sep 2026 13:29:59 +0530
X-Gm-Features: AcwNN1VuzI_b1oLLTOSxq0zOitpCnoW1EI2NKFmM2KiR-zUQ1n_nMB6an1I_pcE
Message-ID: <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: Richard Weinberger <richard@nod.at>
Cc: dwmw2@infradead.org, kees@kernel.org, viro@zeniv.linux.org.uk, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_010012_167839_5454DF49 
X-CRM114-Status: GOOD (  28.31  )
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

T24gU2F0LCBTZXAgMTIsIDIwMjYgYXQgMTI6MjjigK9QTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IEFtIFNhdCwgU2VwIDEyLCAyMDI2LCAwMzowOCBzY2hy
aWViIERlZXBhbnNodSBLYXJ0aWtleSA8a2FydGlrZXk0MDZAZ21haWwuY29tPjoKPgo+ID4gT24g
U3VuLCBBdWcgMjMsIDIwMjYgYXQgODo1N+KAr1BNIERlZXBhbnNodSBLYXJ0aWtleQo+ID4gPGth
cnRpa2V5NDA2QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IGpmZnMyX2FsbG9jX2lub2Rl
KCkgZG9lcyBub3QgaW5pdGlhbGl6ZSBmLT50YXJnZXQgYmVmb3JlIHJldHVybmluZwo+ID4gPiB0
aGUgbmV3IGlub2RlLiBJdCBpcyBub3JtYWxseSBjbGVhcmVkIGxhdGVyIGJ5Cj4gPiA+IGpmZnMy
X2luaXRfaW5vZGVfaW5mbygpLCBjYWxsZWQgZnJvbSBqZmZzMl9pZ2V0KCksIGJ1dCB0aGF0IHJ1
bnMKPiA+ID4gb25seSBhZnRlciBhbGxvY19pbm9kZSgpIGhhcyBhbHJlYWR5IHJldHVybmVkIHN1
Y2Nlc3NmdWxseS4KPiA+ID4KPiA+ID4gSWYgaW5vZGVfaW5pdF9hbHdheXMoKSBmYWlscyBpbiBi
ZXR3ZWVuLCBhbGxvY19pbm9kZSgpIGNhbGxzCj4gPiA+IC0+ZnJlZV9pbm9kZSgpIGRpcmVjdGx5
IG9uIHRoZSBoYWxmLWluaXRpYWxpemVkIGlub2RlLgo+ID4gPiBqZmZzMl9mcmVlX2lub2RlKCkg
dGhlbiBkb2VzIGtmcmVlKGYtPnRhcmdldCkgb24gd2hhdGV2ZXIgc3RhbGUKPiA+ID4gdmFsdWUg
d2FzIGxlZnQgaW4gdGhlIHJldXNlZCBzbGFiIG9iamVjdCwgd2hpY2ggY2FuIGJlIGEgcG9pbnRl
cgo+ID4gPiB0aGF0IHdhcyBhbHJlYWR5IGZyZWVkLCBjYXVzaW5nIGEgZG91YmxlLWZyZWUuCj4g
PiA+Cj4gPiA+IEluaXRpYWxpemUgZi0+dGFyZ2V0IHRvIE5VTEwgaW4gamZmczJfYWxsb2NfaW5v
ZGUoKSB0byBjbG9zZSB0aGlzCj4gPiA+IHdpbmRvdywgYW5kIGNsZWFyIGl0IGluIGpmZnMyX2Zy
ZWVfaW5vZGUoKSBhZnRlciBmcmVlaW5nIGl0IHNvIGEKPiA+ID4gcmV1c2VkIG9yIHJlLWZyZWVk
IG9iamVjdCBjYW4gbmV2ZXIgY2FycnkgYSBkYW5nbGluZyBwb2ludGVyLgo+ID4gPgo+ID4gPiBG
aXhlczogNGZkY2ZhYjViNTUzICgiamZmczI6IGZpeCB1c2UtYWZ0ZXItZnJlZSBvbiBzeW1saW5r
IHRyYXZlcnNhbCIpCj4gPiA+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNjc1ZTg0ZmRmM2RkZTY3YjQ5
NDZAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4gPiBDbG9zZXM6IGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD02NzVlODRmZGYzZGRlNjdiNDk0Ngo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEZWVwYW5zaHUgS2FydGlrZXkgPGthcnRpa2V5NDA2QGdtYWlsLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBmcy9qZmZzMi9zdXBlci5jIHwgMiArKwo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIvc3Vw
ZXIuYyBiL2ZzL2pmZnMyL3N1cGVyLmMKPiA+ID4gaW5kZXggODEzOTZhMDkyYmE4Li4zMGQ3NTNk
NGMyNjMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2pmZnMyL3N1cGVyLmMKPiA+ID4gKysrIGIvZnMv
amZmczIvc3VwZXIuYwo+ID4gPiBAQCAtNDIsNiArNDIsNyBAQCBzdGF0aWMgc3RydWN0IGlub2Rl
ICpqZmZzMl9hbGxvY19pbm9kZShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQo+ID4gPiAgICAgICAg
IGYgPSBhbGxvY19pbm9kZV9zYihzYiwgamZmczJfaW5vZGVfY2FjaGVwLCBHRlBfS0VSTkVMKTsK
PiA+ID4gICAgICAgICBpZiAoIWYpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiA+ID4gKyAgICAgICBmLT50YXJnZXQgPSBOVUxMOwo+ID4gPiAgICAgICAgIHJldHVybiAmZi0+
dmZzX2lub2RlOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiBAQCAtNTAsNiArNTEsNyBAQCBzdGF0aWMg
dm9pZCBqZmZzMl9mcmVlX2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gPiA+ICAgICAgICAg
c3RydWN0IGpmZnMyX2lub2RlX2luZm8gKmYgPSBKRkZTMl9JTk9ERV9JTkZPKGlub2RlKTsKPiA+
ID4KPiA+ID4gICAgICAgICBrZnJlZShmLT50YXJnZXQpOwo+ID4gPiArICAgICAgIGYtPnRhcmdl
dCA9IE5VTEw7Cj4gPiA+ICAgICAgICAga21lbV9jYWNoZV9mcmVlKGpmZnMyX2lub2RlX2NhY2hl
cCwgZik7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgo+ID4KPiA+
IEdlbnRsZSBSZW1pbmRlci4gUGxlYXNlIGxldCBtZSBrbm93IHRoZSBzdGF0dXMgb2YgdGhpcyBw
YXRjaC4KPgo+IFdlIGdvdCBsb3QncyBvZiBpZGVudGljYWwgZml4ZXMgdGhpcyBpc3N1ZS4KPiBJ
IGhhZCBubyB0aW1lIHlldCB0byBzb3J0IG91dCB3aG8gd2FzIHRoZSBmaXJzdC4KPiBUaGlzIGlz
IG1heWJlIHRoZSBmaXJzdCByZXBvcnQgd2l0aCBmaXggc3VnZ2VzdGlvbnMsIGJ1dCB0aGUgcmVw
b3J0ZXIKPiB2YW5pc2hlZDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvQ0FG
THhHdnlaT19FRG8tWU1fRXliWkczdTdhTlVvTmlUaGh2YmhRQ3JPUEQ3bVBWNkdBQG1haWwuZ21h
aWwuY29tLwo+Cj4gVGhhbmtzLAo+IC8vcmljaGFyZAo+CgpJIGZlZWwgdGhlIHBhdGNoIHlvdSBh
cmUgcG9pbnRpbmcgYXQgZml4ZXMgYSBkaWZmZXJlbnQga2luZCBvZiBpc3N1ZSA/CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
