Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3456C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6jDJZlY68b7tyXbF3I5IqOFfMnFJFNMtJhIhb+NPio=; b=lCA/aHE8bUnIeZ
	r+nCBiE2jiglVfRQD4ooqUFVXm0oxETn9oR42SRX/16SLtzRBB5++fVp7+be7P9/nEhageeuP1zUO
	o/YtsB8CXIUTEQma59pPf57Y4ETO1yyS+mMPijAaKnOnvsmGp15jfp0cgXKdG2+fjWH/R8DDV8umG
	SVZOsNv1TfL6GGVFdZAes163YKKAc6xllTNecvKrQBIQqJoZ9B6CrFPBe0CNgnG4bQgN+hSsJ64vG
	KBwRuRzxNbOlcVXlnIeQU4Mm77yr5YJy+HLB+SC/EuLMKaKcHDvS19rOIGWR9eEp2zXYViiaikhLB
	jObH34gMXbD1edP/bl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw3q-0000000CfMQ-3kmA;
	Thu, 11 Apr 2024 15:09:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw3m-0000000CfEL-3Iwx
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 15:09:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4155819f710so62034205e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2024 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google; t=1712848171; x=1713452971; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJvFhjtrT0jG8I/iNrHe3ZLfNPX/c8Ah/lLJwH+cC5o=;
        b=ImsEw9zKqGXj9Qmx4ztCswOTA/Yln230U6OlgCrasDoZ/+y+6Sy5qf+9FfdrRZ5eVa
         6n+BZlFTiiAeIuAounXK8B9mPb4fLo2W7mSvZ4eRA+FKpWrNh6UBpffC9pvwuVrBpiHC
         nJkGdeLTBtGesrtEKSF2YIJzI3QJOiOZEZn7ztrVVL02sceZCKKXbDy6pqtygjj/u8hR
         9mnKHIWDiHb8HkmXGw6l9SPOQtXEK5gss5/9T1zSjJZC8c3SG3fZs6PqTY5UsOs9bnBg
         60GewjwJ174EtHOkgJBkVPJWtalzoZ2jWS/fuNb8FpOl9LXmZyumycPt7yZKcTBctJ3w
         mmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712848171; x=1713452971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJvFhjtrT0jG8I/iNrHe3ZLfNPX/c8Ah/lLJwH+cC5o=;
        b=fBaTpicLX7rMDxnK9f6NF75SElds4ttH81q7CltOpd781Hf+dkzA2VAj9oEpyChSED
         iGptcPOiz2FCsldhbc/6Lljnb44Wooi9lTIa5vHvb+u95dLdWIU1It2vKK+pbdFtCJ48
         e2mpWTzsQlidcPQ5PYcDd4YSikaGFa1J61Wj+1h8d8sFKg898JMZtenj1206005dbuWO
         TdikT9LqZ7U1vZSeR5VBzxSd9Lyayb0wKVtrY8uEwBFX4/zaVeBwc51Wh+LjpCyDnNuO
         +CIvzhIxJjaKfU2Xfy0wBxC4cxB2kzlmrkEK8i5lg6dTXFHpOQ7wk+XPZi/xwaxbT55k
         t1UQ==
X-Gm-Message-State: AOJu0Yx9BUooY3F4rJup8fJEWl4W5r1d0gg2lO4LzkbhlVdlmecqIGWV
	Oe1RuEWG7G/FbEJjhKF+5MXnqKWaaqI+p3R+RdeAoxdBCAwLfWqbRM+anbrQbG4=
X-Google-Smtp-Source: AGHT+IFSglO+pHI22nHpuIMadu7Xad4sxbdlSXaJoE3ADpRN/IC51yGchmh5ZcMgmmbqBrWqr+8ZjQ==
X-Received: by 2002:a05:600c:5491:b0:415:6daf:c64b with SMTP id iv17-20020a05600c549100b004156dafc64bmr66997wmb.16.1712848171578;
        Thu, 11 Apr 2024 08:09:31 -0700 (PDT)
Received: from cephalopod (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b00417e326ff3bsm1391844wmb.36.2024.04.11.08.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 08:09:31 -0700 (PDT)
Date: Thu, 11 Apr 2024 17:09:29 +0200
From: Ben Hutchings <ben.hutchings@essensium.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: ubi: Fix some initialisation failure cases
Message-ID: <Zhf9KUCzO_bh_u38@cephalopod>
References: <cover.1712788087.git.ben.hutchings@mind.be>
 <f6191bef-9adb-9517-762d-ac95ebd3a4d1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6191bef-9adb-9517-762d-ac95ebd3a4d1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_080955_365865_DE3C72DC 
X-CRM114-Status: GOOD (  17.19  )
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

T24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMTE6MzA6NDFBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzQvMTEgNjo0MiwgQmVuIEh1dGNoaW5ncyDlhpnpgZM6Cj4gPiB1Ymkg
Y3VycmVudGx5IGZhaWxzIHRvIGluaXRpYWxpc2UgaWYgZGVidWdmcyBpcyBlbmFibGVkIGF0IGJ1
aWxkIHRpbWUKPiA+IGJ1dCBkaXNhYmxlZCBhdCBib290IHRpbWUgKENPTkZJR19ERUJVR19GUyBp
cyBlbmFibGVkIGFuZCBkZWJ1Z2ZzPW9mZgo+ID4gaXMgc2V0IG9uIHRoZSBrZXJuZWwgY29tbWFu
ZCBsaW5lKS4gIEVycm9ycyBmcm9tIGRlYnVnZnMgc2hvdWxkIGFsd2F5cwo+ID4gYmUgaWdub3Jl
ZCBidXQgdGhpcyB3YXNuJ3QgZG9uZSBldmVyeXdoZXJlLgo+ID4gCj4gPiBXaGlsZSBmaXhpbmcg
dGhpcyBJIGFsc28gbm90aWNlZCB0aGF0IGEgcmVjZW50IGNoYW5nZSB0byB1YmkgcmVtb3ZlZAo+
ID4gc29tZSBjbGVhbnVwIGZyb20gdGhlIHViaV9pbml0KCkgZmFpbHVyZSBwYXRoIHRoYXQgSSB0
aGluayBpcyBzdGlsbAo+ID4gbmVlZGVkLgo+ID4gCj4gPiBUaGlzIHNlcmllcyBzaG91bGQgZml4
IGJvdGggcHJvYmxlbXMuCj4gPiAKPiA+IEJlbi4KPiAKPiBIaSwgQmVuLiBJIGhhdmUgYSBzYW1l
IHBhdGNoIHdpdGggeW91ciBmaXJzdCBvbmUsIEkgaGF2ZSBtZXJnZSBvdXIgcGF0Y2hzZXQKPiBp
bnRvIGEgbmV3IHNlcmllcyBbMV0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bXRkLzIwMjQwNDExMDMxOTAzLjMwNTAyNzgtMS1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS8KWy4u
Ll0KClRoYW5rIHlvdSEKCkJlbi4KCi0tIApCZW4gSHV0Y2hpbmdzIMK3IFNlbmlvciBFbWJlZGRl
ZCBTb2Z0d2FyZSBFbmdpbmVlciwgRXNzZW5zaXVtLU1pbmQgwrcgbWluZC5iZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
