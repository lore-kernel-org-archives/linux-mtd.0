Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FF2C369D3
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Apr 2025 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feYKj0cLfGOD+vba58+3ULUGS4DSNrbyp3Eyj1bs1Zg=; b=u3NSC+mjmyianD
	Dh9ftVmZP9eINBDOAwsn/LxG4x+dM5Nr6Nq0RL3f0TiFNVuaui6mAVidW5qIlgIXzPEOPvhxtSRwA
	xS7hGzzyybS60Um2FfcgxESSLHJvVkUUVvnJaT+i+UIc4suj8cSW5IWLNrkR/6LxbZMOcuYjERMBA
	6zCx+ZeooIMSXZNOfr0FHixMcDc+s7t+/saP0h9XJY5x3G7krRFjEhZP8opfxBncfFivUlHZeuzIN
	SBV4EHhwSUCuFHl5vtIcKYnGaDMhci0YY18+VkUcEIhRvwwIVGrpb+XZdXdquo9WNpzoWEfalij6Z
	3LprsiCTBRumWtFmv2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DnL-0000000GEP9-2hbX;
	Fri, 25 Apr 2025 07:48:23 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Dn0-0000000GEKe-0QQm
	for linux-mtd@lists.infradead.org;
	Fri, 25 Apr 2025 07:48:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736b0c68092so1591635b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2025 00:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745567281; x=1746172081; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXYXeX99yUYQ64wKe7OdIaME+qdUHpQKuv9wqgqo5Cs=;
        b=TrcMkkzeni3ILJT+YYDFfm6zuvdc/cYIpSNIYM95Zmh7Iyp/H2bi3Kf2cqbxs6ADGD
         3F7eMFpWv/V8JFNY1MtHRWPGZdepvEQb0iJnsU2pPkQMcJ5r8H3tPyKKcHm/2KVhNpXf
         QLd6NSgwpm1q+uiV/M2MVYcriTMGx6deXvVijNljFFxuS2IehOF/poTftCECbsXfC8IU
         a0tt216MTmlq7P2zZWxUdyn167Zgq5BSTGCh7iuPNa4pJjLxOVRLfwptFwbYQYPdE3bi
         jdcuRj2IyyK3dadqSF0z8V/RMyVFfMnXx4XN+T1FlKTU8Vta4fWIfNHYwFuLITrM65q3
         NF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567281; x=1746172081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXYXeX99yUYQ64wKe7OdIaME+qdUHpQKuv9wqgqo5Cs=;
        b=JMwh6j0D/fTmyYCzqLNmhhSSVS22rHTLeLFOB1BzqO8k20JK6V/gxyqYcU2LNKGQk1
         35mTtn5R/PiuruSQ0KDLD0IJDAijeuMZxToneB0GBdkVd4b9WmYdRD43fIWySH+no6cF
         s4NSwTfyWbJGeIcNJm4rL07cHTXtT0UVRvGMrQuFemuN4szLORAWofjsAurkNW5iinmL
         mGEoGLVYnE55n5GqIfZXtpTm44H1SA1SzyG2P1EbXv6cZxQz6me30ba2U/hhSbZUXvyK
         e9DlHOnl/L084Q2ulf3lSBndH6W29ue1OW5kla2+WI1f1HIqa3eqc8K3xE4OAIi6rFrG
         gMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl3G4hq4CnTztdcKSCjyeAZwZwKz7WRlnC+EUqOPwczEWFUoe0IvLHs03mSGxIjtwxlwysd7F6tyo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ9y/XZ0cO6dwZcQE1JdOQ0omwT+LcldJt9B+0xAeX1BxqSBqe
	8YqOQgjzsoNkui2i2Ls/qxJB0uwXlYVZVBlmMLtGsKoS2ocZVCmGhQGqr3826Q==
X-Gm-Gg: ASbGnctggbmgUQSfrhVx5Dd4W8+vaWvf7u0noiODXMVrsTbIpiV0IuBM2kbJt0IaIoV
	XdcJ/FInp646ui7LKaTLhrmmnb6mA5uNM7+pStJS7V2PiOOWs23y9Z4s6KXYekxRkUZCXHyTocz
	kM4RL+0TneFVuMYAJmPM4n74Z2LecEotZkV/4p0KcNIv2zY2FqTAcIGlVV9YDpdisVMxhYJ5lQ4
	Q1MwEFz8L3RqV+hcM/2rg0j4iLYCCls6l+hd8CtReEdNmJa1SHpiB8zVSyT8FZ2GdaRMbIxEcQl
	HeXKmZaEM2r/PAOsB8jM2PLGWGt6qwLLlZ8hwnZDUwplVTu7ksk=
