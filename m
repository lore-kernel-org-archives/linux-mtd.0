Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4650CC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiEVeQ9g4s1ycZdddCLHaPR3jmFIWMVRQDCfXcbVAh4=; b=uaR3uLZxFrTamH
	i1iCtkzq3xuPfZoeWQ2vr18N2mL5KVjOIh5ab33htb8LiORbuPg9ghAK6XK3lOzkJiZ64XbyiYKxz
	QRWK1xek/kLwyaFf1X3O41+W24Dt6kITkLDmALpdJCezOqLjTuqrTPu9CMqkpROKG0Rgd5Ec/4QAG
	OoyPPyUMeyz2n+37tpUdalK1vm9OMko//p/zeYRm9e7iHk2Ext4qdojSS9kJFUnWvLS24wC4rT7fr
	byzn8RKm7G6B/QGx45wM8qdovq0bZHSIBvDCGLU67mUHCADJAhvzTcCkevvLn6Se7Bh7BH1Zsdt4O
	Wcd3vb3kVTX/DE/Y+kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1LH-00DYJD-T6; Wed, 05 Oct 2022 10:09:31 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1LF-00DYGy-8r
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 10:09:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id k2so4434775ejr.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Oct 2022 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
        b=14U7AJwniruZFzbiY4kC6nsZlRvuSqb1QwTnO87x+fRvRhg52kqE3PLwic1cv6UI+b
         wxtaRyO+WZozOGf88hqNDIS0d8kGRHu94b0rcdjOrBTtNpMPKnxQUp9fyDFQVv1p4lwT
         9oAVJcqYseFceKxqgBWeZoSLo0DTN9Gz10LmFz2RpAA6luRa1gTkoumLHyuNtsjb23R3
         66037Fgcf54ctnyPbt6chWKdOLNMSKtWOPcxoIwbnX5WXyAom4hZa4oyF9nXf24bWT0P
         K9lw1zG3qgaRtbZiESDdnst2UoGyEh+WJg9WXPuCoOF4o8xgJN6xITBbcoTm7hcV1syU
         KUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
        b=Q6agufZBhWDLoPKDCYRzW+wL1tGH6VU5emDUAY2EvVD8p3Tai2U++6m09X9shPuSs6
         PvCqMzUX301dUXtwv26muQSogXl+2rnTxUx/n7EdIOtKSchs1QQThiEHMwgOripJuDcs
         KdP6iNt1qT9VOr9YD4M2FC6t0cRqgNhsxv71id9IGCw0r8GaanfbVmGAOdtluGJLpBr5
         hFhBq5mY8MTM8VheV7uQzNMlp82Xj7sWptCVGLObwV8S4gno3criWNvuw4rKNd05R7SC
         XXHr+E1wY5ltCZ+Kn8MPdTWDMjhg37p+Er8Gi0zLF8rwF45oRxm5TSyjEOUBNHcRawv4
         5n2w==
X-Gm-Message-State: ACrzQf2PwPBqbHxrAhv/BR1BDjDqxHq9MyhfWEynFMtA/U76izwBm1l4
	25PSgyGpHw36bffKdNCWVuyF/Q==
X-Google-Smtp-Source: AMsMyM6XbFaI9HeMTnZcx9bHunTFZSA7fhJuT5NL+agaUKW54kA1JC5km35OuPCP5GklKV/YoQTu8A==
X-Received: by 2002:a17:907:1c08:b0:782:a340:56d7 with SMTP id nc8-20020a1709071c0800b00782a34056d7mr22357872ejc.98.1664964563179;
        Wed, 05 Oct 2022 03:09:23 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709061baa00b00782539a02absm8398012ejg.194.2022.10.05.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 03:09:22 -0700 (PDT)
Message-ID: <e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com>
Date: Wed, 5 Oct 2022 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH 05/18] drbd: use init disk helper
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: ogeert@linux-m68k.org, linux-block@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, axboe@kernel.dk, philipp.reisner@linbit.com,
 lars.ellenberg@linbit.com, efremov@linux.com, josef@toxicpanda.com,
 tim@cyberelk.net, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 mcgrof@kernel.org, hare@suse.de, damien.lemoal@opensource.wdc.com,
 johannes.thumshirn@wdc.com, bvanassche@acm.org, ming.lei@redhat.com,
 vincent.fu@samsung.com, shinichiro.kawasaki@wdc.com
