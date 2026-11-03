Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DA606A31B
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CnwpGDPA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEaQ1V3g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WaYxIWEHImXUE85qxfuyGIkl4yjCkK4k7NhxS+3x3Uw=; b=CnwpGDPAm0wlR4WxkAmeHM/AZQ
	K2PS1kHoR/NB0ZD0K05A8W7ZaUUiIoXSQAQD3YTPCaT/qWOPmLxrl1woG3gVStCa+6j6+To029YtN
	/iTxc+ycRQufY47LY/FsLPR+r1OmX927jcdVsqtBhfDJIXMQuThrRmYEhxrjVk+jrfm/KKcNdaiFn
	HVvCrZy+UFRrIFtCZdKkiUmEHdDe/VrWnitH0ONbb8dSCBNb6pl2gYIlwgissgpQvVAeC2aMTG0pe
	de6Csp3jPUAXrXbSx7oGLRMipHVlUf2LVDr7feaMOzqE9x3yTG33jdZWl8+0rgMcPbkHg/R3mmmtK
	G0ss/6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIN9-00000003JPf-0NcT;
	Tue, 03 Nov 2026 17:32:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIN5-00000003JP8-3dZF
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 17:32:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c4649b35bso4166022f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 09:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793727149; cv=none;
        d=google.com; s=arc-20260327;
        b=NQy0PmbaW7vAuS/e5mKeuEegM4GBm/ZRp4Q47RcHVIbWyDZZQeI8Qn3flK4IKwgxm+
         3Ytr5qUostZeXOsw9P9lsXzcDab+WMa201qBfJfSbS4tc4HrzDr+tzBy6IGKrPdKpb5i
         /TS/qH0Nu12H/Mi1ZORpS6rf/EeFqBSbWmKz4rQCV8D53EjcjzrhlsU0WySFetF+rIKZ
         y0cotxi6Gb6l+h4JZY82wz9efFyEB0cXvP9DB5JupwvQa1lwjujYvDVctw7bmxW/9KtU
         h2iIAsPgn0c6l1GVuAMq80CRlR2Rouem0tiM/52KOs4mqazh0Q7orPPf79ZTWXoGxdgS
         uoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BjAvXl9t7a/JdDo3zmQDUheOgn/OssmLnxGDAWna7Kc=;
        fh=Aq5lN2X5/iOKm5Arq5EFMWppoyz9mMq6xQbTI/tSIO4=;
        b=kKnH88vU1qDes4qh0ealdcmvoi82Wir9eed3wgbHcBEj/rcpgBITVY4KpCf5pihEdx
         jKmOLjX2SXo4ybOn9TM99iWsfZQkFPWAlwv4mmHJSeEG6YY505CsFYHKXEo5FtPgijSs
         X9353jtZDkxvUAvD8RG7PCewQhqpsl9SAgTqUIsckTnlyNSUXTR4DOE8IFwq2F6D009p
         diAS+Q5RwqBD7PiAo3rNzN8RrBopIu2Pd2+ROmRH5184ITtBYy1uPR4VUxXj2umUd0Hb
         HYvJxGueSgkZz93ADV8b9xm06g+EAELNsVFxM9wk5GH+ZLpce3uIbrADaCM1Bn0fXItH
         Z6fQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793727149; x=1794331949; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BjAvXl9t7a/JdDo3zmQDUheOgn/OssmLnxGDAWna7Kc=;
        b=vEaQ1V3gpWny1N4eIHLgXFQkUQo2u4uCfPzK7MExSVVDSbosuHkM4gg8mrbp0ombiH
         OTkMUXFBE9l/G2+xNPq9mo4Dvjiw0cxKBXWxsnGZ8dUZcNelXAHA1PFNbS8A7LpQ8vxu
         dDy0ZpxUlQotCXMJho9wkST8XhLO8d9OyjkzISz7NMOnb7sD8mrreS2t0QraVWJmW7Fu
         hPwCE9Fg39nFdGGCbL94CzHMChZj6ls7Q4azjvBjxe0aXfJ67OSuj4SKFCFPX+sU0Wcx
         WIRxZ9RxYNWOSHYRIvF4wsPuoSPkufP6QUwIH/fhKfLVJkXlaiZKWzsRsXW7LoIxmpho
         KWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727149; x=1794331949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BjAvXl9t7a/JdDo3zmQDUheOgn/OssmLnxGDAWna7Kc=;
        b=kvsAibrFI033x61yY5ciBib22Co0q6r7JC/6UZm2f47CKIMqViP0FVzll4oBArcVgg
         Dzkj+grgTiR416C/Mn3Piv9jpj0RbQnaKgOqVTFWK08cxP3cxpPuG7HIZ9P2B52PFbUY
         DNvHvEmXUqV4gLi+1BLQXTauxEocGrHP1JVTcNOTh0qKP+Og8saL1SuiJP/qzvJaCrWx
         C4Ap3ZxX0eku9Ay71l/Kc2cWNlqOXlvHmswcgdFwXKtJAJkKZUafT09rqodHiAIwYmDM
         VrKTrWwlcJ8pv/2UYZ2acClYMbuWc5kWtk3idyGFxP4uxwz8m/YW4/rJVa3DNjZrg9r2
         bsTw==
