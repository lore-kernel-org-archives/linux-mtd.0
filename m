Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D174CF8850
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEvHzXQuO9pyRpgxBfWZOEkzVE5eHqJfpTeIaL8kWtQ=; b=fn9KuC5ZLkUCfP
	WqczlUm+2lYepsPKZNFOTImfnbGXT2gaS4YHAVawEtuU0x3znWhswHGhTiQpQgbDUD9DfX0dZ1uZU
	ChKttL50kvm03LUM9iyJpNmlnwoFvDRRdn8d04Rk8Pxapb+xRei0ym1u0KxOe2kDoZfiRN9wr0kxf
	HLU7BNJGmD1vxdTimRwb54l09M2O3Sn75dROJOJDc1Nv7lTRF+P8f24tsLFIbzmP1J5JjVskmC8yR
	j/RdMBluqOVHuihPW6hRkXqzukLqke+Gq7gBjvl1OY7UA5LB/SQR20Lr/AOiXHzSVFAD2mtJno+ZF
	05vtctXvpAR9+spyxJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swlqy-0000000DSeD-24Xt;
	Fri, 04 Oct 2024 17:12:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swl4o-0000000DEa6-3mz7
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 16:22:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so2565378e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2024 09:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728058965; x=1728663765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUw7Svd/aGEIiLjbnB81Ko4TPZRdd6H9VfhJ5prWRJs=;
        b=lSKyW+zXrnHfQ/TnlvnROh2VUs9G9/l8orI8mrvBX4bFf8TMQ7fTqbG02/Y18VfSU2
         djZy9SL5eARWqeyu/gwooZOQ0qAE0EHr7ygLIUyLKo1cJJsGCGHwByU1jdaupUcOSrRr
         CQfSSBNzBDIdCTD0YrLn1QoAsrv98ZfNzira5Z0WMYQdECjBABWXBUALeXWWdJEUCQhj
         gPVB+W8uBzT/FleSwyV22cLCMsU6cPPRm1h4zAIfP2eCPD+PsS+BibWCLsBJE5a+rQ1H
         iT8gqKNIk5Ynk9O5kpz9pPxIa9ab6jWiE99g8mgRnyFUKC4C2iEUS/M1sXbTwT1Sr5Y1
         6v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728058965; x=1728663765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUw7Svd/aGEIiLjbnB81Ko4TPZRdd6H9VfhJ5prWRJs=;
        b=q+X9pZJhZqLNseGrrKvAeWMp7vLP91wpmGpE9kN7AKuEoCRqnWL8p7Taw91ZfG9mNZ
         qLnpWeGPu8TIJO2ia+xg24zeVmOncvjvsswdCMZfJOSa8FnEMoyh5oz6/F1HRmLx8N77
         g7W8nmBB8CFBNgC/cE409EH4cZfg0QPCN2/azg2M96BWQJ7tCh1RJv3dSlgTIAq97h/p
         NHf2i1GY1+Zp+IW91JX73CSHF6b82G/aQdOc+GaGq7jrFJyrRRDZ7F2mBNeb01WngP4A
         zAs5plGsnrzyhiYwXviaFCDr2LzIWX4gTCT6QOu8Z9hrL+tSOvtgE7yQKDkABR5JYB2p
         xzRg==
X-Gm-Message-State: AOJu0YxSD5lqv41iZG3GPQbvvb/rN8I7QiU8P+Ocxokc0eepghFJyLiG
	E/oIXjrIoJfzk7Tou3e2m+GUf079by4geZUZS3ZYQ5GL7aBAmANrv/YNsAeJSv+uyIBs3mTPJPR
	YScCnkiJdERukEi94465cSDF9A6Q=
X-Google-Smtp-Source: AGHT+IHzS6ChsWNa74YQ40xSvjV3eZhMCDko9AiWB8J2L29/c4Nmv4CywaF5hvcz5U0Lq6BJ5PXczgDNtYFLAsKe+UU=
X-Received: by 2002:a05:6512:68a:b0:539:9594:b226 with SMTP id
 2adb3069b0e04-539ab88c32emr2496877e87.34.1728058964711; Fri, 04 Oct 2024
 09:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240926141956.2386374-1-alvinzhou.tw@gmail.com>
 <20240926141956.2386374-2-alvinzhou.tw@gmail.com> <28ac1c39-5592-4e5c-8fce-53489e0135ee@linaro.org>
 <CAPhrvRQirexA9QJzBSqjfmPnbnF62-hzg-neQ-cZX2hnkP_Zwg@mail.gmail.com> <890c1926-2778-41e3-bca6-d08a5a493708@linaro.org>
In-Reply-To: <890c1926-2778-41e3-bca6-d08a5a493708@linaro.org>
From: Alvin Zhou <alvinzhou.tw@gmail.com>
Date: Sat, 5 Oct 2024 00:22:26 +0800
Message-ID: <CAPhrvRQrugRQgQcdHBdwid3_sUkCm0mZL9zhz1=TYzXg4qUTfw@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] mtd: spi-nor: add Octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw, 
	AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_092246_977169_9ECB4894 
