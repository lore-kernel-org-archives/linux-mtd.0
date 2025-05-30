Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2DFC5B549
	for <linux-mtd@archiver.kernel.org>; Fri, 30 May 2025 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uib0sLx5BiufF0jh2l4/jC9dnTVJOZlg5m1Cu3CjidI=; b=ge/mqNCQFqJwJy
	iqincUCp9qdAny8ZDnJTLLnRHhqZor01vyPUWkWoTMG4bfx9L0+FrjM9XMCkuCMCMf3le1bw5KIkg
	s+Acj8J5iDMm+IWssdY7sllMwyaow7m3grR1HQffNz9jHTegffce9iD8kYfxk+ijOJeHc+NlI5U7n
	3mcPnSOiNDYg7yYZMdDzM5TIVdZZSBwJbijkAo4vmnxg4cjRLrfNofB1L+5WKkLmYARME7jmponKx
	eHaNoIkurT6mkTILXx/aWHC+NslwdrH9T26SC/WU8YW4wR3hw1j6zeKffwWuLZaunMULhPFMkSvlJ
	QqkemY56qMkoi2vWR5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxaN-00000000MDF-46po;
	Fri, 30 May 2025 11:07:39 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxaM-00000000MCp-15C5
	for linux-mtd@lists.infradead.org;
	Fri, 30 May 2025 11:07:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so3129633a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 30 May 2025 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748603256; x=1749208056; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4ZdmHPp5u88c677hlTmVdlU6RsFYWCDgNeLS1e4+ps=;
        b=AgHeVUvIVHhkQbKLSF/iNMeF9yxOqrQBkyqgh0e9GiBkotE+OknVaZlTlP1huaSbN/
         eCIlGDkfw5/Q9huVaRIKoHXYFT5GqAsUC64Rv/LRZRg4++HtFeNgbYYAwHSr3HZhV7Ll
         rSFBI18wMcqrN+jicZ+Xn5JD5V2oRJ2LeJtt2dbliG7bpkE+pao8QgBr+7svTg8PSRAG
         Z740M4iiBLlxwGgnR7MFsAL2gBGRYDLjH5nldxAwd7Kz8oaM16+6D3w0xBK9912Ugbdm
         uFmRN15Q07riGZxWxYduc9e0Jt3PJGdn+PARkPwATF9y02uDYE3PLlcV9BDlryb9TPSW
         16Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603256; x=1749208056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4ZdmHPp5u88c677hlTmVdlU6RsFYWCDgNeLS1e4+ps=;
        b=j4XWQ0yXwdVEt8HHfQoog9iditdg05y4St3Y40l6gtMeKHlrfD1CRY/HCTap4YlM25
         hlue1y9k793W0i0pkK7OFUjjIUw20CL4asrjLH2X0HgRVh/qWyIDyRHTf3n9tFOOIYAe
         4bXKcAHV2dOrkjicK2ogVm6Bjrg5+xgw4qlJ79DK7RTZmmK5zgxBf5Fmm2GidDb/Tr0N
         U0wBH/hFh0Is8QwNxnl+PbEeFzHWI0i0cxSsMYeVJpnTNykAPVjkPSZgKc1F+I6ODLrt
         7wuMOokJKWARIwhTqILpcjiHEfMLocI+xo0hDS1uctOkM9GAZC3CqaDXReHXtR16QpHC
         mUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXzboxNMC3JkP2OnogjENmZrtuOUXqPIiJNGSh7+Uk7zJ8DMyIg7Tz+0aJkPA0c11FZm0N3fbYhLE4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3cc9umYpZVMZJfN259iYFHUnpTq9lqAOYiJ59lVvfNu+OajbY
	RHUy6+JUMeD0SoaaKIfMoAyk8Tg5F5tQUYOxF8SRBOwu0iTy0H5nAqae
X-Gm-Gg: ASbGncuUpBzgJzkkKG4QLh/hp8dFChGDfqL+FJLCwwgc/9TkfMchJ8GX7sW2oNBlolB
	xydjV5/EbegbLlHqxYC0FSsKHTcdGeYSYkK2AZ8plns8ulHglBnJLO4og1J+W4MTLN9Do87IcDh
	3Cksx8uWVxEPIiF3KJUaEdr2+dwO3d1j8UPMYxVNSuXol8v6H8am8yKVCKfhGXso7eRmb9aa0Iv
	HrhFc0r9VNKwKN6PGYLtfd6jmWHiA+chr48uwPcn2n+DxNl/bv30XIjkdBQ7WGTzQcpzGPwVXdm
	50xDC0OgHnnybmYcaxMDOyEiXNxfsg8vew9lP7dmQew0dtEQfshDHqjKkxYn0BFtvu2aFiFMbze
	oX+BbmTB5r/k13Vqi75nYc5ZhTnc=
X-Google-Smtp-Source: AGHT+IEJEZ0HZGATsOA3e1o6i0DTK+hWUEQ2zJOHWGQcm9LQPtIAr5i0sQqhE620G4EgLJF6VkfVkg==
X-Received: by 2002:a17:907:3f09:b0:ad8:8d3c:8a73 with SMTP id a640c23a62f3a-adb3228d6aemr265848566b.17.1748603256265;
        Fri, 30 May 2025 04:07:36 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3952esm306355166b.126.2025.05.30.04.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 04:07:35 -0700 (PDT)
Message-ID: <28db650d-a911-4df9-9ad4-f926ea0683e6@gmail.com>
Date: Fri, 30 May 2025 13:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mark Brown <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lakshmi Sowjanya D <quic_laksd@quicinc.com>
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
 <KuueBg3qliXMt9QN9kV_5_on2xJV-BEWZAsktO_Ce-Fq1iBAPCFypbYUVZxlV4LjF0AUZG57KqiXZZ3uefQrXw==@protonmail.internalid>
 <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
 <68c54d56-3e44-4f43-8bd6-f6b7fa1f379b@linaro.org>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <68c54d56-3e44-4f43-8bd6-f6b7fa1f379b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_040738_300774_16A435CC 
