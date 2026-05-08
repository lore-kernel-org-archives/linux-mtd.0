Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11EBCD3447
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2026 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/140taL2UHnChTJ4fcTXCsWdSz/xWP+zYnCmDiJ5g0E=; b=VLICblxpbgogCs
	St3dUSjinBoaCcW41Jqxbp2mrURutatCHZHULOyPW7hpgGyprvuSND9woKSLG7PQdy9WH0IrOdZjM
	YNMb50y/AMm1d2ZpPdPOoK9LIKfyTiELqkEftVmS6rMpEGuCeo2AntYDcohN83nxPP43msegyg3fl
	BLpOiG36bSIV2VwU+j82UwJFgTzMPWDHV2pJD9f/azQdUEHG2CzPsw4diovpF3J7taNnJ83+6L7Gr
	IkDRC5K0rlhBzTcEDMbNBIOYFoIzoNgRRF1xDjrOKCtrI/7rdOGmRiR3ND8rF0qmmMKJVrND9evty
	tof4wW4mBtOhh9445ccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLWg-00000006ahP-33yX;
	Fri, 08 May 2026 13:45:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLWd-00000006agI-3YVG
	for linux-mtd@lists.infradead.org;
	Fri, 08 May 2026 13:45:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48896199cbaso18550385e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 08 May 2026 06:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778247953; x=1778852753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUC6icIU8/by706DNfsxKmniCKIFMGJQAqyCvmSbiBc=;
        b=Aa47FWuiSoRP4h7vpd5q/0Wacv+BoJm2rhJ6mRnxrhjzckgPaUydbfnt7ino2EP9qz
         FVLNzrC/ygYlUlyEQI0lcKO89o+RUMNcR+WIVnT0UmFnJ0Px2CatRhCfhxC3ajJUxxcv
         ilcEnhC76lkIloyzgCEfMCXvk3YOPLDOAx1eJkOduJMU55DwTUH5eGznYwPvTKTBcNEt
         1COf5ZcumBy1lcJrvB3yDxc9R81fvGJ63NvslJUPXwt91nFIZWK1Y9zJfbVh44wWntjc
         dQjMhU8YapgkYqk4uIwmDqxqhvBKF834HA2Cqhz1+UciA7xuIXdfMdZ6rnBE+zHrj47I
         4hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247953; x=1778852753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sUC6icIU8/by706DNfsxKmniCKIFMGJQAqyCvmSbiBc=;
        b=CtAIrtYM6yxhgIF4cVY58wyfZ0ozFY6wz4q2HwaimhAhn5s3ZcNYytzAjK0ORDt2ud
         fhB2/UaSS3PF4Y6w45VIur+l/cjLCbXYF6m3aQrzPlfg7yUaIfKKnLJvRktlVins1/GP
         Q4PEucYOsFOBwwTZtYtsZZA82emQ0Ja6rz3r4Lk7mLifqJaXWL0iU1Liye2LCClM/K1K
         o8JsA6yvJ+cdw5NBqYcBbMGBGK54POHY5dQDV8mAFqUZlI9Hi5SbBrytXVnAp3STkCFA
         A0aXqzbp1/h2hEZwTQZqvrZ34Qm2AJGRSmkmeLA5nvb577c9r8S9D43J54OnXYUgo+9G
         RWFA==
X-Forwarded-Encrypted: i=1; AFNElJ+KI3UloBGuTTYHkV2Erdp7CdXxMwNLVIaVnGHrogWP03K6hqhifT9tdejMArbikDFQV2VmyhBc8sc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxASFzhvyuvg6HftZVAqgvcr9Ui52sj1szMPICak7f/1BiF0kGq
	J1wmpqa4755D1gtMxSx8a2mWwgF7ZWlNJcvSIiaE4h0xH4gvsMJgUCPNRx8Q/BywbnU=
X-Gm-Gg: AeBDiesmO4drRj6yV9t96PVxW5ukVEv8nHfBT+rIIrWMhXJGHgYr/xetj1Xg0pwSTc7
	9B5NdNsYK6XcG+wB+cVcbTiiu6Bck3z5T7PjF+9IBIwG2CgHDpJYttFJsy8evYTlq2+pzTHz9cE
	RfS4oD5E1IKJY185ZSCjLJud3ZZMiTeXA6nH5H2MF844P4skWGOyc46RrCoL422E0LSxRdrk0rG
	d8x9FCM/bjME3XlvwYBD+ITz+PA+u6N+yrVlSlBApOjJDKd6kgTepa8F3Ggq9gVGl8Y4LYSL90h
	MbwHoWetk+DXs+H08dGZ1D155rHR6OIusRxTa8kXueDndNYeYbQwlWRDZuabGF2a8iKWrpYlyuj
	gIlgiffaTlOg0cjacERSq/YJmFjONkYn3+4XkDqFCr5upnDkCcPDX4uAqHXlKZ0oONaZhYpm8a9
	88Sf4kJXWnkxKKgdzAfRBd0KjdBDiJDtJPUpp5eJ9LdeL0yAM=
X-Received: by 2002:a05:600c:871b:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48e51f45eddmr195991075e9.17.1778247953241;
        Fri, 08 May 2026 06:45:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db1413csm178475e9.29.2026.05.08.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:45:52 -0700 (PDT)
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
Subject: [RFC PATCH 2/6] fs/jffs2: Move long delayed work on system_dfl_long_wq
Date: Fri,  8 May 2026 15:45:30 +0200
Message-ID: <20260508134541.282073-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508134541.282073-1-marco.crivellari@suse.com>
References: <20260508134541.282073-1-marco.crivellari@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_064555_896887_A558A90E 
X-CRM114-Status: GOOD (  15.48  )
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
IAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
