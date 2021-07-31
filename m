Return-Path: <SRS0=QJY4=MX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685EBC4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jul 2021 04:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2791160EC0
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jul 2021 04:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2791160EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nw0w9sIspSkjW0h5i9B0om7GH3Ib+RlCzZhB7PVjOws=; b=ZuArTTW71DfgQzwFMH56WOKs0S
	zg8wOG+kVdQj+R0zObcCafQgcX/mTwIBfSwg3y2f7Udl7xJiLMxr88/BfCfW+BPHKJQDfhVRf+e2u
	a5i+vOvwl6c/L09qB1EYwTSyLPjNGVaeJhMYgW0TP/K+gPWKxern5yc91cRj/uBDbQrwou+uL3xaa
	/0kUkZyRlV24IJ3rOdVkNWdUNEzirPq8uxoZEtCS1/e1iIMPVzKo2MT0BsW8ZeMYLgOIi6ESJLm/l
	9puGMl/uHB7ziQmhZcpvYHDNFBy76nqjh4X+xstiAvyfkkcXMKVpxkrZZNRTX+3cHZEJPSEZNqdoz
	f3L7XijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9gG4-00AtfB-KV; Sat, 31 Jul 2021 04:05:56 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9gFz-00Atbb-Pp
 for linux-mtd@lists.infradead.org; Sat, 31 Jul 2021 04:05:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so23633623pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 30 Jul 2021 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=VFXOOTn/Vn4wZYYve4ASVb/HHzXMtsmmCHHBTxOGsvA=;
 b=sLP19dreR3fqB84FUJE8d2g6cKKyeCBFloWtY579h/6SgMebVOowmEV4wiedpKaRVs
 cS8qMrRmvv0IwGaeuvEmNrNDVHyARI8tBPM/HjVKUo1dv9CEKmZZ8RJCWzM1VkqtrhNo
 Y9/q+zdJeQbJl+gcod8zZLVlnDOUC7oLOD122eRZ9gK4l5r89UeqvTP+kDL4luB0TdYA
 pIzBwG8ASjM9fg/Ibmx7hrr2b4BS/urcpsGYos5Aa5/VzJvR99PTU8hQueXVdZjZSQXz
 3GsFeuawMS5FjY47pwATwFNmbLCBI7OZRd19gYWz5Cj6AhQmFlYngLiMBrZjNVuYoV5z
 rLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=VFXOOTn/Vn4wZYYve4ASVb/HHzXMtsmmCHHBTxOGsvA=;
 b=s8+e1xHV2XQJPHSiAoQWIC+3w3NG48u3J15ghC5meciBMzf4FpZhlvw5JHjx7Wjlde
 7MaGrCa2AeBmphWas6Lg0GLWC5eeO2nWhMG1lV5yS+mQhwyL6xQ87Uqtv5BNZ4T5f0ty
 pJ1dj4aE9IWfaiuyG+owSkpL2JMdccVFlvS4JpaAn/tPcfIMTko4rJQzEnSnbJdQIm5l
 0+BVdw2PT00Yeg0N/0ofurHvEjw9U/fvKwXjx/SxgV5zy1k2cIbbsL/p7jb0IYS1Rx/5
 OCk1Okf47PQ0F79b4zC2EPZdmOuK+HQkSKxLpWkq+vUBkBPAa1lEx7UfO/xMD9Er41Uj
 9AKA==
X-Gm-Message-State: AOAM531Je3wBxqACkgwFNI/O0ggbHwax2Ibm+RiRn5va8TWhX5IHxm7b
 JDZMZFgquSTl+lRDy/VH9Y8=
X-Google-Smtp-Source: ABdhPJzaAo2Op1LNut0Z98WmyNuIKcEFNkrZ5JV3ZnBHASVQBzU/8t+3IAryF8kG1yC3vJT2e68O5Q==
X-Received: by 2002:a62:7b86:0:b029:32b:364a:e7e4 with SMTP id
 w128-20020a627b860000b029032b364ae7e4mr5848448pfc.49.1627704348615; 
 Fri, 30 Jul 2021 21:05:48 -0700 (PDT)
