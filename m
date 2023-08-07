Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716DBC001B0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBb1NYrz7LKt8anG/gdnofX3KM/0PGFYzgmrOS/RPXo=; b=e/g5S2eo+eyzp5
	NYmUR1XBUWXgTnzwKUcuoCBLlhTAlvlmtov23xKlnBUHHjPmAhQGF0lTmG//WV4c7RL01ufoacaL3
	dT1Set8oYZ3u2dpGS9425SirOkLNTcRMq7GEQTbDebEH/ehoE7xwHX9nhNJq+4nIjEHMQa0yWqQ1t
	JWxDFAVQ7/NWGxE1R9o2Bazo5CeIxY5UAQIUzA0TUyMKRB7SAyE3ddM6mffaCFYWDjRnvQ4Qxvrc7
	zFCDlaS9jUq8up3NQEyQIjYl8tw9QdYYaY3lWHzPxYmf4PnSc6o3oyutm4CHyXPn90OSI+KEX6j1k
	q2F3EcIc/ipHi9LbT7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT11r-00HVX8-0g;
	Mon, 07 Aug 2023 14:16:15 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT11o-00HVVH-0G
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 14:16:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9cbaee7a9so73828961fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1691417769; x=1692022569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=;
        b=KDeUHSfDD3L4EI9ZDbXXnOCIgf36k4kTiyHRIIffaGRG3HCFl39GcfvKDi2APyBxt9
         uIkOV41JjBWzvcfkl4hWbMoMF6B7yW2N6o4toZetNa+16q9cwIbk8dhp8WLMlbMnqtzs
         lrCcsJN2ho/fqPCpmMmUqd/p18Lc2P1XhR9Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691417769; x=1692022569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVE/GJTe1IuiufpABjiYZn1olHI1ifx/I1TivYEBHQg=;
        b=es0P9/XV50ZDR8hxVQKTqpQm6ShrF8PLZ8FJbYTrOFebvxyQV6aVoHTV9ndhcoaDEs
         RvyXkp5xF1E3zqLh3tOEFZ5jXm70jtGfrUixWW/M4U97iHqZmCnHYSCatheDwDKtM0qB
         qKvGURZFq3K+L2Dnq4+Tr7gFzEg9lChWDCbbSLBEnAbgaZcPRMqhzURCUGGHmTKcbCRY
         ruP/Y9f6vbNbvKeUEFCu0n2R+XdlGqz222vukJ0p6IclzUK0e+sc+zeXLBhVKS4EqzZU
         fqbGE6dmx7z8KP1YpDVI2yE2sWQafO4PDqYVCwrKSPp1bbjsqpsfUM7BgjKJZK6sSdZC
         Z+xQ==
X-Gm-Message-State: AOJu0Yx+jMAnXvYmdCdTyKFaoO7UEYODP166VTeiUqjbA+kfxkzAY8yI
	jHOhZYE6ORkrcCqq07jVi73bsJIt8n09dd+7uVhapw==
X-Google-Smtp-Source: AGHT+IGOrJUhdG+ahMA8bObfIwJouhmkY47ZzUfvTwinDgzhZuBpH+4Q7OaueJuZRAHK8xn8XVlTzjWWvAUYbt+ovvQ=
X-Received: by 2002:a2e:b166:0:b0:2b9:dd3b:cf43 with SMTP id
 a6-20020a2eb166000000b002b9dd3bcf43mr6572529ljm.13.1691417768626; Mon, 07 Aug
 2023 07:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com> <20230807110936.21819-19-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-19-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:16:03 -0400
Message-ID: <CAEXW_YTKHUeZHWtzeSG5Tt7MscNKjVTScBWkVDkC4Orisa7w=Q@mail.gmail.com>
Subject: Re: [PATCH v4 18/48] rcu: dynamically allocate the rcu-lazy shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru, 
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org, 
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, 
	cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com, 
	gregkh@linuxfoundation.org, muchun.song@linux.dev, simon.horman@corigine.com, 
	dlemoal@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	cluster-devel@redhat.com, linux-nfs@vger.kernel.org, 
	linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dm-devel@redhat.com, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_071612_116562_F2D197D6 
X-CRM114-Status: GOOD (  16.75  )
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

