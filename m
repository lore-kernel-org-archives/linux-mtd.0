Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA825C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIyRyyr8alzmc1JmOt/Muzt3+40EbEDfvpx/I4UnZFo=; b=zBKT5YHXyYk2uo
	+r6+/j2/1jp24fWCjAgfabDjRYuvUeozFCplIELBJPtWdttuKxaHasW9a0Pc4w4kiNKLtQFoVHWKx
	gd+12wkzV8Hl0gL+jZTxpmP3Tq1VsNmKxrdJ2zHVpfLNBwnf5hCqE4lgzRuQPiMB2DHoN3bf72LjO
	SXgRiIx7XH4faoGFGR7sWj6j2BjgkkyKhYscvSMOgOabD8xBQtG365808OT/ZoG53ry6AKOfYRaom
	aXDP9L/cta1C2f9nW8sDfbotlr9clQU8xQBeIYbNnqovhOAqe4B8VnWxug20zdYhNq+d6ke9Tx5vK
	bj8TRypACvI2fG8SLyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggyW-0000000CHMD-0fTb;
	Mon, 06 Jul 2026 10:54:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggyU-0000000CHLV-09RF
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 10:54:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2487149f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2026 03:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783335292; x=1783940092; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6mtKS0CHemAMvUzYYg6ya9AUrSuYWDNr1yrAbdk6Ek=;
        b=TOFXWp8gMnIegFJZZexOCqAcKwDjQSM6f79L7NxylQp2cUUGiuobgbNITBZjQEMTKk
         ZuW9m7znugzKtb6k6BTjUG+Y4H079Q0N4RzgEvLB3Wpc7GR9Y54Y6EJ+zGqFmWJFe6mv
         tCGDNy7cUz6PpdsMmYoLljCN+/GNeIB+nBdvpWkQuIydUm8E+AKhGisW0LQQ4Eur94Ei
         BHvuG/bBHMsL7Mpw/q95gjBaK3GazziXlFdynkEDmSnqFw6IReUB8rixRxN5/6lRlkYK
         NQuFfoDmQdOvt/fCU5tEBeUa8vDkCkI42YyB9wNsftGi/MepFzQxyrQHG5t4qTJQXhnP
         jVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335292; x=1783940092;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6mtKS0CHemAMvUzYYg6ya9AUrSuYWDNr1yrAbdk6Ek=;
        b=VI9WunWqjzq5KSTsuVW5GHeGlBYx1u8k1jiJM4ydFg7luuXZIjTScr73GWEaSO+wdz
         8FG9Vq2GmBQuharr6ix8QIu+y3uTXodwtOErFARHB8sHf/ZS/EvDNhROviMPXBQI0dvH
         YleBwADVaFlQeWwlMuwiybVKjYr/t/At/S8y5t1MQeucMHfZupCbH88P8w3yil5EenyU
         QCRCkhPDCrHSsb/OdlCeVO3ugurl7Upu8IMAJK/P/ylwhv2phb6uzMTvtqaJmQ3Jm6c7
         M1mwrnZE9BKUIaP9lZ8cCSugr6dodC8F8Q1uxZSoTOEzFiFlYIKPykfxbenJmzIWmUit
         gWCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrs8ewcQq5lLBSd44ZdygH8uY6h+u5cTSGviZRbw0aAo0zSi2/4zDrkFQh8jYLZd99VBqk1rr7IwjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMdhD2MiSWqcuXhN4yOrshxL952EnlNsQWennbMC6DYRNLRe5h
	+q1qX5y4kxBjfqdWq5QMIu59/bRND3apLnNBF/s1UhYuYbs6zxWFytJXo5Pa6A6bPX8=
X-Gm-Gg: AfdE7clvEP1PMKlALwlvHanhqVeHVTF1EPAEPmh78hEqGDlkjYhIRaYLEyAc5Riw1QJ
	uYjUkXB0bcqwKJ5vlLxL1LTZTs12lllsqkG4S9jKanIiL+kKE3nUmKCS+YgsFZn6tMe9v1zJlPi
	DPw9E0KaTbllIYTpH/RcDNZHV2PdaLqgvrLdINxIYI3UD7Kflj6kbma3c+9i/Ruyr1XtJZlLhR5
	WzpNnxl01BILzESyeQfZIQimLg3ZseLGyJRlnPYsRLKMCtL0yB4lebAyKlv2lW8QxuSlU5OkTO0
	vzWd82rULSr7hkDaNCgNu1rmO9Vp/GUtrqiE+IS3TfH7PPwJy4h90RiFHGub3kEpWKprs9cbFVf
	z1/Xbp5IsdrYLU8/TVKjITMvuAKgx7lfuKVYMjm7eljsu74JR4LtRMZspj746rP9AI1SbcGDVpe
	bTQ45lt4o6Qo3Fc8drDrowCvJc7C8FL2grq7Q0
X-Received: by 2002:a05:6000:e42:b0:475:2171:add with SMTP id ffacd0b85a97d-47aabf28f85mr8750305f8f.22.1783335291684;
        Mon, 06 Jul 2026 03:54:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm21607506f8f.31.2026.07.06.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:54:51 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/5] fs/jffs2: Move long delayed work on system_dfl_long_wq
