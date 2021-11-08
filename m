Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A6EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 11:05:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E105161242
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 11:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E105161242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVT2DX8uiocNAffrxB+ShIxNUS2EfGTjuMDpZLo/pes=; b=1T5pDjk45M37Qa
	7lQ3sd3d5U3pVUa52xlNVif4jONPZM1nsZflPlVjMCss2iiIbtu96Hhh8+DEPTo2Rwker4EgOa5rm
	ZMeLKg8NMedjlyKDFHLYnWN5XFqnHYGtF4xVQjCZ8toTRz/D4EO2EmqdAqJHvmZGz9zhg5Vjs41MF
	TP9iux2CBATc7KTWU/FuoqqAJ1eLiii+fWn3waEujzk7McMl9M+bcnRxqDnut8Ejw3Typhg/I6E3y
	dNRxRvRTapCnjVPK3tC5AfeEOUNbtICQea1P5YDyQApJDCq+0/hTsFMD3nDYzP+KidLGrhgngh0gn
	Y5x7rQto7mGFHBvJoO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk2SB-00GDyh-U8; Mon, 08 Nov 2021 11:04:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk2S9-00GDxI-38
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 11:04:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id n29so14407087wra.11
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 03:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=at7QYPQleIMyEEiP1lZWrA5vbZFNe1ByBa3JnUgvYTI=;
 b=FPH5lEqXwqlOdS3lvEYdwU26USTg3AEjZSimrTz1xHhQrSKichFIylk7o9x/NHKuBA
 qreJo9Ey7fEuHTO2q7KjgQJ60W1tmR666UJY0uakKru4yMWHw7//3dXQGLyAFZYwHqPB
 v4+Rcac6ESMS7NqmuvS6/nevgAO0AEeAmVi4g4pSy+3d4MAfKyy8sJSasrjOwi6Yvfhl
 Yv2BkLhtEmjJZGwOBvVmFQNqnXe0t9GbebqG3rL79ktLUffsdixSm8ra6jQJMocCLBPO
 3fzjfRNlz83kQn5BK+QHhVkhZF2Dv9lGldQGZDMqUX+ecg8lkbBkdvPzH+5oLyvn2O2k
 WlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=at7QYPQleIMyEEiP1lZWrA5vbZFNe1ByBa3JnUgvYTI=;
 b=g/0DRUuCGdGc+Ha66Zj3jMEVvdojCPx3fLUi0el3r06RuIVGecnRs5AUv/L24UvOaR
 Cuhu3jH60rkd9wTQ7IDpy20rggYxojk4nN/n3ZRodKZx0spy1qj+glNy2/mAuISBm1Ha
 z1AnyVrfvttxvGZ5o03k5QPV7wLR05SqIOhZeoRmNmqj4nJhCOFNlSXN5vd9zDZMxNK5
 QHPtUM7r0zwxuXSd5sZ14ZtAUxqkgnXkX4MnLI1b0vIk0/PolsPGWQXc02IYIuiJA2ML
 SGOzY02V9LigwXQjPpJjZHC00PV11IBgvzL99XfjImZxJFkKI09OnPG5OspOqoeB6aOB
 V8yA==
X-Gm-Message-State: AOAM5311GU55wqLpCxVsIKWYlvo120RgIZSb31QBVHiRQssoJtfkEaAv
 DzbKsrJAVGWLa5C+PJdjLfztkw==
X-Google-Smtp-Source: ABdhPJxIfD+/oLL8LVP2PucEMUp/d5K/YpD0mOO8GuwyEaidcy7PY+TFfSS5H5IeiitZm+5gCyvSmg==
X-Received: by 2002:adf:f60e:: with SMTP id t14mr43363396wrp.112.1636369478423; 
 Mon, 08 Nov 2021 03:04:38 -0800 (PST)
Received: from google.com ([95.148.6.174])
 by smtp.gmail.com with ESMTPSA id g13sm14916391wmk.37.2021.11.08.03.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 03:04:38 -0800 (PST)
Date: Mon, 8 Nov 2021 11:04:31 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Kumaravel.Thiagarajan@microchip.com
Cc: Pragash.Mangalapandian@microchip.com, Sundararaman.H@microchip.com,
 axboe@kernel.dk, linux-block@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YYkEP62JRb4rCuXQ@google.com>
References: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_030441_192590_8CD4607E 
X-CRM114-Status: GOOD (  18.73  )
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

