Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF62AC6FD1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Mar 2023 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnuf4EZ99QPvwjIwdygrNQDSrwUWgEfQuzqOa8A23S4=; b=mAoABBT9x9Cixv
	CbVwvWYsZSFkrr2/m76+ZSO/JWu4XO40nUPoDiEFC5og3VsHCOs2+3KnkRKg1sB/raRyhua65bA01
	fepABQNJ4FxtUcxqlC7uXOjBUu99TEQvSfggZl2Gc51QcRQtXIEfwadEHZFUoDAY7euOJq2A28k4F
	M1HsMgP6d2FC6hP2asdAzXqgZC31uxwoUBH1JESJP4CheBlCdMXpiWQSxLbrx3WfhzFvrZLYXkAua
	J9mzhqgZ3RlcxGTREWTldf+H+h12kyESK2tISAossXJ0ssYUIfG7B2sUmQrqx5PLvaHFzknm8VdG6
	3TK+nGHnGNqLjp40XFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdBAU-002Tfo-0b;
	Fri, 17 Mar 2023 14:34:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdBAQ-002Tf5-25
	for linux-mtd@lists.infradead.org;
	Fri, 17 Mar 2023 14:34:52 +0000
Received: by mail-ed1-x52a.google.com with SMTP id y4so21251511edo.2
        for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2023 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679063686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4FKk1Fwhr1fzG6SpZjspB0mX89kWkmddwIe7IQAMes=;
        b=UENArZTj3eYJid1mlv2le+ufGlum1Zp0eLeeq/UMk2jR1tIsCq8g4fnTOWOjeXS05X
         9wmwkepGz2SvRU8GWyOwtI5NvaWBNAOo5mZ5ZibAWbNg1lVNyW8Eb2lkBpbbc5bvOMCn
         S3hUKHL4JUvzWowv2pFzSFUz/38OYNVQyUTsSWfNO1uRQ/Fib22/BpfqF27k9zhFqol1
         pP2RWAq50SxYGZliECPrKyQccTxB3qRGLAnpzqizhY8lhvfMb2UCdEA7/lM3qwonljmz
         atsj1ZlbsCwcif2lrkfKAedNAr3o4vZKAGGbRDVSpB1amb1pNrz3LhvcUJxeQEs1AHw1
         FZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679063686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4FKk1Fwhr1fzG6SpZjspB0mX89kWkmddwIe7IQAMes=;
        b=rcbrOdX1a/k0nqlgQXF+dWSvuaDSrqxJJ2vng0xynIo+ni+OccwxR7dUWv+FJX1nxd
         uUjAWRtkHHoAZEMPWKOcR6N2vXpb5cXtAgA7tEwAxubLE30ojcRoMjh30qroxtisyq4V
         VmAioeNOyPr72g6ikAIa1yE+KPM4TI+ReZYouB4CGszNx41UepdOuBDaQDeaCWZGhx20
         +5ecWnA/l4mQwrAFXIFQ3xn3eo5syTBH4riG+GUIWilfk2vYpBDiHB568C2qlDE9r2U+
         +7IIxqqkJawtbj2NweIh2QqK8U5h9xnNNr22IUf4bcOoQGGpbq5XtXSpnQUWYBHKTBrL
         YgUA==
X-Gm-Message-State: AO0yUKVIqRN/BtGBsRi0Tni3/TfZe5hf9PP2cvoc9BFQdefDkLFr8ZBJ
	4R2nKz8aFUjjExJbhyLlH+qHcg==
X-Google-Smtp-Source: AK7set/5VawiO0rvgEB3jmpUoHQievfUgoXM5XEaTxW/KdVKozL8AZkY8bPCPx6Dl2eH5jQEGkKctQ==
X-Received: by 2002:a17:906:9413:b0:930:9197:24d1 with SMTP id q19-20020a170906941300b00930919724d1mr3059411ejx.6.1679063686618;
        Fri, 17 Mar 2023 07:34:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d013:3eeb:7658:cec? ([2a02:810d:15c0:828:d013:3eeb:7658:cec])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906c00800b008e1509dde19sm1029098ejz.205.2023.03.17.07.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 07:34:46 -0700 (PDT)
Message-ID: <3a6a756c-3393-abf7-3ddf-7dd44c8ea160@linaro.org>
Date: Fri, 17 Mar 2023 15:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Probing devices by their less-specific "compatible" bindings
 (here: brcmnand)
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
References: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <399d2f43-5cad-6c51-fe3a-623950e2151a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_073450_700699_EFDCAC8E 
X-CRM114-Status: GOOD (  17.65  )
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

