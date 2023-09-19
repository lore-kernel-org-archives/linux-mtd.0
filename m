Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B8BCE79A9
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEQc/BHpU7BZNGA8BY3b9fZzyJFayUX2fxmEpx4Y6Gs=; b=CWqDSOtpHI3lle
	E8eZrcPz0hs6buQiJCqi7s6BKribsjKAZiggR288hQL/UiRlzsF9+cqIAfZYsUBV/piHUb9ILGz1u
	b+qdbxmsKMMSxV0eAoUz6P1Huxfn5Bwe3tEDa0GcFCxk5BJ6WebzWaojzu9unu2D+3YCddBZrrWwC
	hLzvzIGA3s0u3sCt7f5lJI0GuYvbD4oCoRBqVtLrJmkd5C/F/xH+zlEnqWT74BZ0DKYNjJxgVp2Td
	aDMzVfEGTgeAwokkz86XvoqZBnCrm/za160xFVKmNgr9DAFKltw7snZZfoRK7NrezDuiBL0ki88VH
	4okNxlNgP/bJSjRi0TTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qid6Z-000o8z-2G;
	Tue, 19 Sep 2023 15:57:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qid6W-000o8Q-2Q
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 15:57:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9adb9fa7200so1197951666b.0
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695139054; x=1695743854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKGEdd9joz9wrUZ2JRmffjhMh4fTSLb3Ojl1LyplXW8=;
        b=LqZLRqWBJg+i5ySEQ7WfZxJWFMpN4W9w5JACjN/4/RHArNqFBnPCW4ICFQN+hWnmcd
         7xagAi6CSsvDGtlK8jY2czDHfeZKYcG9M2ZEJb0j7q0DcoQww3M+5j/LtdosNgWznysb
         pbmuTaAb+6x35kDVGZ87i0E6EgahF85m62+xMLLbJssUh8D/z/pp3nYbBd62FRDB/aAj
         kQbyLxy90V4MnG3KFkFigPJuXRD8exdps4yruUdORaUR6s2vaOSfqeTDg1YchqImwUcm
         hKnszaIP3KEB89ha6qiFrmrOQ4d91oqhnC4yZrRnGh0R9lR/SBKcGBPDWOnvjJzpeCH9
         dmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695139054; x=1695743854;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKGEdd9joz9wrUZ2JRmffjhMh4fTSLb3Ojl1LyplXW8=;
        b=Bhc6PmRjN5ictZgUKC5mMqwwwK37lbMJD2DqtgBSlzgz/ls3U2qOSgmaM9E+KIVDhW
         tSCZhWghklwd4b5YMNcmDzC/BKjbPc1pdiuPjmTqyU6MdWodns7PfWMxBPUMifwGQ71s
         aeBkRx/XJus+qi5Jmz6fT3CsxKTGf4BMDogEhzddbQKQ1q5GESfAs7RfBWt6nlyN+rQP
         g7R8MnWoYy/FrfGIwDRd4xt9rzk4YqFoANeL9CXhaD23PYXFaS/lXyUSamMqu9vVau+k
         B/NtQqNKmhPz5obtVcRLTfvWGHwy4w51rizKQP4XGjN0KTG5Z8+nCbdKjunydtjtWugU
         Z2oQ==
X-Gm-Message-State: AOJu0Yx11+ftA6Uwhkwy/nkhH6rzBhperOQafRVCi1g+XqTleO+qnUeW
	6I9mchjshGVJ/HrILhlurYALgQ==
X-Google-Smtp-Source: AGHT+IEdb1FOFYFSHJmx8fdRbtk9F7+CCZLypla3cI36pyOaiY0dieAc0udjJGO081OjUgD/+8RA1g==
X-Received: by 2002:a17:906:73d5:b0:9a1:b144:30f4 with SMTP id n21-20020a17090673d500b009a1b14430f4mr170754ejl.14.1695139054600;
        Tue, 19 Sep 2023 08:57:34 -0700 (PDT)
Received: from [172.20.101.114] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id u26-20020a170906c41a00b00989828a42e8sm8034584ejz.154.2023.09.19.08.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 08:57:34 -0700 (PDT)
Message-ID: <ad085fb3-8c71-2af1-db40-990213e9288d@linaro.org>
Date: Tue, 19 Sep 2023 18:57:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 20/41] mtd: spi-nor: everspin: convert flash_info to
 new format
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-20-e60548861b10@kernel.org>
 <647d3775-a71d-a880-6d4d-3eb5a89ec9d6@linaro.org>
 <e7a48b040541f783773d9d0039816633@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <e7a48b040541f783773d9d0039816633@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_085736_827465_0BA5FDFE 
X-CRM114-Status: GOOD (  13.94  )
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