Date: Mon,  6 Jul 2026 12:54:34 +0200
Message-ID: <20260706105443.173697-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706105443.173697-1-marco.crivellari@suse.com>
References: <20260706105443.173697-1-marco.crivellari@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_035454_089906_E38EDC6D 
X-CRM114-Status: GOOD (  15.88  )
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

Q3VycmVudGx5IHRoZSBjb2RlIGVucXVldWUgd29yayBpdGVtcyB1c2luZyB7cXVldWV8bW9kfV9k
ZWxheWVkX3dvcmsoKSwKdXNpbmcgc3lzdGVtX2xvbmdfd3EuIFRoaXMgd29ya3F1ZXVlIHNob3Vs
ZCBiZSB1c2VkIHdoZW4gbG9uZyB3b3JrcyBhcmUKZXhwZWN0ZWQgYW5kIGl0IGlzIGEgcGVyLWNw
dSB3b3JrcXVldWUuCgpUaGUgZnVuY3Rpb24ocykgZW5kIHVwIGNhbGxpbmcgX19xdWV1ZV9kZWxh
eWVkX3dvcmsoKSwgd2hpY2ggc2V0IGEgZ2xvYmFsCnRpbWVyIHRoYXQgY291bGQgZmlyZSBhbnl3
aGVyZSwgZW5xdWV1aW5nIHRoZSB3b3JrIHdoZXJlIHRoZSB0aW1lciBmaXJlZC4KClVuYm91bmQg
d29ya3MgY291bGQgYmVuZWZpdCBmcm9tIHNjaGVkdWxlciB0YXNrIHBsYWNlbWVudCwgdG8gb3B0
aW1pemUKcGVyZm9ybWFuY2UgYW5kIHBvd2VyIGNvbnN1bXB0aW9uLiBMb25nIHdvcmsgc2hvdWxk
bid0IHN0aWNrIHRvIGEgc2luZ2xlCkNQVS4KClJlY2VudGx5LCBhIG5ldyB1bmJvdW5kIHdvcmtx
dWV1ZSBzcGVjaWZpYyBmb3IgbG9uZyBydW5uaW5nIHdvcmsgaGFzCmJlZW4gYWRkZWQ6CgrCoMKg
wqDCoGMxMTY3MzdlOTcyZSAoIndvcmtxdWV1ZTogQWRkIHN5c3RlbV9kZmxfbG9uZ193cSBmb3Ig
bG9uZyB1bmJvdW5kIHdvcmtzIikKClNpbmNlIHRoZSB3b3JrcXVldWUgd29yayBkb2Vzbid0IHJl
bHkgb24gcGVyLWNwdSB2YXJpYWJsZXMsIHRoZXJlIGlzIG5vCm9idmlvdXMgcmVhc29uIHRoYXQg
anVzdGlmeSB0aGUgdXNlIG9mIGEgcGVyLWNwdSB3b3JrcXVldWUuIFNvIGNoYW5nZQpzeXN0ZW1f
bG9uZ193cSB3aXRoIHN5c3RlbV9kZmxfbG9uZ193cSBzbyB0aGF0IHRoZSB3b3JrIG1heSBiZW5l
Zml0IGZyb20Kc2NoZWR1bGVyIHRhc2sgcGxhY2VtZW50LgoKQ2M6IERhdmlkIFdvb2Rob3VzZSA8
ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBNYXJj
byBDcml2ZWxsYXJpIDxtYXJjby5jcml2ZWxsYXJpQHN1c2UuY29tPgotLS0KIGZzL2pmZnMyL3di
dWYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2ZzL2pmZnMyL3didWYuYyBiL2ZzL2pmZnMyL3didWYuYwppbmRleCA4
ZmY3YTBiNmFkZDIuLjNiNzgwM2M3NWQ1OCAxMDA2NDQKLS0tIGEvZnMvamZmczIvd2J1Zi5jCisr
KyBiL2ZzL2pmZnMyL3didWYuYwpAQCAtMTE3Nyw3ICsxMTc3LDcgQEAgdm9pZCBqZmZzMl9kaXJ0
eV90cmlnZ2VyKHN0cnVjdCBqZmZzMl9zYl9pbmZvICpjKQogCQlyZXR1cm47CiAKIAlkZWxheSA9
IG1zZWNzX3RvX2ppZmZpZXMoZGlydHlfd3JpdGViYWNrX2ludGVydmFsICogMTApOwotCWlmIChx
dWV1ZV9kZWxheWVkX3dvcmsoc3lzdGVtX2xvbmdfd3EsICZjLT53YnVmX2R3b3JrLCBkZWxheSkp
CisJaWYgKHF1ZXVlX2RlbGF5ZWRfd29yayhzeXN0ZW1fZGZsX2xvbmdfd3EsICZjLT53YnVmX2R3
b3JrLCBkZWxheSkpCiAJCWpmZnMyX2RiZygxLCAiJXMoKVxuIiwgX19mdW5jX18pOwogfQogCi0t
IAoyLjU0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
