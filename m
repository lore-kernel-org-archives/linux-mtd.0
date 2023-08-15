Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8968DC001B0
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSoQklkFZvF3O2Npeup+ptTgGrNerJ4sTC6hdWaM/M8=; b=Bd/YcZ9/jB3mkn
	edgIf7PPbJnsL7/rqy30DPUtpOvR6WaeksdC8rUIZPED7VAIob+d5xWjctnxZfAcIZEEHjYewESma
	i+qARD8i0Zmbv6mKiW1ST/0fpTx45LBSNSNSiigHcvonHb5JuIz7v6Q761zkCe5Ja2YAusayzfQHu
	ApKaSCcTB1udvkP2HZHtZ4zFGtjl6idkHtNo3oo8/U0TjoP4QiLQpCzv9A0+ty8mmY9R58SfDOPmU
	l+yA24xym/n9oB8I4uz05uyhH5MJYWvh0UnE6f70Zpm3TquTpiDCX86DOhJWDbgxyrJT9VmDyp+6Z
	Q47RWL7YHqksbWBdQ5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0gM-002Q3O-1S;
	Tue, 15 Aug 2023 20:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzZy-002InT-1I
	for linux-mtd@bombadil.infradead.org;
	Tue, 15 Aug 2023 19:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=; b=cFNVG/Ywn30VGqGAORpcF2hl7P
	OSh7/VJnezRg3FnqmGuR7qlRmfjysCjvkrtwGGzmYvj5rEB25UplmlP8iwRguCf6QmLQgiJ62xYDa
	N93OaJf6G/q4TPQWwUxRF4xnCbwCdDgEjb3kXnMSY/E03LJGsP/6cvt75mKl5NU4a5k7pZoWP1LMU
	tZKu6awjXyn7bZbB6PECBVi2LWeH6QeIwM0UXKn+zN0Vf3vu61GwhLXDRhl4kazuVkR8qsYeOPqto
	5u+BYdXOGFZ1C8Itkr5jEYBC73LxB+Fu8mjvLXBG9ZfzIVKitJFV4hGJVIrjH8hhoXCejoqw3Tkfj
	evcWrsOA==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzZs-00C2cH-17
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 19:19:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c1d03e124so708266866b.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692127177; x=1692731977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=;
        b=lUhNrtoERba3aorZadoUgJp9sCu3IbGKVivMwNrWnTG0yELOzp3fLhGA5srP0IpIxm
         KBoGNzrF/crrZmebYELgHIEkxozcxxtEo3/rzUVJl78TFfL5q+sms/p0Ih6sWJ+yxmH0
         WmIOggw4UWG9gVNckTrS8LMy+qNRpFpYXwv9toqdR3AU/V2kkKYXc6ipFkHJi+GnN+YA
         3BOow5pnOGq74dIyo5z54P1Hbl7aOhsUNecfcx1JoHcYimBY7saJsaYLgWe7FBtoj7V3
         IkqlbQA1sRa6r/wQa1WAPvD9lQm9WsBzLRoXl7pXOnic75zxJubcIxMOafFzX2CF3F8z
         DkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692127177; x=1692731977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=;
        b=YxxXA+YcBcR5OI2hKz3C2J1kL5N73FdnToRjR8ZjUB9v5eIOlyBa8wopik1xvn91el
         ckCTZiSd7vtj+iH8EFpfNyGLIFAEJgfQXgqDKSKQT0IVnPJfHF6N/9drlrq1NuiSMJzh
         KfKQqIFA3q7NDKDRw+HfUm17Mc+/T0rFtPALs/1il5uJPmWSnIDI7ssFjtYntCgJ01QI
         DFwgPGGwu5wZlpgWCpH0DatZAH5uF+aM9db1ErYzz6uDv4d/mbnp8F3Ub2Uz6IkxPynX
         XNd+rVw97FLw6mthZj/ufNrc5nIFAPytqARwWmKWpzpsDBj6/+arQUWW1e45u4xUpFu1
         whbg==
X-Gm-Message-State: AOJu0YxdugodkXTEhZA24uzoE/5nn4oXsRLlpMC9M8sQh+9Q7gXOxL0i
	a44iMnb4vtWahG2kJDYlfFKDlg==