T24gTW9uLCAwOCBOb3YgMjAyMSwgS3VtYXJhdmVsLlRoaWFnYXJhamFuQG1pY3JvY2hpcC5jb20g
d3JvdGU6Cgo+IERlYXIgTGVlIEpvbmVzLAo+IAo+IEkgYW0gS3VtYXJhdmVsIFRoaWFnYXJhamFu
IGZyb20gTWljcm9jaGlwLCBJbmRpYSBhbmQgSSBhbSBuZXcgdG8gTGludXggS2VybmVsIGRldmVs
b3BtZW50Lgo+IAo+IEkgYW0gY3VycmVudGx5IHdvcmtpbmcgb24gbGludXgga2VybmVsIGRyaXZl
ciBmb3Igb25lIG9mIG91ciBQQ0llIGJhc2VkIGRldmljZXMgd2hvc2UgQkFSIDAgbWFwcyBpbnRl
cmZhY2UgcmVnaXN0ZXJzIGZvciBhIGdwaW8gY29udHJvbGxlciwgYW4gT1RQIG1lbW9yeSBkZXZp
Y2UgY29udHJvbGxlciBhbmQgYW4gRUVQUk9NIGRldmljZSBjb250cm9sbGVyIGludG8gdGhlIGhv
c3QgcHJvY2Vzc29yJ3MgbWVtb3J5IHNwYWNlLgo+IAo+IEJhc2VkIG9uIGVhcmxpZXIgaW5wdXRz
IGZyb20gTGludXMgV2FsbGVpaiwgSSBoYXZlIGRldmVsb3BlZCB0aGlzIGFzIGEgbXVsdGktZnVu
Y3Rpb24gZGV2aWNlIGRyaXZlciAtIEZpcnN0IE1GRCBkcml2ZXIgKGRyaXZlcnMvbWZkKSBnZXRz
IGxvYWRlZCBmb3IgdGhlIFBDSWUgZGV2aWNlIGFuZCB0aGVuIGl0IHNwYXducyB0d28gY2hpbGQg
ZGV2aWNlcyBmb3IgT1RQL0VFUFJPTSBhbmQgR1BJTyBzZXBhcmF0ZWx5LgoKWW91IG1heSB3aXNo
IHRvIHNwZWFrIHdpdGggR3JlZyBhYm91dCB5b3VyIGFyY2hpdGVjdHVyYWwgZGVjaXNpb25zLgoK
SGUgdXN1YWxseSBkaXNsaWtlcyB0aGUgY3JlYXRpb24gb2YgcGxhdGZvcm0gZGV2aWNlcyBmcm9t
IFBDSSBvbmVzLgoKPiBJIGhhdmUgZm91ciBuZXcgZmlsZXMgaW4gbXkgbG9jYWwgbGludXggc291
cmNlIHRyZWUgYXMgYmVsb3cgZm9yIGNvbW11bml0eSBzdWJtaXNzaW9uLgo+IAo+IDEuIG1jaHBf
cGNpMXh4eHhfZ3AuaCB1bmRlciBpbmNsdWRlL2xpbnV4L21mZAo+IDIuIG1jaHBfcGNpMXh4eHhf
Z3AuYyB1bmRlciBkcml2ZXJzL21mZAo+IDMuIG1jaHBfcGNpMXh4eHhfZ3Bpby5jIHVuZGVyIGRy
aXZlcnMvZ3Bpbwo+IDQuIG1jaHBfcGNpMXh4eHhfIG90cGUycC5jIHVuZGVyIGRyaXZlcnMvbXRk
L2RldmljZXMKPiAKPiBJIGhhdmUgYSBkb3VidCB3aXRoIHRoZSBsb2NhdGlvbiBvZiB0aGUgZm91
cnRoIGZpbGUgZm9yIHRoZSBmb2xsb3dpbmcgcmVhc29ucy4KPiAKPiAxLiBJIGhhdmUgdmlzdWFs
aXplZCBhbmQgYXJjaGl0ZWN0ZWQgdGhlIE9UUCBhbmQgRUVQUk9NIG1lbW9yaWVzIG9mIG15IGRl
dmljZSBhcyBpbmRpdmlkdWFsIGJsb2NrIGRldmljZXMgc28gdGhhdCBJIGFtIGFibGUgdG8gdXNl
IHRoZSBsaW51eCBkZCBjb21tYW5kIHRvIHByb2dyYW0gdGhlc2UgbWVtb3JpZXMgZnJvbSBhIGJp
bmFyeSBmaWxlIGRpcmVjdGx5IG9yIGVkaXQgdGhlbSBkaXJlY3RseSB1c2luZyBhcHBsaWNhdGlv
bnMgbGlrZSBoZXhlZGl0LCBib3RoIG9mIHdoaWNoIEkgYW0gYWJsZSB0byBkby4KPiAyLiBUaGVz
ZSBvbmx5IGxvb2sgbW9yZSBsaWtlIGJsb2NrIGRldmljZXMgdG8gbWUgYW5kIG5vdCBNVEQgZGV2
aWNlcyAob25seSB3cml0ZXMgYW5kIHJlYWRzIGFyZSBwb3NzaWJsZSBhbmQgbm90IGVyYXNlKS4K
PiAKPiBDYW4gSSBtb3ZlIHRoZSBmb3VydGggZmlsZSBkaXJlY3RseSB1bmRlciBkcml2ZXJzL2Js
b2NrIG9yIHNob3VsZCB0aGVyZSBiZSBhIG5ldyBzdWIgZGlyZWN0b3J5IHVuZGVyIGRyaXZlcnMv
YmxvY2sgb3IgbGVhdmUgaXQgYXMgc3VjaCB1bmRlciBkcml2ZXJzL210ZC9kZXZpY2VzID8KClRo
b3NlIGFyZSBxdWVzdGlvbnMgZm9yIHRoZSBNVEQvQmxvY2sgTWFpbnRhaW5lcnMuCgpJJ3ZlIENj
J2VkIGFsbCBvZiB0aGUgcmVsZXZhbnQgcGFydGllcyBmb3IgeW91LgoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