X-CRM114-Status: GOOD (  11.03  )
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

MjAyNS4gMDUuIDMwLiAxMDo1NiBrZWx0ZXrDqXNzZWwsIEJyeWFuIE8nRG9ub2dodWUgw61ydGE6
CgouLi4KCj4gVGhpcyBvbmUgZG9lc24ndCBhcHBseSB0byAtbmV4dAoKSXQgaXMgYmVjYXVzZSB0
aGUgc2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBTUEkgdHJlZSwgYW5kIC1uZXh0IGNvbnRhaW5zIGFu
b3RoZXIKY2hhbmdlIGZvciAnZHJpdmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jJyB3aGljaCBj
b21lcyBmcm9tIHRoZSBNVEQgdHJlZS4KCkl0IGNhbiBiZSBhcHBsaWVkIGJ5IHNwZWNpZnlpbmcg
dGhlICdNJyBzd2l0Y2ggZm9yIGI0IHNoYXphbS4KCgokIGdpdCByZXNldCAtLWhhcmQgbmV4dC0y
MDI1MDUzMApIRUFEIGlzIG5vdyBhdCAzYTgzYjM1MGI1YmUgQWRkIGxpbnV4LW5leHQgc3BlY2lm
aWMgZmlsZXMgZm9yIDIwMjUwNTMwCiQgYjQgc2hhemFtIC1NIDIwMjUwNTI5LXFwaWMtc25hbmQt
YXZvaWQtbWVtLWNvcnJ1cHRpb24tdjItMC0yZjBkMTNhZmM3ZDJAZ21haWwuY29tCkdyYWJiaW5n
IHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1MjktcXBpYy1zbmFuZC1hdm9p
ZC1tZW0tY29ycnVwdGlvbi12Mi0wLTJmMGQxM2FmYzdkMkBnbWFpbC5jb20vdC5tYm94Lmd6CkNo
ZWNraW5nIGZvciBuZXdlciByZXZpc2lvbnMKR3JhYmJpbmcgc2VhcmNoIHJlc3VsdHMgZnJvbSBs
b3JlLmtlcm5lbC5vcmcKQW5hbHl6aW5nIDQgbWVzc2FnZXMgaW4gdGhlIHRocmVhZApBbmFseXpp
bmcgMTIgY29kZS1yZXZpZXcgbWVzc2FnZXMKQ2hlY2tpbmcgYXR0ZXN0YXRpb24gb24gYWxsIG1l
c3NhZ2VzLCBtYXkgdGFrZSBhIG1vbWVudC4uLgotLS0KICA/IFtQQVRDSCB2MiAxLzJdIHNwaTog
c3BpLXFwaWMtc25hbmQ6IHJlYWxsb2NhdGUgQkFNIHRyYW5zYWN0aW9ucwogID8gW1BBVENIIHYy
IDIvMl0gbXRkOiBuYW5kOiBxcGljX2NvbW1vbjogcHJldmVudCBvdXQgb2YgYm91bmRzIGFjY2Vz
cyBvZiBCQU0gYXJyYXlzCiAgLS0tCiAgPyBTaWduZWQ6IERLSU0vZ21haWwuY29tCi0tLQpUb3Rh
bCBwYXRjaGVzOiAyCi0tLQogQmFzZTogdXNpbmcgc3BlY2lmaWVkIGJhc2UtY29tbWl0IGIwMGQ2
ODY0YTRjOTQ4NTI5ZGM2ZGRkMmRmNzZiZjE3NWJmMjdjNjMKTWFnaWM6IFByZXBhcmluZyBhIHNw
YXJzZSB3b3JrdHJlZQotLS0KQXBwbHlpbmc6IHNwaTogc3BpLXFwaWMtc25hbmQ6IHJlYWxsb2Nh
dGUgQkFNIHRyYW5zYWN0aW9ucwpBcHBseWluZzogbXRkOiBuYW5kOiBxcGljX2NvbW1vbjogcHJl
dmVudCBvdXQgb2YgYm91bmRzIGFjY2VzcyBvZiBCQU0gYXJyYXlzCi0tLQpGZXRjaGluZyBpbnRv
IEZFVENIX0hFQUQKV2lsbCBleGVjOiBnaXQgbWVyZ2UgLS1uby1mZiAtRiAvaG9tZS9qdWhvc2cv
ZGV2ZWwvbGludXgtaXBxOTV4eC8uZ2l0L2I0LWNvdmVyIC0tZWRpdCBGRVRDSF9IRUFEIC0tc2ln
bm9mZgpQcmVzcyBFbnRlciB0byBjb250aW51ZSBvciBDdHJsLUMgdG8gYWJvcnQKQXV0by1tZXJn
aW5nIGRyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24uYwpBdXRvLW1lcmdpbmcgZHJpdmVycy9z
cGkvc3BpLXFwaWMtc25hbmQuYwpBdXRvLW1lcmdpbmcgaW5jbHVkZS9saW51eC9tdGQvbmFuZC1x
cGljLWNvbW1vbi5oCk1lcmdlIG1hZGUgYnkgdGhlICdvcnQnIHN0cmF0ZWd5LgogZHJpdmVycy9t
dGQvbmFuZC9xcGljX2NvbW1vbi5jICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tCiBkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jICAgICAgICAgfCAxNiArKysrKysr
KysrKysrKysrCiBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmggfCAgOCArKysr
KysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQok
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