X-Forwarded-Encrypted: i=1; AKwUvBy53R6D5/NA9H1E3JSV5jNjcmjFdhZSO8+ljgz8vhLnqFJ719JufnnZuCKDcBN1MyGLeLTym0hb4Ks=@lists.infradead.org
X-Gm-Message-State: APuU4Z+CLRV9+9nqlqd+yycRBmm0BdJLqZfQjDYCAv5b08trMVdSHeeh
	aUd/Hr62rjKLiJ73PNidu0ZlLOc2f4ZWjd6OiY+6cV3APFs+wOJNOg+SGyuoG9gTRWkIp6E2nfG
	WywsO4bh2jnpXHEgbkusLBKJJZhRI+aI=
X-Gm-Gg: AYBFou1XPh/eOcMXHmDtgq0s8dRH23TOBr2/HqABgWlCA+9dRyCZHKQsAhvjiouUSzh
	vMtVHSC+WkPPK5bXo3SiMVeuE/BFa1Dcz4vQ/4W3hZwUCvj2epWOafj7YY0VhNMfAFlfbW9b0BK
	4M0eSZaDOXjuo/GVlF5TKcZPwoLM1HwhoD/0TJBL/1xKhAxdYXiHG3TlEe4OUt948xRxQB6wpK+
	6pWl3PD2gorXdXi7ws1LRTn4vt68QMlr98mVBZgmjrgX9uJhFmv5JdjwZV24yTUAFeZCbdGaUKL
	0vuF1GIWeIWCouVfXXpyxL9hwIFkT9rrxN/N9NxlWs7IBnNHMnk3eoLDhJNWIT3jqSm1Ai3RPLh
	S6fQCvH4fQKalXmCtevDkne+qAmR2S4Q4r0Kb
X-Received: by 2002:a05:6000:2c03:b0:48c:6cdd:ba89 with SMTP id
 ffacd0b85a97d-48e6e4ff80emr28595835f8f.36.1793727148868; Tue, 03 Nov 2026
 09:32:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org> <sashiko-outbox-191225@kernel.org>