T24gTW9uLCBBdWcgNywgMjAyMyBhdCA3OjM24oCvQU0gUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxseSBhbGxv
Y2F0ZSB0aGUgcmN1LWxhenkgc2hyaW5rZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8
emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+CgpGb3IgUkNVOgpSZXZpZXdlZC1ieTogSm9lbCBG
ZXJuYW5kZXMgKEdvb2dsZSkgPGpvZWxAam9lbGZlcm5hbmRlcy5vcmc+Cgp0aGFua3MsCgotIEpv
ZWwKCgo+IC0tLQo+ICBrZXJuZWwvcmN1L3RyZWVfbm9jYi5oIHwgMjAgKysrKysrKysrKystLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3JjdS90cmVlX25vY2IuaCBiL2tlcm5lbC9yY3UvdHJl
ZV9ub2NiLmgKPiBpbmRleCA1NTk4MjEyZDFmMjcuLmUxYzU5YzMzNzM4YSAxMDA2NDQKPiAtLS0g
YS9rZXJuZWwvcmN1L3RyZWVfbm9jYi5oCj4gKysrIGIva2VybmVsL3JjdS90cmVlX25vY2IuaAo+
IEBAIC0xMzk2LDEzICsxMzk2LDYgQEAgbGF6eV9yY3Vfc2hyaW5rX3NjYW4oc3RydWN0IHNocmlu
a2VyICpzaHJpbmssIHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MpCj4KPiAgICAgICAgIHJldHVy
biBjb3VudCA/IGNvdW50IDogU0hSSU5LX1NUT1A7Cj4gIH0KPiAtCj4gLXN0YXRpYyBzdHJ1Y3Qg
c2hyaW5rZXIgbGF6eV9yY3Vfc2hyaW5rZXIgPSB7Cj4gLSAgICAgICAuY291bnRfb2JqZWN0cyA9
IGxhenlfcmN1X3Nocmlua19jb3VudCwKPiAtICAgICAgIC5zY2FuX29iamVjdHMgPSBsYXp5X3Jj
dV9zaHJpbmtfc2NhbiwKPiAtICAgICAgIC5iYXRjaCA9IDAsCj4gLSAgICAgICAuc2Vla3MgPSBE
RUZBVUxUX1NFRUtTLAo+IC19Owo+ICAjZW5kaWYgLy8gI2lmZGVmIENPTkZJR19SQ1VfTEFaWQo+
Cj4gIHZvaWQgX19pbml0IHJjdV9pbml0X25vaHoodm9pZCkKPiBAQCAtMTQxMCw2ICsxNDAzLDcg
QEAgdm9pZCBfX2luaXQgcmN1X2luaXRfbm9oeih2b2lkKQo+ICAgICAgICAgaW50IGNwdTsKPiAg
ICAgICAgIHN0cnVjdCByY3VfZGF0YSAqcmRwOwo+ICAgICAgICAgY29uc3Qgc3RydWN0IGNwdW1h
c2sgKmNwdW1hc2sgPSBOVUxMOwo+ICsgICAgICAgc3RydWN0IHNocmlua2VyICogX19tYXliZV91
bnVzZWQgbGF6eV9yY3Vfc2hyaW5rZXI7Cj4KPiAgI2lmIGRlZmluZWQoQ09ORklHX05PX0haX0ZV
TEwpCj4gICAgICAgICBpZiAodGlja19ub2h6X2Z1bGxfcnVubmluZyAmJiAhY3B1bWFza19lbXB0
eSh0aWNrX25vaHpfZnVsbF9tYXNrKSkKPiBAQCAtMTQzNiw4ICsxNDMwLDE2IEBAIHZvaWQgX19p
bml0IHJjdV9pbml0X25vaHoodm9pZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICNp
ZmRlZiBDT05GSUdfUkNVX0xBWlkKPiAtICAgICAgIGlmIChyZWdpc3Rlcl9zaHJpbmtlcigmbGF6
eV9yY3Vfc2hyaW5rZXIsICJyY3UtbGF6eSIpKQo+IC0gICAgICAgICAgICAgICBwcl9lcnIoIkZh
aWxlZCB0byByZWdpc3RlciBsYXp5X3JjdSBzaHJpbmtlciFcbiIpOwo+ICsgICAgICAgbGF6eV9y
Y3Vfc2hyaW5rZXIgPSBzaHJpbmtlcl9hbGxvYygwLCAicmN1LWxhenkiKTsKPiArICAgICAgIGlm
ICghbGF6eV9yY3Vfc2hyaW5rZXIpIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJGYWlsZWQg
dG8gYWxsb2NhdGUgbGF6eV9yY3Ugc2hyaW5rZXIhXG4iKTsKPiArICAgICAgIH0gZWxzZSB7Cj4g
KyAgICAgICAgICAgICAgIGxhenlfcmN1X3Nocmlua2VyLT5jb3VudF9vYmplY3RzID0gbGF6eV9y
Y3Vfc2hyaW5rX2NvdW50Owo+ICsgICAgICAgICAgICAgICBsYXp5X3JjdV9zaHJpbmtlci0+c2Nh
bl9vYmplY3RzID0gbGF6eV9yY3Vfc2hyaW5rX3NjYW47Cj4gKyAgICAgICAgICAgICAgIGxhenlf
cmN1X3Nocmlua2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4gKwo+ICsgICAgICAgICAgICAg
ICBzaHJpbmtlcl9yZWdpc3RlcihsYXp5X3JjdV9zaHJpbmtlcik7Cj4gKyAgICAgICB9Cj4gICNl
bmRpZiAvLyAjaWZkZWYgQ09ORklHX1JDVV9MQVpZCj4KPiAgICAgICAgIGlmICghY3B1bWFza19z
dWJzZXQocmN1X25vY2JfbWFzaywgY3B1X3Bvc3NpYmxlX21hc2spKSB7Cj4gLS0KPiAyLjMwLjIK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
