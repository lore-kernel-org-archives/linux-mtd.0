Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5130C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMpHYev0o9j7S4FflcWDcP9PkIB7k/mubnnfGICGZ+w=; b=u6hJcqUOpmSxn2
	ojrGAYKmHq/PcE9LVXITIwxXC18gF3YQYtUYA21ciMKI3dPtiEaHB07q1SGfH8kmT4bam4OV+4VRS
	FEFSr6j6eWH21cNwKNh75OiyRvIlU7qCUSikU5s60HDVnQJYmqlLKIfYZLUyPWiCxDg5Kn4cnCms4
	mdY6sq66MWkK6/wNDCVkgQMsqQnKK4c4/MmEEd3+YlETNq48c1PnieOr82fGm0s/LLPySo6MsRFmb
	h+g4+6bIyExhc+Tb8Br4aCVXc7L5kNlQTkwB3AHT0+HBxj2/yYpfnpU/dAdEZgLUO/oaKnOYJcTBv
	VsSlL+C3lWct/g4NlWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUpg-00000005eiM-1ZsG;
	Tue, 18 Mar 2025 11:10:04 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUhn-00000005d8i-44Ku
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 11:01:57 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d43b3b4c32so169605ab.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742295715; x=1742900515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyOTlkMLLq1XbPf3HPBV8cNbeM65vB0jFdFuOYLkhJY=;
        b=iHnHirWfyLkhlE1rP6dA2yKz8Fn00zDvWj4r5w6TI9Npj5pmD9i8S57jRBovEVgwRX
         /NnU38Pc7jg+6XAfjLc1anVfPNGAGr+f4keUQTiUyCt/lC67DL8oVQma0FYvVJVvdL4r
         Kc11O66//g8fkVXC90Vl2u6B4s4F1AJPr5AY7cFs/fDjB9zUFrOORHDG2LAcHs1oMDB5
         gLmxkGyDoB20rEayQ6e/W9ReXiZ72Se5TNZUscwjWB2r2Kvuj9vNo/LDxOH7u7UttZCJ
         1hA3o4RC/w1zfYyv7fVmoQI7P7eCQhN05vOUMaH1L26IpYgfa2hV9jCHLNQJXNlIXxtS
         7u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742295715; x=1742900515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyOTlkMLLq1XbPf3HPBV8cNbeM65vB0jFdFuOYLkhJY=;
        b=nVhT8YOAWVhpBy/FJJDZhOdWf2Zs5zycBQW8Q0PVOCSppE5zh0lG94riQVzFpDyBTQ
         KDWf0NXVK/foO2N5FqC5cgbtgzHz5/7Uy0maYlvQtw3BQoYlzSr6RvGHjEEuRjCLsUod
         Vlqg7XOkX4i2E79HzYkjq29ycEA+DqP1LYVaihlp+iByr+QDHx6CMCsBep9EkitkYYBI
         5QOcNGQ7ikDK/67zoO/fbgMX4H6xH8R1P8KXLe5DFkzg/JMJ7oufiyP2usH4lus2Y8Jb
         Od9u0HoMafjjmF7a5SpWH4MdaJ1hbgNCRmFNSxhIOJvlRA3VCuuSgy/uPVVIH/Q4kTaJ
         eEjw==
X-Forwarded-Encrypted: i=1; AJvYcCUtJviL7el42441UQZQv9gpMpbbCf676duvzhAKWQ1KsoA1NktfujU0GkdTgCTxkQl6G+v8QVDI+Bc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1In+9xjVo7IE3qe5/ydjSRn8YIAUnvG0G+WjQN1aOn8lRrt2q
	3id9iF6TMFpRTONwG9vP1VDM3Dx7iZGabmvvpr4++NI9mMLEmipb/ZQmH1szHKVqfAFeQPx2OaL
	vV8aHGz8nfx9Tz7Ds/0rewHD1VA8ioZG4Es5ENgsF4V6vIWk81JAyrWE=
X-Gm-Gg: ASbGnctMqPwWrweX6gmsdupaCQOZfv3hRsTtvArylQzL8e5FDBGxl3PYMbuTaIit/zt
	WGjHx/9duYGy4bbRqqdg1v0q0VFhhgBND/UCdAfAUqsYXGp7r2EmftqMRF4YoOV9nhWpZm9fLF0
	w6gje4bey+44NF6hieTG4dgRBp7DiL81nF5vRw+B+WLxRmnPkpPGTkyw==
X-Google-Smtp-Source: AGHT+IEhQurkZUOjDCLCR6aX/svMLP/x01GJxn3vHhsxdJO5NhP/IMZvSX69zNS2XwIqEYqsLONLtYI2WX1kf/PROI8=
X-Received: by 2002:a92:c26d:0:b0:3d4:70cf:f380 with SMTP id
 e9e14a558f8ab-3d57f07db2emr1550895ab.5.1742295714506; Tue, 18 Mar 2025
 04:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250317182107.2060739-1-czapiga@google.com> <e2e890a9-ebc4-45fb-92eb-502be027e807@linaro.org>