X-Google-Smtp-Source: AGHT+IEamhO+Jl+q7/ydr+FDFDZuF0BIJhDmzs5q+uIy0rMFYS3cNVnuKTzqQrGnKGFA2D7kUp1BAQ==
X-Received: by 2002:a17:906:2215:b0:99c:47a:8bd5 with SMTP id s21-20020a170906221500b0099c047a8bd5mr11216606ejs.65.1692127177101;
        Tue, 15 Aug 2023 12:19:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ov10-20020a170906fc0a00b00993cc1242d4sm7360694ejb.151.2023.08.15.12.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 12:19:36 -0700 (PDT)
Message-ID: <fb85c288-2ea9-3343-ff19-cd58940b44ec@linaro.org>
Date: Tue, 15 Aug 2023 21:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
 <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
 <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_201940_510514_90D6AED6 
X-CRM114-Status: GOOD (  16.96  )
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

T24gMTUvMDgvMjAyMyAxOToyMSwgSHNpbi1ZaSBXYW5nIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDE1
LCAyMDIzIGF0IDExOjU54oCvUE0gTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4gd3Jv
dGU6Cj4+Cj4+IEhpLAo+Pgo+Pj4gT24gZ2lnYWRldmljZSBnZDI1bHE2NGMsIHRoZSBxdWFkIG1v
ZGUgaXMgZW5hYmxlZCBhZnRlciBCRlBUIGlzIHBhcnNlZC4KPj4+IEFjY29yZGluZyB0byBkYXRh
c2hlZXRbMV0sIFF1YWQgZW5hYmxlIChRRSkgYml0IG5lZWRzIHRvIGJlIHNldCB0byAwIHRvCj4+
PiB1c2Ugd3JpdGUgcHJvdGVjdGlvbiAoV1ApIHBpbi4gSXQgYWxzbyByZWNvbW1lbmRzIHNldHRp
bmcgZGVmYXVsdCB2YWx1ZSBvZgo+Pj4gUUUgdG8gMCB0byBhdm9pZCBhIHBvdGVudGlhbCBzaG9y
dCBpc3N1ZS4KPj4KPj4gU28geW91IGFyZSB1c2luZyBlaXRoZXIgZHVhbCBvciBzaW5nbGUgaW8g
bW9kZS4gV2h5IGNhbid0IHlvdSB1c2UgdGhlIGRldmljZSB0cmVlIHByb3BlcnR5IHNwaS17dHgs
cnh9LWJ1cy13aWR0aD8KPiAKPiBJIHRyaWVkIHNldHRpbmcgc3BpLXR4LWJ1cy13aWR0aCBhbmQg
c3BpLXJ4LWJ1cy13aWR0aCB0byBlaXRoZXIgMCBvciAxCj4gYW5kIFdQIHN0aWxsIGRvZXNuJ3Qg
d29yay4KPiBGb3IgdGhpcyBjaGlwLCBxdWFkX2VuYWJsZSB3aWxsIGJlIHNldCB0byBzcGlfbm9y
X3NyMl9iaXQxX3F1YWRfZW5hYmxlCj4gKFFFUiBmbGFnIGlzIEJGUFRfRFdPUkQxNV9RRVJfU1Iy
X0JJVDFfQlVHR1kpWzFdCj4gCj4gc3BpX25vcl93cml0ZV9zcl9hbmRfY2hlY2soKSBjYWxscwo+
IHNwaV9ub3Jfd3JpdGVfMTZiaXRfc3JfYW5kX2NoZWNrKClbMl0gYW5kIHRoZSBmdW5jdGlvbiBz
ZXRzIFFFIGJpdCBpZgo+IHF1YWRfZW5hYmxlIGlzIG5vdCBOVUxMLgo+IAo+IFsxXSBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc2ZkcC5jI0w1NzUKPiBbMl0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyNMODc5Cj4gCj4gU2V0dGluZyBz
cGkte3R4LHJ4fS1idXMtd2lkdGggc3RpbGwgZmFsbHMgdG8gdGhpcyBmdW5jdGlvbiBhbmQgY2Fz
ZXMuCgp3aXRoIHR4L3J4IGJ1cyB3aWR0aCA9IDIsIGhvdyBxdWFkIG1vZGUgaXMgc3RpbGwgcG9z
c2libGU/IElPVywgd2h5IGRvCnlvdSBuZWVkIG5ldyBwcm9wZXJ0eT8gWW91IHdyb3RlIGhlcmUg
YWJvdXQgZHJpdmVyLCBidXQgSSBhc2sgYWJvdXQKYmluZGluZ3MuCgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
