Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A8DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUaTV3fs6qLQZjDHkHH+SCERJC91g8FVfxQ3mksBJQ8=; b=YFRY9+cEX5WdYw
	rkAM2TEniACJrLV1M6qgtqBp4OWDjLkQl1WE5HTFvRXVn+rTx+gzh89fCZS7bdehPdRosm+16yFNW
	QmfbdpG0u29L8H1JhR/1KSb/WMR5g+HCZBPJgsdydohq/MKMg1wqs5T6T2/l87V75YiLiWlWljwdh
	pMJc6BFElweEmoQdmn7Hhl24RfwteC1kvF/uL26Z++sZitYRnAgGMP2T795o65Tbhg7YNAs/eQn4N
	IIl+7WNGS1XlV8BYMzHckRFPdAbWGbPKW/PJosEVCY9vM7JTpyt8vL+4McbcVifYoS17xNajp0o8P
	na2vTxWjWXOTzZg8dEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgCd-00CcVK-Oo; Mon, 28 Feb 2022 13:36:39 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgCM-00CcPx-Go
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 13:36:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bu29so21513675lfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2022 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:from:to:cc
 :references:in-reply-to:content-transfer-encoding;
 bh=b+imPXxCddpXZIFpYZ77xpkCvuWyABWzWMv3fmpu73w=;
 b=i2ODa45E86m0zct+b7Cy3RbujcYZb0BrNbJF+ghdHJQnkZTRnmKCaD4e+Xt5wjqzXn
 pG602CUIKebB9WyYTFy5ab+OVBN9jzSQ1wz3fNtJ/1/KUzDNCQrkVd97NkSVg5SQJDdh
 naMpHiC252/vwJNvvRnr+bj2tUZbKl4gG1a2posuim1AJXbS0bMvL/UHCZjvpVmRwVnR
 /8JO0lQffDTJ39FBSWlPX8yyS8bOh6b8+h6VwPlwSh2ry+L4Lj3890M/ozM5lYFcoLzS
 GdUJ06EaqFS7rE1cCmDq2QarejH1S/wcstCXPLVD/v+b4KjB9E61FRCdeuICeOs9Kzg0
 NXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=b+imPXxCddpXZIFpYZ77xpkCvuWyABWzWMv3fmpu73w=;
 b=lX+ma8LnDN/A6d0VkPkhHfaku7HzYwMCT2iQRD1sKny1EDZjpmDD8+TpT1pFYgVckr
 OhzauoXqlsuCXNDpSTUpSSyrSpOoU460zc2IXQDs6evgYF+uBHvJw2XowEn3I42JYB/9
 NxPYfXu1W31Wf5/oSkagYyueh/7A13Zr3vxBc2j4vn4OV54KHii2iWHzguaLEkbQ0Gz8
 f1Hqw4FSE3YpSDrqDxW2i5EeHs8ueFFIGri7dcZdszjiC27I1H4lG1RTSB2qT4SLi8vj
 HPTzpZTOh9J+ef+uA0StcgaU2pZlsq9qlmfddmwkPyuJFae2ge34UgCL0gagFr75GEmd
 vxvA==
X-Gm-Message-State: AOAM533cGN6PjdiJw3IFr8B60yQ5H82CwJiwCFBNcziS4L6foOG/4ugz
 /m9q5D/54cpTyeWC4Z0p4qbg6pEzlCI=
X-Google-Smtp-Source: ABdhPJz5gNZZpIWkgW6tFOrkAEuRU1PSvMr+wOEy2TI9fmv8j9tb9xH0iVeUZ/3WItQylyKyePni0w==
X-Received: by 2002:a19:7b17:0:b0:443:e48d:509a with SMTP id
 w23-20020a197b17000000b00443e48d509amr12467673lfc.83.1646055380556; 
 Mon, 28 Feb 2022 05:36:20 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 m4-20020a0565120a8400b004457562b26csm965355lfu.193.2022.02.28.05.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 05:36:20 -0800 (PST)
Message-ID: <fe4444d1-3513-d869-01f2-85add2b8c78a@gmail.com>
Date: Mon, 28 Feb 2022 14:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: ubifs: handling dirty data (writing back) + power cuts
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Cc: "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>
References: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
In-Reply-To: <7bc0ee19-2943-3503-046e-130de73a2cdf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_053622_603686_26338E82 
X-CRM114-Status: GOOD (  11.10  )
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

T24gMjUuMDIuMjAyMiAxNToxNywgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE15IGFjdHVhbCBw
cm9ibGVtIGlzIHJlbGF0ZWQgdG8gdWJpZnMgYmVoYXZpb3VyIGZvciBwb3dlciBjdXRzIGhhcHBl
bmluZwo+IGJldHdlZW4gNSBhbmQgMzUgc2Vjb25kcyBhZnRlciBzYXZpbmcgYSBmaWxlOgo+IGRh
dGUgPiAvbW91bnQvdWJpZnMvdGVzdC50eHQgJiYgc2xlZXAgMTUgJiYgZWNobyBDVVQgUE9XRVIg
Kk5PVyoKPiAKPiBPbiB0aGUgbmV4dCBib290IHRlc3QudHh0IGV4aXN0cyBidXQgaXQncyBFTVBU
WSAoZmlsZSBzaXplIDApLgo+IAo+IEZvciBuZXdseSBjcmVhdGVkIGZpbGVzIGFib3ZlIGJlaGF2
aW91ciBpcyBub3QgdGhlIHdvcnN0IG9uZSAtIGhvd2V2ZXIKPiBJJ2QgZXhwZWN0IHN1Y2ggZmls
ZSB0byBub3QgZXhpc3QgYXQgYWxsLgo+IAo+IFRoZSBiaWdnZXN0IHByb2JsZW0gaXMgd2hlbiBk
ZWFsaW5nIHdpdGggZXhpc3RpbmcgZmlsZXMuIEluIHN1Y2ggY2FzZQo+IHBvd2VyIGN1dCBtZWFu
cyBsb29zaW5nIGl0IGNvbXBsZXRlbHkuIEkgZG9uJ3QgZ2V0ICpvbGQqIGNvbnRlbnQgbm9yCj4g
Km5ldyogY29udGVudC4KClRvIG1ha2UgaXQgY2xlYXIgd2hhdCBJIG1lYW50IGJ5IGRlYWxpbmcg
d2l0aCBleGlzdGluZyBmaWxlczoKCgpbZmlzdCBib290XQoKIyBlY2hvIGZvbyA+IC9tb3VudC91
Ymlmcy90ZXN0LnR4dAojIHN5bmMKIyBjYXQgL21vdW50L3ViaWZzL3Rlc3QudHh0CmZvbwojIGJ1
c3lib3ggc2VkIC1pICdzL2Zvby9iYXIvJyAvbW91bnQvdWJpZnMvdGVzdC50eHQgJiYgc2xlZXAg
MTAgJiYgZWNobyBDVVQgUE9XRVIgTk9XCkNVVCBQT1dFUiBOT1cKCgpbbmV4dCBib290XQoKIyBs
cyAtbCAvbW91bnQvdWJpZnMvdGVzdC50eHQKLXJ3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3Qg
ICAgICAgICAgICAgMCBGZWIgMjggMDI6MjYgL21vdW50L3ViaWZzL3Rlc3QudHh0CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