T24gMTcvMDMvMjAyMyAxMTowMiwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEhpLCBJIGp1c3Qg
c3BlbnQgZmV3IGhvdXJzIGRlYnVnZ2luZyBoaWRkZW4gaHcgbG9ja3VwIGFuZCBJIG5lZWQgdG8K
PiBjb25zdWx0IGRyaXZlciBjb3JlIGNvZGUgYmVoYXZpb3VyLgo+IAo+IEkgaGF2ZSBhIEJDTTQ5
MDggU29DIGJhc2VkIGJvYXJkIHdpdGggYSBOQU5EIGNvbnRyb2xsZXIgb24gaXQuCj4gCj4gCj4g
IyMjIEhhcmR3YXJlIGJpbmRpbmcKPiAKPiBIYXJkd2FyZSBkZXRhaWxzOgo+IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYnJvYWRjb20vYmNtYmNhL2JjbTQ5MDguZHRzaQo+IAo+IFJlbGV2YW50IHBhcnQ6
Cj4gbmFuZC1jb250cm9sbGVyQDE4MDAgewo+IAljb21wYXRpYmxlID0gImJyY20sbmFuZC1iY202
MzEzOCIsICJicmNtLGJyY21uYW5kLXY3LjEiLCAiYnJjbSxicmNtbmFuZCI7CgooLi4uKQoKPiAj
IyMgUHJvYmxlbQo+IAo+IEFzIGZpcnN0IExpbnV4IHByb2JlcyBteSBoYXJkd2FyZSB1c2luZyB0
aGUgImJyY20sbmFuZC1iY202MzEzOCIKPiBjb21wYXRpYmlsaXR5IHN0cmluZyBkcml2ZXIgYmNt
NjMxMzhfbmFuZC5jLiBUaGF0J3MgZ29vZC4KPiAKPiBJdCB0aGF0IGZhaWxzIGhvd2V2ZXIgKC5w
cm9iZSgpIHJldHVybnMgYW4gZXJyb3IpIHRoZW4gTGludXggY29yZSBzdGFydHMKPiBwcm9iaW5n
IHVzaW5nIGRyaXZlcnMgZm9yIGxlc3Mgc3BlY2lmaWMgYmluZGluZ3MuCj4gCj4gSW4gbXkgY2Fz
ZSBwcm9iaW5nIHdpdGggdGhlICJicmNtLGJyY21uYW5kIiBzdHJpbmcgZHJpdmVyIGJyY21zdGJf
bmFuZC5jCj4gcmVzdWx0cyBpbiBpZ25vcmluZyBTb0Mgc3BlY2lmaWMgYml0cyBhbmQgY2F1c2Vz
IGEgaGFyZHdhcmUgbG9ja3VwLiBIdwo+IGlzbid0IGluaXRpYWxpemVkIHByb3Blcmx5IGFuZCB3
cml0ZWxfcmVsYXhlZCgweDAwMDAwMDA5LCBiYXNlICsgMHgwNCkKPiBqdXN0IG1ha2UgaXQgaGFu
Zy4KPiAKPiBUaGF0IG9idmlvdXNseSBpc24ndCBhbiBhY2NlcHRhYmxlIGJlaGF2aW9yIGZvciBt
ZS4gU28gSSdtIHdvbmRlcmluZwo+IHdoYXQncyBnb2luZyBvbiB3cm9uZyBoZXJlLgo+IAo+IFNo
b3VsZCBMaW51eCBhdm9pZCBwcm9iaW5nIHdpdGggbGVzcy1zcGVjaWZpYyBjb21wYXRpYmxlIHN0
cmluZ3M/CgpXaHk/IElmIGxlc3Mtc3BlY2lmaWMgY29tcGF0aWJsZSBpcyB0aGVyZSwgaXQgbWVh
bnMgZGV2aWNlIGlzIGNvbXBhdGlibGUKd2l0aCBpdCBhbmQgaXQgc2hvdWxkIHdvcmsuCgo+IE9y
IHNob3VsZCBJIG5vdCBjbGFpbSBodyB0byBiZSAiYnJjbSxicmNtbmFuZCIgY29tcGF0aWJsZSBp
ZiBpdCBSRVFVSVJFUwo+IFNvQy1zcGVjaWZpYyBoYW5kbGluZz8KCkFzIHlvdSBwb2ludGVkIHRo
aXMgY29tcGF0aWJsZSBkb2VzIG5vdCB3b3JrIGZvciB5b3VyIGRldmljZSwgc28gdGhleQphcmUg
bm90IGNvbXBhdGlibGUuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