References: <20221005050027.39591-1-kch@nvidia.com>
 <20221005050027.39591-6-kch@nvidia.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221005050027.39591-6-kch@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_030929_319524_AF92BBB5 
X-CRM114-Status: GOOD (  15.78  )
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

QW0gMDUuMTAuMjIgdW0gMDc6MDAgc2NocmllYiBDaGFpdGFueWEgS3Vsa2Fybmk6Cj4gQWRkIGFu
ZCB1c2UgdGhlIGhlbHBlciB0byBpbml0aWFsaXplIHRoZSBjb21tb24gZmllbGRzIG9mIHN0cnVj
dCBnZW5kaXNrCj4gc3VjaCBhcyBtYWpvciwgZmlyc3RfbWlub3IsIG1pbm9ycywgZGlza19uYW1l
LCBwcml2YXRlX2RhdGEsIGFuZCBvcHMuCj4gVGhpcyBpbml0aWFsaXphdGlvbiBpcyBzcHJlYWQg
YWxsIG92ZXIgdGhlIGJsb2NrIGRyaXZlcnMuIFRoaXMgYXZvaWRzCj4gY29kZSByZXBldGF0aW9u
IG9mIGluaWFsaXphdGlvbiBjb2RlIG9mIGdlbmRpc2sgaW4gY3VycmVudCBibG9jayBkcml2ZXJz
Cj4gYW5kIGFueSBmdXR1cmUgb25lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3Vs
a2FybmkgPGtjaEBudmlkaWEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9t
YWluLmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4u
YyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+IGluZGV4IGYzZTRkYjE2ZmQwNy4u
NThmYWUxMjJkZTE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4u
Ywo+ICsrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+IEBAIC0yNzA2LDEzICsy
NzA2LDkgQEAgZW51bSBkcmJkX3JldF9jb2RlIGRyYmRfY3JlYXRlX2RldmljZShzdHJ1Y3QgZHJi
ZF9jb25maWdfY29udGV4dCAqYWRtX2N0eCwgdW5zaWcKPiAgCj4gIAlzZXRfZGlza19ybyhkaXNr
LCB0cnVlKTsKPiAgCj4gLQlkaXNrLT5tYWpvciA9IERSQkRfTUFKT1I7Cj4gLQlkaXNrLT5maXJz
dF9taW5vciA9IG1pbm9yOwo+IC0JZGlzay0+bWlub3JzID0gMTsKPiAtCWRpc2stPmZvcHMgPSAm
ZHJiZF9vcHM7Cj4gIAlkaXNrLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwo+ICAJc3ByaW50
ZihkaXNrLT5kaXNrX25hbWUsICJkcmJkJWQiLCBtaW5vcik7Cj4gLQlkaXNrLT5wcml2YXRlX2Rh
dGEgPSBkZXZpY2U7Cj4gKwlpbml0X2Rpc2soZGlzaywgRFJCRF9NQUpPUiwgbWlub3IsIDEsIDAs
IGRldmljZSwgJmRyYmRfb3BzKTsKPiAgCj4gIAlibGtfcXVldWVfZmxhZ19zZXQoUVVFVUVfRkxB
R19TVEFCTEVfV1JJVEVTLCBkaXNrLT5xdWV1ZSk7Cj4gIAlibGtfcXVldWVfd3JpdGVfY2FjaGUo
ZGlzay0+cXVldWUsIHRydWUsIHRydWUpOwoKVGhpcyBub3cgZG9lcyBhIHNldF9jYXBhY2l0eSgu
Li4sIDApLCB3aGljaCBpdCBkaWQgbm90IGRvIGJlZm9yZS4KSSdtIGd1ZXNzaW5nIHRoaXMgZG9l
cyBub3QgaGF2ZSBhbnkgc2lkZSBlZmZlY3RzIGFzIHRoZSBjYXBhY2l0eSBzaG91bGQKYWxyZWFk
eSBiZSBpbml0aWFsaXplZCB0byAwPyBEbyB5b3Uga25vdyB0aGlzIGZvciBzdXJlPwoKLS0gCkNo
cmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1
bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVk
IFN0b3JhZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