X-Google-Smtp-Source: AGHT+IFC/H/dBuQro0RKj49t41PCO5t1nJ6DAmlcyxyxl51nS8GK+dmHa5dgtUQcySuxJPxP0VqInQ==
X-Received: by 2002:a05:6a00:179e:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73fd90457demr1937127b3a.20.1745567280870;
        Fri, 25 Apr 2025 00:48:00 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a317sm2647101b3a.93.2025.04.25.00.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:48:00 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:17:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, absahu@codeaurora.org, bbrezillon@kernel.org, 
	architt@codeaurora.org, quic_srichara@quicinc.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: rawnand: qcom: Pass 18 bit offset from NANDc
 base to BAM base
Message-ID: <bsj6kvqjo3pfbsakex5quamk5tkrtigxdcoyu5bj3nt37zsgc5@7h7zidzbcs7p>
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
 <20250410100019.2872271-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410100019.2872271-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_004802_145697_5CCA3B9A 
X-CRM114-Status: GOOD (  24.00  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMDM6MzA6MTdQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBUaGUgQkFNIGNvbW1hbmQgZGVzY3JpcHRvciBwcm92aWRlcyBvbmx5IDE4IGJpdHMg
dG8gc3BlY2lmeSB0aGUgTkFORAo+IHJlZ2lzdGVyIG9mZnNldC4gCgpzL05BTkQgcmVnaXN0ZXIg
b2Zmc2V0L0JBTSByZWdpc3RlciBvZmZzZXQKCj4gQWRkaXRpb25hbGx5LCBpbiB0aGUgQkFNIGNv
bW1hbmQgZGVzY3JpcHRvciwgdGhlIE5BTkQKPiByZWdpc3RlciBvZmZzZXQgaXMgc3VwcG9zZWQg
dG8gYmUgc3BlY2lmaWVkIGFzICIoTkFORGMgYmFzZSAtIEJBTSBiYXNlKQoKU2FtZSBoZXJlLgoK
PiArIHJlZ19vZmYiLiBTaW5jZSwgdGhlIEJBTSBjb250cm9sbGVyIGV4cGVjdGluZyB0aGUgdmFs
dWUgaW4gdGhlIGZvcm0gb2YKPiAiTkFORGMgYmFzZSAtIEJBTSBiYXNlIiwgc28gdGhhdCBhZGRl
ZCBhIG5ldyBmaWVsZCAnYmFtX29mZnNldCcgaW4gdGhlIE5BTkQKPiBwcm9wZXJ0aWVzIHN0cnVj
dHVyZSBhbmQgdXNlIGl0IHdoaWxlIHByZXBhcmluZyB0aGUgY29tbWFuZCBkZXNjcmlwdG9yLgo+
IAo+IFByZXZpb3VzbHksIHRoZSBkcml2ZXIgd2FzIHNwZWNpZnlpbmcgdGhlIE5BTkRjIGJhc2Ug
YWRkcmVzcyBpbiB0aGUgQkFNCj4gY29tbWFuZCBkZXNjcmlwdG9yLgo+IAo+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDhkNmI2ZDdlMTM1ZSAoIm10ZDogbmFuZDogcWNvbTog
c3VwcG9ydCBmb3IgY29tbWFuZCBkZXNjcmlwdG9yIGZvcm1hdGlvbiIpCj4gVGVzdGVkLWJ5OiBM
YWtzaG1pIFNvd2phbnlhIEQgPHF1aWNfbGFrc2RAcXVpY2luYy5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+CgpSZXZpZXdlZC1ieTog
TWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4K
Ci0gTWFuaQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jICAgICAgIHwg
OCArKysrLS0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgICAgfCA0ICsr
KysKPiAgZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYyAgICAgICAgIHwgMSArCj4gIGluY2x1
ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaCB8IDQgKy0tLQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24uYyBiL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21t
b24uYwo+IGluZGV4IGUwZWQyNWI1YWZlYS4uNGRjNGQ2NWU3ZDMyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcXBp
Y19jb21tb24uYwo+IEBAIC0yMzYsMjEgKzIzNiwyMSBAQCBpbnQgcWNvbV9wcmVwX2JhbV9kbWFf
ZGVzY19jbWQoc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYywgYm9vbCByZWFkLAo+
ICAJaW50IGksIHJldDsKPiAgCXN0cnVjdCBiYW1fY21kX2VsZW1lbnQgKmJhbV9jZV9idWZmZXI7
Cj4gIAlzdHJ1Y3QgYmFtX3RyYW5zYWN0aW9uICpiYW1fdHhuID0gbmFuZGMtPmJhbV90eG47Cj4g
Kwl1MzIgb2Zmc2V0Owo+ICAKPiAgCWJhbV9jZV9idWZmZXIgPSAmYmFtX3R4bi0+YmFtX2NlW2Jh
bV90eG4tPmJhbV9jZV9wb3NdOwo+ICAKPiAgCS8qIGZpbGwgdGhlIGNvbW1hbmQgZGVzYyAqLwo+
ICAJZm9yIChpID0gMDsgaSA8IHNpemU7IGkrKykgewo+ICsJCW9mZnNldCA9IG5hbmRjLT5wcm9w
cy0+YmFtX29mZnNldCArIHJlZ19vZmYgKyA0ICogaTsKPiAgCQlpZiAocmVhZCkKPiAgCQkJYmFt
X3ByZXBfY2UoJmJhbV9jZV9idWZmZXJbaV0sCj4gLQkJCQkgICAgbmFuZGNfcmVnX3BoeXMobmFu
ZGMsIHJlZ19vZmYgKyA0ICogaSksCj4gLQkJCQkgICAgQkFNX1JFQURfQ09NTUFORCwKPiArCQkJ
CSAgICBvZmZzZXQsIEJBTV9SRUFEX0NPTU1BTkQsCj4gIAkJCQkgICAgcmVnX2J1Zl9kbWFfYWRk
cihuYW5kYywKPiAgCQkJCQkJICAgICAoX19sZTMyICopdmFkZHIgKyBpKSk7Cj4gIAkJZWxzZQo+
ICAJCQliYW1fcHJlcF9jZV9sZTMyKCZiYW1fY2VfYnVmZmVyW2ldLAo+IC0JCQkJCSBuYW5kY19y
ZWdfcGh5cyhuYW5kYywgcmVnX29mZiArIDQgKiBpKSwKPiAtCQkJCQkgQkFNX1dSSVRFX0NPTU1B
TkQsCj4gKwkJCQkJIG9mZnNldCwgQkFNX1dSSVRFX0NPTU1BTkQsCj4gIAkJCQkJICooKF9fbGUz
MiAqKXZhZGRyICsgaSkpOwo+ICAJfQo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4g
aW5kZXggNWVhYTBiZTM2N2NkLi5lZjJkZDE1OGNhMzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jCj4gQEAgLTIzNjAsNiArMjM2MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcWNv
bV9uYW5kY19wcm9wcyBpcHE4MDZ4X25hbmRjX3Byb3BzID0gewo+ICAJLnN1cHBvcnRzX2JhbSA9
IGZhbHNlLAo+ICAJLnVzZV9jb2Rld29yZF9maXh1cCA9IHRydWUsCj4gIAkuZGV2X2NtZF9yZWdf
c3RhcnQgPSAweDAsCj4gKwkuYmFtX29mZnNldCA9IDB4MzAwMDAsCj4gIH07Cj4gIAo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMgaXBxNDAxOV9uYW5kY19wcm9wcyA9IHsK
PiBAQCAtMjM2Nyw2ICsyMzY4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3By
b3BzIGlwcTQwMTlfbmFuZGNfcHJvcHMgPSB7Cj4gIAkuc3VwcG9ydHNfYmFtID0gdHJ1ZSwKPiAg
CS5uYW5kY19wYXJ0X29mX3FwaWMgPSB0cnVlLAo+ICAJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHgw
LAo+ICsJLmJhbV9vZmZzZXQgPSAweDMwMDAwLAo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTgwNzRfbmFuZGNfcHJvcHMgPSB7Cj4gQEAgLTIzNzQs
NiArMjM3Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcWNvbV9uYW5kY19wcm9wcyBpcHE4MDc0
X25hbmRjX3Byb3BzID0gewo+ICAJLnN1cHBvcnRzX2JhbSA9IHRydWUsCj4gIAkubmFuZGNfcGFy
dF9vZl9xcGljID0gdHJ1ZSwKPiAgCS5kZXZfY21kX3JlZ19zdGFydCA9IDB4NzAwMCwKPiArCS5i
YW1fb2Zmc2V0ID0gMHgzMDAwMCwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcWNv
bV9uYW5kY19wcm9wcyBzZHg1NV9uYW5kY19wcm9wcyA9IHsKPiBAQCAtMjM4Miw2ICsyMzg1LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIHNkeDU1X25hbmRjX3Byb3Bz
ID0gewo+ICAJLm5hbmRjX3BhcnRfb2ZfcXBpYyA9IHRydWUsCj4gIAkucXBpY192ZXJzaW9uMiA9
IHRydWUsCj4gIAkuZGV2X2NtZF9yZWdfc3RhcnQgPSAweDcwMDAsCj4gKwkuYmFtX29mZnNldCA9
IDB4MzAwMDAsCj4gIH07Cj4gIAo+ICAvKgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGkt
cXBpYy1zbmFuZC5jIGIvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+IGluZGV4IGEyYWY3
MzEwNDlkNC4uODljNzc0YmY4NWE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1xcGlj
LXNuYW5kLmMKPiArKysgYi9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gQEAgLTE2MDUs
NiArMTYwNSw3IEBAIHN0YXRpYyB2b2lkIHFjb21fc3BpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3Bz
IGlwcTk1NzRfc25hbmRjX3Byb3BzID0gewo+ICAJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHg3MDAw
LAo+ICsJLmJhbV9vZmZzZXQgPSAweDMwMDAwLAo+ICAJLnN1cHBvcnRzX2JhbSA9IHRydWUsCj4g
IH07Cj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9u
LmggYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmgKPiBpbmRleCBjZDcxNzJl
NmMxYmIuLmU4NDYyZGVkYTZkYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9uYW5k
LXFwaWMtY29tbW9uLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9u
LmgKPiBAQCAtMTk5LDkgKzE5OSw2IEBACj4gICAqLwo+ICAjZGVmaW5lIGRldl9jbWRfcmVnX2Fk
ZHIobmFuZGMsIHJlZykgKChuYW5kYyktPnByb3BzLT5kZXZfY21kX3JlZ19zdGFydCArIChyZWcp
KQo+ICAKPiAtLyogUmV0dXJucyB0aGUgTkFORCByZWdpc3RlciBwaHlzaWNhbCBhZGRyZXNzICov
Cj4gLSNkZWZpbmUgbmFuZGNfcmVnX3BoeXMoY2hpcCwgb2Zmc2V0KSAoKGNoaXApLT5iYXNlX3Bo
eXMgKyAob2Zmc2V0KSkKPiAtCj4gIC8qIFJldHVybnMgdGhlIGRtYSBhZGRyZXNzIGZvciByZWcg
cmVhZCBidWZmZXIgKi8KPiAgI2RlZmluZSByZWdfYnVmX2RtYV9hZGRyKGNoaXAsIHZhZGRyKSBc
Cj4gIAkoKGNoaXApLT5yZWdfcmVhZF9kbWEgKyBcCj4gQEAgLTQ1NCw2ICs0NTEsNyBAQCBzdHJ1
Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgewo+ICBzdHJ1Y3QgcWNvbV9uYW5kY19wcm9wcyB7Cj4g
IAl1MzIgZWNjX21vZGVzOwo+ICAJdTMyIGRldl9jbWRfcmVnX3N0YXJ0Owo+ICsJdTMyIGJhbV9v
ZmZzZXQ7Cj4gIAlib29sIHN1cHBvcnRzX2JhbTsKPiAgCWJvb2wgbmFuZGNfcGFydF9vZl9xcGlj
Owo+ICAJYm9vbCBxcGljX3ZlcnNpb24yOwo+IC0tIAo+IDIuMzQuMQo+IAoKLS0gCuCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