CgpPbiAxOS4wOS4yMDIzIDE0OjMzLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDkt
MTkgMTE6MjQsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMDguMDkuMjAyMyAxMzoxNiwg
TWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IFRoZSBJTkZPeCgpIG1hY3JvcyBhcmUgZ29pbmcgYXdh
eS4gQ29udmVydCB0aGUgZmxhc2hfaW5mbyBkYXRhYmFzZSB0bwo+Pj4gdGhlIG5ldyBmb3JtYXQu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+
Cj4+PiAtLS0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9ldmVyc3Bpbi5jIHwgMzMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9zcGktbm9yL2V2ZXJzcGluLmMKPj4+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9ldmVyc3Bpbi5j
Cj4+PiBpbmRleCBkMDJjMzJmMmY3YWQuLjQ2Nzc2YmMxMGIyNyAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvZXZlcnNwaW4uYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9ldmVyc3Bpbi5jCj4+PiBAQCAtOSwxMCArOSwzNSBAQAo+Pj4gwqAjaW5jbHVkZSAiY29yZS5o
Igo+Pj4KPj4+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGV2ZXJzcGluX25vcl9w
YXJ0c1tdID0gewo+Pj4gLcKgwqDCoCB7ICJtcjI1aDEyOCIsIENBVDI1X0lORk8oMTYgKiAxMDI0
LCAxLCAyNTYsIDIpIH0sCj4+PiAtwqDCoMKgIHsgIm1yMjVoMjU2IiwgQ0FUMjVfSU5GTygzMiAq
IDEwMjQsIDEsIDI1NiwgMikgfSwKPj4+IC3CoMKgwqAgeyAibXIyNWgxMCIswqAgQ0FUMjVfSU5G
TygxMjggKiAxMDI0LCAxLCAyNTYsIDMpIH0sCj4+PiAtwqDCoMKgIHsgIm1yMjVoNDAiLMKgIENB
VDI1X0lORk8oNTEyICogMTAyNCwgMSwgMjU2LCAzKSB9LAo+Pj4gK8KgwqDCoCB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgLm5hbWUgPSAibXIyNWgxMjgiLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5zaXpl
ID0gU1pfMTZLLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5zZWN0b3Jfc2l6ZSA9IFNaXzE2SywKPj4+
ICvCoMKgwqDCoMKgwqDCoCAucGFnZV9zaXplID0gMjU2LAo+Pgo+PiBwYWdlIHNpemUgZGVmYXVs
dHMgdG8gMjU2LCBpc24ndCBpdD8gQ2FuIHdlIGdldCByaWQgb2YgdGhlIHBhZ2Vfc2l6ZQo+PiBh
c3NpZ25tZW50cz8KPiAKPiBZZXMhCj4gCj4+Cj4+PiArwqDCoMKgwqDCoMKgwqAgLmFkZHJfbmJ5
dGVzID0gMiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBTUElfTk9SX05PX0VSQVNFIHwg
U1BJX05PUl9OT19GUiwKPj4+ICvCoMKgwqAgfSwgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1l
ID0gIm1yMjVoMjU2IiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IFNaXzMySywKPj4+ICvC
oMKgwqDCoMKgwqDCoCAuc2VjdG9yX3NpemUgPSBTWl8zMkssCj4+PiArwqDCoMKgwqDCoMKgwqAg
LnBhZ2Vfc2l6ZSA9IDI1NiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuYWRkcl9uYnl0ZXMgPSAyLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5mbGFncyA9IFNQSV9OT1JfTk9fRVJBU0UgfCBTUElfTk9SX05P
X0ZSLAo+Pj4gK8KgwqDCoCB9LCB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAibXIyNWgx
MCIsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnNpemUgPSBTWl8xMjhLLAo+Pj4gK8KgwqDCoMKgwqDC
oMKgIC5zZWN0b3Jfc2l6ZSA9IFNaXzEyOEssCj4+PiArwqDCoMKgwqDCoMKgwqAgLnBhZ2Vfc2l6
ZSA9IDI1NiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuYWRkcl9uYnl0ZXMgPSAzLAo+IAo+IGFsc28g
ImFkZHJfbmJ5dGVzID0gMyIgaXMgdGhlIGRlZmF1bHQuCgpvaywgdXBkYXRpbmcgbm93LgoKPiAK
PiAtbWljaGFlbAo+IAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mbGFncyA9IFNQSV9OT1JfTk9fRVJB
U0UgfCBTUElfTk9SX05PX0ZSLAo+Pj4gK8KgwqDCoCB9LCB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
Lm5hbWUgPSAibXIyNWg0MCIsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnNpemUgPSBTWl81MTJLLAo+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5zZWN0b3Jfc2l6ZSA9IFNaXzUxMkssCj4+PiArwqDCoMKgwqDC
oMKgwqAgLnBhZ2Vfc2l6ZSA9IDI1NiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuYWRkcl9uYnl0ZXMg
PSAzLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mbGFncyA9IFNQSV9OT1JfTk9fRVJBU0UgfCBTUElf
Tk9SX05PX0ZSLAo+Pj4gK8KgwqDCoCB9Cj4+PiDCoH07Cj4+Pgo+Pj4gwqBjb25zdCBzdHJ1Y3Qg
c3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9ldmVyc3BpbiA9IHsKPj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