X-CRM114-Status: GOOD (  18.15  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI05bm0MTDmnIg05pelIOmAseS6lCDkuIvljYg1OjU45a+r6YGT77yaCj4KPgo+Cj4gT24gMTAv
NC8yNCAxMDowNSBBTSwgQWx2aW4gWmhvdSB3cm90ZToKPiA+Pj4gKyAgICAgLyogUmVhZCBmbGFz
aCBJRCB0byBtYWtlIHN1cmUgdGhlIHN3aXRjaCB3YXMgc3VjY2Vzc2Z1bC4gKi8KPiA+Pj4gKyAg
ICAgcmV0ID0gc3BpX25vcl9yZWFkX2lkKG5vciwgNCwgNCwgYnVmLCBTTk9SX1BST1RPXzhfOF84
X0RUUik7Cj4gPj4gY2FuIHdlIHVzZSBub3ItPmFkZHJfbmJ5dGVzIGZvciB0aGUgc2Vjb25kIGFy
Z3VtZW50PyBQbGVhc2UgdGVzdCBhbmQKPiA+PiBjb25maXJtLiBObyBuZWVkIHRvIHJlc2VuZCBm
b3IgdGhpcywganVzdCBjb25maXJtIGFuZCBJIGNhbiBhbWVuZCB3aGVuCj4gPj4gYXBwbHlpbmcu
Cj4gPiBUaGUgZm9sbG93aW5nIGlzIHRoZSBwcm9jZXNzIG9mIHNwaV9ub3Jfc2NhbigpCj4gPiBp
bnQgc3BpX25vcl9zY2FuKC4uLikKPiA+IHsKPiA+IC4uLi4uLgo+ID4gcmV0ID0gc3BpX25vcl9p
bml0X3BhcmFtcyhub3IpOwo+ID4gLi4uLi4uCj4gPiByZXQgPSBzcGlfbm9yX3NldHVwKG5vciwg
aHdjYXBzKTsKPiA+IC4uLi4uLgo+ID4gfQo+ID4gRmlyc3QsIHdpdGhpbiB0aGUgc3BpX25vcl9w
YXJzZV9zZmRwKCkgZnVuY3Rpb24gaW5zaWRlCj4gPiBzcGlfbm9yX2luaXRfcGFyYW1zKCk6IG5v
ci0+cGFyYW1zLT5hZGRyX25ieXRlcyBpcyBzZXQgYmFzZWQgb24gdGhlCj4gPiBTRkRQLCB3aGls
ZSBub3ItPmFkZHJfbmJ5dGVzIGlzIG5vdCBhdmFpbGFibGUuIFRoZXJlZm9yZSwgdGhlIHNlY29u
ZAo+ID4gYXJndW1lbnQgY2Fubm90IHVzZSBub3ItPmFkZHJfbmJ5dGVzIGJ1dCBjYW4gdXNlCj4g
PiBub3ItPnBhcmFtcy0+YWRkcl9uYnl0ZXMuIEFkZGl0aW9uYWxseSwgRm9yIE1hY3Jvbml4IE9j
dGFsIE5PUiBGbGFzaAo+Cj4KPiBub3ItPmFkZHJfbmJ5dGVzIGlzIHNldCBpbiBzcGlfbm9yX3Nl
dHVwKCkuCj4gc3BpX25vcl9zZXRfb2N0YWxfZHRyKCkgaXMgY2FsbGVkIGFmdGVyIHNwaV9ub3Jf
c2V0dXAoKSwgdGh1cyB5b3UgY2FuCj4gdXNlIG5vci0+YWRkcl9uYnl0ZXMuCgpJIGFwb2xvZ2l6
ZSBmb3IgdGhlIG1pc3VuZGVyc3RhbmRpbmcuIFRoYW5rcyBmb3IgeW91ciBjbGFyaWZpY2F0aW9u
LiBTbwp1c2luZyBub3ItPmFkZHJfbmJ5dGVzIGFzIHRoZSBzZWNvbmQgYXJndW1lbnQgaXMgbm90
IGEgcHJvYmxlbS4gSQpoYXZlIHZlcmlmaWVkLCB0aGFua3MhCj4KPiA+IGluIE9jdGFsIEREUiBt
b2RlLCBib3RoIHRoZSBhZGRyZXNzIGFuZCBkdW1teSBjeWNsZXMgYXJlIGZpeGVkIGF0IDQKPiA+
IGluIFJFQURJRCwgc28gc2V0dGluZyB0aGUgc2Vjb25kIGFuZCB0aGlyZCBhcmd1bWVudCB0byA0
IGlzIGFsc28gdmFsaWQuCj4KPiBidXQgd2UgZG9uJ3Qgd2FudCBtYWdpYyBudW1iZXJzIG9yIHN0
YXRlcyB0aGF0IGFyZSBub3QgdHJhY2tlZCwgc28gdXNlCj4gdGhlIHBhcmFtZXRlcnMgc2V0Cj4K
PiA+IE1vcmVvdmVyLCBub3ItPmFkZHJfbmJ5dGVzIGlzIHNldCB3aXRoaW4gdGhlIHNwaV9ub3Jf
c2V0dXAoKSBmdW5jdGlvbi4KPgo+IHllcCwgdXNlIGl0IHRoZW4uCgpUaGFua3MsCkFsdmluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