In-Reply-To: <sashiko-outbox-191225@kernel.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 4 Nov 2026 02:32:10 +0900
X-Gm-Features: AclHuK_xchRwxsZ5xCgnuvGf3QgoTbZDme23pAKWici3-nvdFpdRQtDLUtkXtDM
Message-ID: <CAKFNMombDWkJ=m+CjMy7qnd_yy-vZ9c-EE7R95HKKkcy-M0+SQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] nilfs2: don't set SB_RDONLY after filesystem errors
To: sashiko-reviews@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Karl Mehltretter <kmehltretter@gmail.com>, dsterba@suse.cz, tytso@mit.edu, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_093231_958835_5D84EBBA 
X-CRM114-Status: GOOD (  30.64  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMzEsIDIwMjYgYXQgMTowOeKAr0FNIDxzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW01lZGl1
bV0gbmlsZnMyOiBuaWxmc19yZWNvbmZpZ3VyZSgpIGFuZCBuaWxmc19nZXRfdHJlZSgpIGJ5cGFz
cyBzYl9lbWVyZ2VuY3lfcm8oKQo+IC0tCj4KPiBjb21taXQgZmYxNjNmMTI5N2JjYTg5NjRmMDM3
NzY4NjljM2E4YmM5ZTNjMzhiYQo+IEF1dGhvcjogQ2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJA
a2VybmVsLm9yZz4KPgo+IG5pbGZzMjogZG9uJ3Qgc2V0IFNCX1JET05MWSBhZnRlciBmaWxlc3lz
dGVtIGVycm9ycwo+Cj4gVGhpcyBjb21taXQgcmVwbGFjZXMgc2V0dGluZyBTQl9SRE9OTFkgaW4g
X19uaWxmc19lcnJvcigpIHdpdGgKPiBzYl9zZXRfZW1lcmdlbmN5X3JvKCkgYW5kIGludHJvZHVj
ZXMgbmlsZnNfc2JfcmRvbmx5KCkgdG8gZ3VhcmQgd3JpdGUgcGF0aHMKPiBhZnRlciBmaWxlc3lz
dGVtIGVycm9ycyB3aXRob3V0IHRha2luZyBzX3Vtb3VudC4KPgo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNjA5MDMwNjA4NTUuNDYxMC0xLWttZWhsdHJldHRlckBnbWFpbC5j
b20KPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL25pbGZzMi9zdXBlci5jIGIvZnMvbmlsZnMyL3N1cGVy
LmMKPiA+IGluZGV4IDJlM2I1OTFjMTE3YzkuLmVkYjdkMzc5ZWNiZGYgMTAwNjQ0Cj4gPiAtLS0g
YS9mcy9uaWxmczIvc3VwZXIuYwo+ID4gKysrIGIvZnMvbmlsZnMyL3N1cGVyLmMKPiA+IEBAIC0x
MzcsMTIgKzEzNywxMyBAQCB2b2lkIF9fbmlsZnNfZXJyb3Ioc3RydWN0IHN1cGVyX2Jsb2NrICpz
YiwgY29uc3QgY2hhciAqZnVuY3Rpb24sCj4gPgo+ID4gICAgICAgdmFfZW5kKGFyZ3MpOwo+ID4K
PiA+IC0gICAgIGlmICghc2JfcmRvbmx5KHNiKSkgewo+ID4gKyAgICAgaWYgKCFuaWxmc19zYl9y
ZG9ubHkoc2IpKSB7Cj4gPiAgICAgICAgICAgICAgIG5pbGZzX3NldF9lcnJvcihzYik7Cj4gPgo+
ID4gICAgICAgICAgICAgICBpZiAobmlsZnNfdGVzdF9vcHQobmlsZnMsIEVSUk9SU19STykpIHsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICBwcmludGsoS0VSTl9DUklUICJSZW1vdW50aW5nIGZp
bGVzeXN0ZW0gcmVhZC1vbmx5XG4iKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBzYi0+c19m
bGFncyB8PSBTQl9SRE9OTFk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgLyogU0JfUkRPTkxZ
IG5lZWRzIHNfdW1vdW50LCBzZWUgc2Jfc2V0X2VtZXJnZW5jeV9ybygpLiAqLwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHNiX3NldF9lbWVyZ2VuY3lfcm8oc2IpOwo+ID4gICAgICAgICAgICAg
ICB9Cj4gPiAgICAgICB9Cj4KPiBbIC4uLiBdCj4KPiA+IEBAIC0xMTQxLDYgKzExNDYsMTAgQEAg
c3RhdGljIGludCBuaWxmc19yZWNvbmZpZ3VyZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gPiAg
ICAgICBpZiAoZmMtPnNiX2ZsYWdzICYgU0JfUkRPTkxZKSB7Cj4gPiAgICAgICAgICAgICAgIHNi
LT5zX2ZsYWdzIHw9IFNCX1JET05MWTsKPiA+Cj4gPiArICAgICAgICAgICAgIC8qIEFmdGVyIGFu
IGVycm9yIG5vdGhpbmcgbWF5IGJlIHdyaXR0ZW4sIGp1c3QgZ28gcmVhZC1vbmx5LiAqLwo+ID4g
KyAgICAgICAgICAgICBpZiAoc2JfZW1lcmdlbmN5X3JvKHNiKSkKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAg
ICAgICAgICogUmVtb3VudGluZyBhIHZhbGlkIFJXIHBhcnRpdGlvbiBSRE9OTFksIHNvIHNldAo+
ID4gICAgICAgICAgICAgICAgKiB0aGUgUkRPTkxZIGZsYWcgYW5kIHRoZW4gbWFyayB0aGUgcGFy
dGl0aW9uIGFzIHZhbGlkIGFnYWluLgo+ID4gQEAgLTExNTIsNiArMTE2MSwxMiBAQCBzdGF0aWMg
aW50IG5pbGZzX3JlY29uZmlndXJlKHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiA+ICAgICAgICAg
ICAgICAgX191NjQgZmVhdHVyZXM7Cj4gPiAgICAgICAgICAgICAgIHN0cnVjdCBuaWxmc19yb290
ICpyb290Owo+ID4KPiA+ICsgICAgICAgICAgICAgLyogVGhlIFZGUyBkb2Vzbid0IHJlZnVzZSB0
aGlzIHdoZW4gbmlsZnNfZ2V0X3RyZWUoKSBjYWxscyB1cy4gKi8KPiA+ICsgICAgICAgICAgICAg
aWYgKHNiX2VtZXJnZW5jeV9ybyhzYikpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBlcnIg
PSAtRVJPRlM7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byBpZ25vcmVfb3B0czsKPiA+
ICsgICAgICAgICAgICAgfQo+ID4gKwo+Cj4gW1NldmVyaXR5OiBNZWRpdW1dCj4gQ2FuIHRoaXMg
c2JfZW1lcmdlbmN5X3JvKHNiKSBjaGVjayBpbiB0aGUgZWxzZSBicmFuY2ggb2YgbmlsZnNfcmVj
b25maWd1cmUoKQo+IGJlIGJ5cGFzc2VkIGFmdGVyIGFuIGVycm9yIG9uIGEgcmVhZC13cml0ZSBt
b3VudD8KPgo+IFdoZW4gX19uaWxmc19lcnJvcigpIGNhbGxzIHNiX3NldF9lbWVyZ2VuY3lfcm8o
c2IpIG9uIGEgcmVhZC13cml0ZSBtb3VudCwKPiBTQl9SRE9OTFkgaXMgbm90IHNldCBpbiBzYi0+
c19mbGFncywgc28gc2JfcmRvbmx5KHNiKSByZW1haW5zIGZhbHNlLgo+Cj4gSW4gbmlsZnNfcmVj
b25maWd1cmUoKSwgcmlnaHQgYmVmb3JlIHRoZSBpZiAoZmMtPnNiX2ZsYWdzICYgU0JfUkRPTkxZ
KSBibG9jazoKPgo+ICAgICAgICAgaWYgKChib29sKShmYy0+c2JfZmxhZ3MgJiBTQl9SRE9OTFkp
ID09IHNiX3Jkb25seShzYikpCj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Cj4gV2hlbiBh
IHJlYWQtd3JpdGUgbW91bnQgb3IgcmVtb3VudCBpcyByZXF1ZXN0ZWQgKCEoZmMtPnNiX2ZsYWdz
ICYgU0JfUkRPTkxZKSkKPiBvbiBhIHN1cGVyYmxvY2sgd2hlcmUgc2JfZW1lcmdlbmN5X3JvKHNi
KSBpcyB0cnVlIGFuZCBzYl9yZG9ubHkoc2IpIGlzIHN0aWxsCj4gZmFsc2UgKGZvciBleGFtcGxl
LCB2aWEgbmlsZnNfZ2V0X3RyZWUoKSAtPiBuaWxmc19yZWNvbmZpZ3VyZSgpIHdoZW4gdGhlCj4g
c3VwZXJibG9jayB3YXMga2VwdCBhbGl2ZSBieSBhIHNuYXBzaG90IGFmdGVyIHRoZSBjb3JydXB0
ZWQgcmVhZC13cml0ZSBtb3VudAo+IHdhcyB1bm1vdW50ZWQsIG9yIHZpYSByZWNvbmZpZ3VyZV9z
dXBlcigpIC0+IG5pbGZzX3JlY29uZmlndXJlKCkgb24gYSBkaXJlY3QKPiByZW1vdW50LHJ3IHdp
dGhvdXQgYW4gaW50ZXJtZWRpYXRlIHJlbW91bnQscm8pLCB0aGlzIGNvbXBhcmlzb24gZXZhbHVh
dGVzCj4gZmFsc2UgPT0gZmFsc2UgYW5kIGp1bXBzIHN0cmFpZ2h0IHRvIG91dCwgb3ZlcndyaXRp
bmcgbmlsZnMtPm5zX21vdW50X29wdCBhbmQKPiByZXR1cm5pbmcgMCBpbnN0ZWFkIG9mIC1FUk9G
Uy4KCkkgaGF2ZSByZXZpZXdlZCB0aGUgcmVsYXRlZCBjb2RlIHBhdGhzIGFjcm9zcyBhbGwgcGF0
dGVybnMgcmVnYXJkaW5nClNhc2hpa28ncyBjb25jZXJucy4gIFJlZ2FyZGluZyB0aGlzIGZpcnN0
IHBvaW50LCB0aGVyZSBpcyBubyBuZWVkIGZvcgpjb25jZXJuLgoKU2tpcCBjaGVjayBpbiBuaWxm
c19yZWNvbmZpZ3VyZSgpOgogICBpZiAoKGJvb2wpKGZjLT5zYl9mbGFncyAmIFNCX1JET05MWSkg
PT0gc2JfcmRvbmx5KHNiKSkKICAgICAgICAgICBnb3RvIG91dDsKClNraXBwaW5nIHRoaXMgYmxv
Y2sgd2hlbiB0aGUgcmVxdWVzdGVkIHN0YXRlIG1hdGNoZXMgdGhlIGN1cnJlbnQgc3RhdGUKaXMg
dmFsaWQgYmVjYXVzZSBubyBSTy9SVyB0cmFuc2l0aW9uIGlzIGJlaW5nIHJlcXVlc3RlZC4gIElu
IHBhcnRpY3VsYXIsCndpdGggdGhlIHdvcmthcm91bmQgcGF0Y2ggKCJzdXBlcjoga2VlcCB0aGUg
cmVhZC1vbmx5IHN0YXRlIGlmIGEKcmVjb25maWd1cmF0aW9uIGRvZXNuJ3QgY2hhbmdlIGl0Iikg
cXVldWVkIGluIHRoZSB2ZnMtNy41LnN1cGVyIGJyYW5jaCwKcmVjb25maWd1cmVfc3VwZXIoKSBl
bnN1cmVzIHRoYXQgZmMtPnNiX2ZsYWdzIGluaGVyaXRzIFNCX1JET05MWSBiaXQKZnJvbSBzYi0+
c19mbGFncyBldmVuIHdoZW4gInJ3IiBvciAicm8iIG9wdGlvbiBpcyBub3Qgc3BlY2lmaWVkLgoK
V2hlbiBjYWxsZWQgdmlhIG5pbGZzX2dldF90cmVlKCkgLT4gbmlsZnNfcmVjb25maWd1cmUoKToK
CiAgLSBJZiBvbmx5IGEgcmVhZC1vbmx5IHNuYXBzaG90IG1vdW50IGV4aXN0cyBhbmQgYSByZWFk
LW9ubHkgY3VycmVudAogICAgbW91bnQgaXMgYWRkZWQsIHNraXBwaW5nIHZpYSB0aGlzIGNoZWNr
IGlzIGNvcnJlY3QuCiAgLSBJZiBhIHJlYWQtd3JpdGUgY3VycmVudCBtb3VudCBpcyByZXF1ZXN0
ZWQgaW5zdGVhZCwgdGhpcyBza2lwIGNoZWNrCiAgICBpcyBieXBhc3NlZCAoc2luY2Ugc2JfcmRv
bmx5KHMpIGlzIHRydWUgZm9yIHNuYXBzaG90IG1vdW50cyB3aGlsZQogICAgZmMtPnNiX2ZsYWdz
IGRvZXMgbm90IGhhdmUgU0JfUkRPTkxZKSwgYW5kIHRoZSBkb3duc3RyZWFtCiAgICBzYl9lbWVy
Z2VuY3lfcm8oKSBjaGVjayBzYWZlbHkgcmVqZWN0cyBpdCB3aXRoIC1FUk9GUyBpZiB0aGUKICAg
IHN1cGVyYmxvY2sgaGFzIGVudGVyZWQgdGhlIGVtZXJnZW5jeSBSTyBzdGF0ZS4KCj4gQWxzbywg
aW4gbmlsZnNfZ2V0X3RyZWUoKSwgd2hlbiBuaWxmc190cmVlX2lzX2J1c3kocy0+c19yb290KSBp
cyB0cnVlOgo+Cj4gICAgICAgICB9IGVsc2UgaWYgKCFjdHgtPmNubykgewo+ICAgICAgICAgICAg
ICAgICBpZiAobmlsZnNfdHJlZV9pc19idXN5KHMtPnNfcm9vdCkpIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoKGZjLT5zYl9mbGFncyBeIHMtPnNfZmxhZ3MpICYgU0JfUkRPTkxZKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuaWxmc19lcnIocywKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidGhlIGRldmljZSBhbHJlYWR5IGhh
cyBhICVzIG1vdW50LiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JfcmRvbmx5KHMpID8gInJlYWQtb25seSIgOiAicmVhZC93cml0ZSIpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVCVVNZOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBmYWlsZWRfc3VwZXI7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgfQo+Cj4gQmVjYXVzZSBzLT5zX2ZsYWdzIGRvZXMgbm90IGhhdmUgU0JfUkRPTkxZIHNldCBh
ZnRlciBzYl9zZXRfZW1lcmdlbmN5X3JvKHMpLAo+IGRvZXNuJ3QgdGhpcyB0cmVhdCB0aGUgZW1l
cmdlbmN5IHJlYWQtb25seSBzdXBlcmJsb2NrIGFzIHJlYWQvd3JpdGUsIHJlamVjdGluZwo+IGEg
c2Vjb25kYXJ5IHJlYWQtb25seSBtb3VudCB3aXRoIC1FQlVTWSB3aGlsZSBhbGxvd2luZyBhIHNl
Y29uZGFyeSByZWFkLXdyaXRlCj4gbW91bnQ/CgpTYXNoaWtvJ3MgcG9pbnQgaGVyZSBoYXMgYSB2
YWxpZCBhc3BlY3QuCgpUaGlzIGluY29uc2lzdGVuY3kgY2FuIGJlIHJlc29sdmVkIGJ5IGluc2Vy
dGluZyB0aGUgZm9sbG93aW5nIGhhbmRsaW5nCmxvZ2ljIGlmIHNiX2VtZXJnZW5jeV9ybyhzKSBp
cyB0cnVlOgoKICAgICAgIH0gZWxzZSBpZiAoIWN0eC0+Y25vKSB7CiAgICAgICAgICAgICAgICBp
ZiAobmlsZnNfdHJlZV9pc19idXN5KHMtPnNfcm9vdCkpIHsKICAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKHNiX2VtZXJnZW5jeV9ybyhzKSkgewogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmICghKGZjLT5zYl9mbGFncyAmIFNCX1JET05MWSkpIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FUk9GUzsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbGVkX3N1cGVyOwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzLT5zX2ZsYWdzIHw9IFNCX1JET05MWTsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB9CiAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoKGZjLT5zYl9mbGFncyBe
IHMtPnNfZmxhZ3MpICYgU0JfUkRPTkxZKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbmlsZnNfZXJyKHMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ0aGUgZGV2aWNlIGFscmVhZHkgaGFzIGEgJXMgbW91bnQuIiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2JfcmRvbmx5KHMpID8gInJlYWQtb25seSIgOgoicmVh
ZC93cml0ZSIpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FQlVTWTsK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZF9zdXBlcjsKICAgICAg
ICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAg
ICAgICAgICAg4oCmCiAgICAgICAgICAgICAgICB9CiAgICAgfQoKVGhpcyBtYWtlcyBhbGwgdHJh
bnNpdGlvbnMgYmVoYXZlIGNvbnNpc3RlbnRseSB1bmRlciBlbWVyZ2VuY3kgUk86CgoqIFJXIChk
ZWdyYWRlZCkgLS0tIFJXIG1vdW50IHJlcXVlc3QgLS0+IFJlamVjdGVkIHdpdGggLUVST0ZTCiAg
ICAgICAgICAgICAgICAgfAogICAgICAgICAgICAgICAgIGAtIFJPIG1vdW50IHJlcXVlc3QgLS0+
IFJPIChkZWdyYWRlZCkKCiogUk8gKGRlZ3JhZGVkKSAtLS0gUlcgbW91bnQgcmVxdWVzdCAtLT4g
UmVqZWN0ZWQgd2l0aCAtRVJPRlMKICAgICAgICAgICAgICAgICB8CiAgICAgICAgICAgICAgICAg
YC0gUk8gbW91bnQgcmVxdWVzdCAtLT4gUk8gKGRlZ3JhZGVkKQoKKiBTbmFwc2hvdC1vbmx5IFJP
IC0tLSBSVyBtb3VudCByZXF1ZXN0IC0tPiBSZWplY3RlZCB3aXRoIC1FUk9GUwogIChkZWdyYWRl
ZCkgICAgICAgIHwgICAgICAgICAgICAgICAgICBbQmxvY2tlZCBieSBlbWVyZ2VuY3lfcm8gY2hl
Y2sKICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgIGluIG5pbGZzX3JlY29u
ZmlndXJlKCldCiAgICAgICAgICAgICAgICAgICAgYC0gUk8gbW91bnQgcmVxdWVzdCAtLT4gUk8g
KGRlZ3JhZGVkKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbUmV1c2Vk
IHZpYSBuaWxmc19yZWNvbmZpZ3VyZSgpXQoKVGhlIGN1cnJlbnQgdjIgcGF0Y2ggaXMgc2FmZSBh
cy1pcyBzaW5jZSB3cml0ZSBwYXRocyBhcmUgZnVsbHkKcHJvdGVjdGVkIGJ5IG5pbGZzX3NiX3Jk
b25seSgpCmV2ZW4gaWYgYSBkZWdyYWRlZCBSVy1tb3VudCBpcyByZXVzZWQsIGJ1dCBpbmNsdWRp
bmcgdGhpcyBjaGFuZ2UKaGFuZGxlcyBzZWNvbmRhcnkKbW91bnRzIHVuZGVyIGVtZXJnZW5jeSBS
TyBtdWNoIG1vcmUgY2xlYW5seS4KClRoYW5rcywKUnl1c3VrZSBLb25pc2hpCgo+IC0tCj4gU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDI5
LXdvcmstZnMtc2JfcmRvbmx5LXYyLTAtMmY0NGY2NGYwYjY2QGtlcm5lbC5vcmc/cGFydD02Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