In-Reply-To: <e2e890a9-ebc4-45fb-92eb-502be027e807@linaro.org>
From: "Jakub \"Kuba\" Czapiga" <czapiga@google.com>
Date: Tue, 18 Mar 2025 12:01:18 +0100
X-Gm-Features: AQ5f1JqsbLmaJK8yqtKzEwiNea28ZEfKsiKImtRDuIAnjxzqfuvHz_ePZ6SiEHs
Message-ID: <CABkukdq_d0YrdUz_+3dkn3BymDMzRfXk1s58ZTMCuUwO3mbvJw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: xmc: add support for XM25QH128C and XM25QH256C
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_040156_012353_E12F30C6 
X-CRM114-Status: GOOD (  30.24  )
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

T24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgNzoyN+KAr0FNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBIaSwgSmFrdWIsCj4KPiBEbyB5b3UgaGF2ZSBh
Y2Nlc3MgdG8gdGhlc2UgZmxhc2hlcz8gQ2FuIHlvdSB0ZXN0IHRoZW0/CgpIaSBUdWRvciwKSSd2
ZSBjaGVja2VkIG91ciBpbnZlbnRvcnkgYW5kIGl0IHNlZW1zIHRoYXQgYWxsIG91ciBkZXZpY2Vz
IHVzZQplaXRoZXIgV2luYm9uZCBvciBNYWNyb25peCBjb21wYXRpYmxlcywgc28gSSdtIG5vdCBh
YmxlIHRvIGRpcmVjdGx5CnRlc3QgdGhlc2UgY2hpcHMuIExvb2tzIGxpa2UgT0RNcyBkZWZhdWx0
IHRvIFdpbmJvbmQgY2hpcHMgYW5kIGFsbApvdGhlciB2YXJpYW50cyBhcmUgYSB2aWFibGUgc2Vj
b25kIHNvdXJjZS4gSSBnb3QgYSBsaXN0IG9mIGNoaXBzIGZyb20Kb3VyIGZhY3RvcnkgdGVhbSBz
byBJIGFzc3VtZWQgd2UgaGF2ZSBzb21lIGRldmljZXMgSSBjYW4gYWN0dWFsbHkgdGVzdAp0aGVz
ZSBjaGFuZ2VzIG9uLCBidXQgdW5mb3J0dW5hdGVseSB0aGF0J3Mgbm90IHRoZSBjYXNlLiBIb3dl
dmVyIEkKY291bGQgdXNlIEVNMTAwIHRvIGVtdWxhdGUgdGhlc2UgY2hpcHMgaWYgbmVlZGVkLCBi
dXQgSSB0aGluayBJJ2xsCmhhdmUgdG8gcHV0IHRoZXNlIGNoYW5nZXMgb24gaG9sZCB1bnRpbCB3
ZSBhY3R1YWxseSBnZXQgc29tZSBkZXZpY2VzCndpdGggdGhlc2UgY2hpcHMuIERhdGFzaGVldHMg
c2hvdWxkIGJlIGdvb2QgZW5vdWdoIG9mIGEgcmVhc29uLCBidXQKdW5mb3J0dW5hdGVseSBpbiBy
ZWFsaXR5IGNoaXBzIG1pZ2h0IGZ1bmN0aW9uIHNsaWdodGx5IGRpZmZlcmVudGx5CnRoYW4gZGVz
Y3JpYmVkIGluIHRoZSBkb2N1bWVudGF0aW9uLgoKPiBXZSBoYXZlIGEgbWluaW11bSB0ZXN0aW5n
IHJlcXVpcmVtZW50IGJlZm9yZSB1cGRhdGluZyBvciBhZGRpbmcgbmV3Cj4gZmxhc2hlcywgaGVy
ZSBpdCBpczoKPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL210ZC9zcGktbm9y
Lmh0bWwjbWluaW11bS10ZXN0aW5nLXJlcXVpcmVtZW50cwoKVGhhbmsgeW91LCBJJ2xsIHBlcmZv
cm0gbmVjZXNzYXJ5IHRlc3RzIG9uIGFsbCBjaGlwcyBJIGhhdmUgYWNjZXNzIHRvLAppbmNsdWRp
bmcgb3RoZXIgcGF0Y2hlcyBJIHN1Ym1pdHRlZCBhbG9uZ3NpZGUgdGhpcyBvbmUuCgo+IEl0J3Mg
dHJ1ZSB0aGF0IHdlIGRvbid0IGhhdmUgeWV0IGxvY2tpbmcgdGVzdHMgZGVzY3JpYmVkLCBidXQK
PiBjb250cmlidXRpb25zIHRvIHRoZSBkb2N1bWVudGF0aW9uIGlzIHdlbGNvbWVkIQoKSSdsbCBz
ZWUgd2hhdCBJIGNhbiBkbyBhYm91dCB0aGlzLiBXZSBuZWVkIGxvY2tpbmcgdG8gd29yayBjb3Jy
ZWN0bHksCnNvIGhhdmluZyBhIGdvb2QgdGVzdGluZyBzY2VuYXJpbyB3aWxsIGJlbmVmaXQgZXZl
cnlvbmUuCgo+IE9uIDE3LjAzLjIwMjUgMjA6MjEsIEpha3ViIEN6YXBpZ2Egd3JvdGU6Cj4gPiBC
b3RoIGNoaXBzIHN1cHBvcnQgU0ZEUCAoSkVTRDIxNikuCj4gPiBYTTI1UUgxMjhDIG9ubHkgc3Vw
cG9ydHMgMy1iaXQgQmxvY2stUHJvdGVjdGlvbiB3aXRoIFRvcC1Cb3R0b20KPiA+IGNvbmZpZ3Vy
YXRpb24gYml0Lgo+ID4gWE0yNVFIMjU2QyBzdXBwb3J0cyA0LWJpdCBCbG9jay1Qcm90ZWN0aW9u
IHdpdGggVG9wLUJvdHRvbSBjb25maWd1cmF0aW9uCj4gPiBiaXQgb24gU1IoNikuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSmFrdWIgQ3phcGlnYSA8Y3phcGlnYUBnb29nbGUuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci94bWMuYyB8IDEyICsrKysrKysrKysrLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMgYi9kcml2ZXJzL210ZC9zcGktbm9y
L3htYy5jCj4gPiBpbmRleCBkNWEwNjA1NGIwZGQuLjk2M2E0NGMzOTA5YSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IveG1jLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3IveG1jLmMKPiA+IEBAIC0xOSw3ICsxOSwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNo
X2luZm8geG1jX25vcl9wYXJ0c1tdID0gewo+ID4gICAgICAgICAgICAgICAubmFtZSA9ICJYTTI1
UUgxMjhBIiwKPiA+ICAgICAgICAgICAgICAgLnNpemUgPSBTWl8xNk0sCj4gPiAgICAgICAgICAg
ICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05P
Ul9RVUFEX1JFQUQsCj4gPiAtICAgICB9LAo+ID4gKyAgICAgfSwgewo+ID4gKyAgICAgICAgICAg
ICAuaWQgPSBTTk9SX0lEKDB4MjAsIDB4NDAsIDB4MTgpLAo+ID4gKyAgICAgICAgICAgICAubmFt
ZSA9ICJYTTI1UUgxMjhDIiwKPgo+IGZvciB0aGUgbmV4dCB2ZXJzaW9uLCBkcm9wIHRoZSBuYW1l
IGFuZCBhZGQgaXQganVzdCBhcyBhIGNvbW1lbnQgYWJvdmUKPiB0aGUgZmxhc2ggZW50cnkgZGVm
aW5pdGlvbgo+Cj4gPiArICAgICAgICAgICAgIC5zaXplID0gU1pfMTZNLAo+Cj4gaWYgZmxhc2gg
c3VwcG9ydHMgU0ZEUCwgZHJvcCB0aGUgc2l6ZSBwYXJhbWV0ZXIsIGl0IHdpbGwgdHJpZ2dlciBT
RkRQCj4gcGFyc2luZy4KPgo+ID4gKyAgICAgICAgICAgICAuZmxhZ3MgPSBTUElfTk9SX0hBU19M
T0NLIHwgU1BJX05PUl9IQVNfVEIsCj4gPiArICAgICB9LCB7Cj4gPiArICAgICAgICAgICAgIC5p
ZCA9IFNOT1JfSUQoMHgyMCwgMHg0MCwgMHgxOSksCj4gPiArICAgICAgICAgICAgIC5uYW1lID0g
IlhNMjVRSDI1NkMiLAo+ID4gKyAgICAgICAgICAgICAuc2l6ZSA9IFNaXzMyTSwKPiA+ICsgICAg
ICAgICAgICAgLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwgU1BJ
X05PUl80QklUX0JQIHwgU1BJX05PUl9UQl9TUl9CSVQ2LAo+Cj4gc2FtZSBoZXJlLiBBZnRlciBz
d2l0Y2hpbmcgdG8gZmxhc2ggaW5pdCBiYXNlZCBvbiBTRkRQLCBwbGVhc2UgZG8gdGhlCj4gdGVz
dHMgbWVudGlvbmVkIGFib3ZlLgo+Cj4gQ2hlZXJzLAo+IHRhCgpCZXN0IHJlZ2FyZHMsCkpha3Vi
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