Received: from [10.106.0.50] ([45.135.186.29])
 by smtp.gmail.com with ESMTPSA id h16sm3564511pfn.215.2021.07.30.21.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 21:05:48 -0700 (PDT)
To: dwmw2@infradead.org, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com
From: Li Tuo <islituo@gmail.com>
Subject: [BUG] jffs2: possible null-pointer dereference in
 jffs2_scan_dirty_space()
Message-ID: <c5849781-7fb9-28ca-03dd-fdd6e240c5bb@gmail.com>
Date: Sat, 31 Jul 2021 12:05:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_210551_895413_72306B6C 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpPdXIgc3RhdGljIGFuYWx5c2lzIHRvb2wgZmluZHMgYSBwb3NzaWJsZSBudWxsLXBv
aW50ZXIgZGVyZWZlcmVuY2UgaW4gCnRoZSBqZmZzMiBkcml2ZXIgaW4gTGludXggNS4xNC4wLXJj
MzoKClRoZSB2YXJpYWJsZSBqZWItPmxhc3Rfbm9kZSBpcyBjaGVja2VkIGluOgo2NzM6wqDCoMKg
IGlmIChqZWItPmxhc3Rfbm9kZSAmJiByZWZfb2Jzb2xldGUoamViLT5sYXN0X25vZGUpKQoKVGhp
cyBpbmRpY2F0ZXMgdGhhdCBqZWItPmxhc3Rfbm9kZSBjYW4gYmUgTlVMTC4KSWYgc28sIHRoZSBm
dW5jdGlvbiBqZmZzMl9saW5rX25vZGVfcmVmKCkgaXMgY2FsbGVkIHdpdGggdGhlIGFyZ3VtZW50
IGplYjoKNjg1OsKgwqDCoCBqZmZzMl9saW5rX25vZGVfcmVmKGMsIGplYiwgb2ZzLCBzaXplLCBO
VUxMKTsKCkluIHRoZSBjYWxsZWQgZnVuY3Rpb24sIGplYi0+bGFzdF9ub2RlIGlzIGFzc2lnbmVk
IHRvIHRoZSBwb2ludGVyIHJlZiwgCndoaWNoIG1lYW5zIHJlZiBpcyBhbHNvIE5VTEwuCkhvd2V2
ZXIsIHRoZSBwb3NzaWJsZSBOVUxMIHBvaW50ZXIgcmVmIGlzIGRlcmVmZXJlbmNlZCBpbiBzb21l
IApzdGF0ZW1lbnRzIHN1Y2ggYXM6CjU5NzrCoMKgwqAgZGJnX25vZGVyZWYoIkxhc3Qgbm9kZSBh
dCAlcCBpcyAoJTA4eCwlcClcbiIsIHJlZiwgCnJlZi0+Zmxhc2hfb2Zmc2V0LCByZWYtPm5leHRf
aW5faW5vKTsKNjAwOsKgwqDCoCB3aGlsZSAocmVmLT5mbGFzaF9vZmZzZXQgIT0gUkVGX0VNUFRZ
X05PREUpCgpJIGFtIG5vdCBxdWl0ZSBzdXJlIHdoZXRoZXIgdGhpcyBwb3NzaWJsZSBudWxsLXBv
aW50ZXIgZGVyZWZlcmVuY2UgaXMgCnJlYWwgYW5kIGhvdyB0byBmaXggaXQgaWYgaXQgaXMgcmVh
bC4KQW55IGZlZWRiYWNrIHdvdWxkIGJlIGFwcHJlY2lhdGVkLCB0aGFua3MhCgpSZXBvcnRlZC1i
eTogVE9URSBSb2JvdCA8b3NsYWJAdHNpbmdodWEuZWR1LmNuPgoKQmVzdCB3aXNoZXMsClR1byBM
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
