Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E43C10F05
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qkBK9Y3MnqmdMApnT6WqV3SBBmWyBPjJyIxmh9ynNIE=; b=Z/K+lR8ar106dk
	Yvmc3b5JxJ1iRSfeu2ps+VPtYjtsQZcBrYyttYlTt+ZgdeYBQWdDh455iuvW7w1s3x6+8LcoTrxqV
	oh/caankfx1OWdkVtT4rWlHvvXDOXgxJWf/qZuDjJjCAxXlphYi5fkHtE7/AV1lhGuXqpqtIWiPKF
	uYsKTATQiIMnDYCKJp02kObJ4bLd5Xk3g3bm3ZDsYpSBOIjeDop9dnR61msyCpSJKgb9hB0/ADrQm
	t5pErSFm74lNygxZLZwY6x4s0k2ArQLCdoekPF8Y7dO0F4kOEspDfsQqSTGl2jtGIocXlbwx2D7OC
	4BTiKDaXtKBOempaNWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIbu-00DaC5-14;
	Thu, 07 Dec 2023 17:56:30 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIbq-00DaBj-2X
	for linux-mtd@lists.infradead.org;
	Thu, 07 Dec 2023 17:56:27 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b2e330033fso903474b6e.3
        for <linux-mtd@lists.infradead.org>; Thu, 07 Dec 2023 09:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701971782; x=1702576582; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEgYXp3pWhvzQfI45Aevm6IshLhjL62xRITnCLdc2bo=;
        b=ENwu5eErKURtu3KdYfyaZqM5zikg4Rh9mxDUBu8jAN5PZNfr2cvRFTkYLkdOp45j9u
         ey88J3I+Bzw9xuGWzcK7DViAcV1dM7/A6Uji0wkDKrVVu8hym2sNO7bH+wMl0roU9oaZ
         G7M76XpNCvmAC56Ko57aaAXXBe5FlFUtzM42Cfo7xH73Hc1qpZVvDobu4l4BY44CuN1j
         iFI7w+HE2QwQw3gBk6EB1xWQJ2MvElhRt4btf+qc7vP9E2BRwgeo8YDCzDdpq6pMvc4p
         +5rSTSO1rwq77bZPD3Rj0ARgNPL1HEPfyxuv/Rl8Yyd1cufaHgRgV62nAid2+fBgd2jV
         4/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701971782; x=1702576582;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TEgYXp3pWhvzQfI45Aevm6IshLhjL62xRITnCLdc2bo=;
        b=XRTsePuHNZ+ZmfLqsuQe3/OKtGmyP0M5cppC4kJsIESjHCBdD3hJyaiW21e2h8/gAk
         XTiuaKY0HT+LjTfUmqRdWLYl0DeWaYb7tanHtJ5xDgM1VDHuaAenVYbgI6KWSieU3zwQ
         wZ5QWRdUNrsFPaa4FOPn5l9uttr8wD9szTuXywO/hI5IUbZq4tfYFg54vQINqOhC6Wqh
         KUvaY1Y6TSmIxaC/WUdkgMCFjbnJkfPwJksr7PvMVmMdlcTZ6T30RYEOdN5Gh+UBccK7
         WFUcAhApOogAuDrPLOrc2D95Ic8mn0A4B7axBnsWGhrtTQFi9xRQJJy5UMkLO+WmPW3w
         8FIw==
X-Gm-Message-State: AOJu0YyZ5tGugYwCED2NiwbxQhc+H60jKFC4wCad49YIbSK8t/6TW+oi
	kJiYw8AQ+kJuqo4cvsbmmxho6YD8RtsV4A==
X-Google-Smtp-Source: AGHT+IHVRd+3VGIl3ydHiu+q+XMucvl27nzUS5RmL//E0Dyc+6OYMfv0oUiyMJuVLT1M37h+rcEgSg==
X-Received: by 2002:a05:6808:204:b0:3b8:b063:6bc2 with SMTP id l4-20020a056808020400b003b8b0636bc2mr3104678oie.113.1701971782075;
        Thu, 07 Dec 2023 09:56:22 -0800 (PST)
Received: from [192.168.1.14] (pool-173-66-156-160.washdc.fios.verizon.net. [173.66.156.160])
        by smtp.gmail.com with ESMTPSA id h7-20020ac85047000000b003f6ac526568sm108772qtm.39.2023.12.07.09.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 09:56:21 -0800 (PST)
Message-ID: <cbff425d-0196-4124-99a0-f7ea8d6e6ab6@gmail.com>
Date: Thu, 7 Dec 2023 12:56:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mtd@lists.infradead.org
Content-Language: en-US
From: Chuck Meade <chuckmeade@gmail.com>
Subject: UBI scrubbing behavior when readonly
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_095626_846349_71993DBF 
X-CRM114-Status: GOOD (  10.42  )
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

SGVsbG8sCgpEb2VzIFVCSSBzY3J1YmJpbmcgKG1vdmluZyBkYXRhIHRvIG5ldyBQRUIgd2hlbiBy
ZWFkIG9wZXJhdGlvbnMgcmVwb3J0IEVDQwpiaXRmbGlwcykgc3RpbGwgb2NjdXIgd2hlbiBhIFVC
SUZTIG1vdW50ZWQgb24gdGhlIFVCSSB2b2x1bWUgaXMgcmVhZG9ubHksIGluCnRlcm1zIG9mIExp
bnV4IGZpbGVzeXN0ZW0gcGVybWlzc2lvbnM/CgpJIGhhdmUgbG9va2VkIGF0IHRoZSBVQkkgc291
cmNlIGZvciBzY3J1YmJpbmcsIGFuZCBpdCBhcHBlYXJzIHRoYXQgaXQgd2lsbCBub3QKb2NjdXIg
d2hlbiB0aGUgVUJJIGRldmljZSAob3IgTVREIHBhcnRpdGlvbiB0byB3aGljaCB0aGUgZGV2aWNl
IGlzIGF0dGFjaGVkKQppcyBpbiByZWFkb25seSBtb2RlLiBCdXQgd2hhdCBpZiB0aGUgVUJJIGRl
dmljZSBpcyBpbiByZWFkL3dyaXRlIG1vZGUsIGJ1dCB0aGUKVUJJRlMgbW91bnRlZCBvbiB0aGUg
ZGV2aWNlIGlzIGluIHJlYWRvbmx5IG1vZGU/CgpJIGFtIHRyeWluZyB0byBjcmVhdGUgYSBjb25m
aWd1cmF0aW9uIHdoZXJlIHRoZSBVQklGUyBpcyByZWFkb25seSBhdCB0aGUgTGludXgKZmlsZXN5
c3RlbSBwZXJtaXNzaW9ucyBsZXZlbCwgYnV0IFVCSSBzY3J1YmJpbmcgc3RpbGwgb2NjdXJzIHdo
ZW4gcmVhZApvcGVyYXRpb25zIHJlcG9ydCBlbm91Z2ggRUNDIGJpdGZsaXBzLsKgIFNvIG5vIExp
bnV4IHVzZXJzcGFjZSBwcm9ncmFtcyBtYXkKbW9kaWZ5IHRoZSBmaWxlc3lzdGVtIGR1ZSB0byBw
ZXJtaXNzaW9ucywgYnV0IFVCSSBzY3J1YmJpbmcgc3RpbGwgd291bGQgb2NjdXIuCgpJcyB0aGlz
IHBvc3NpYmxlLCBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nIGluIHRoZSBVQkkgc291cmNlIGNv
ZGU/CgpUaGFua3MsCkNodWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
