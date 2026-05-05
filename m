Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B809FF885A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 08:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MP3xtUsGoCfw4fQrGbq4jP4iISsBrIvXs6JQdwFBaSQ=; b=KZfPPipd/lYr/z
	Ma5PsMtIAFodQxJbVWoCxRbJCpqv1ZAIQcBtwGTHN4eXKB1WhbXRVYvJS8EXlAVVUQt+xfzHxAtYy
	7tbeSlrLEhGEMksjWSc1k7LbCmUFqh11DVe4RCRVDNk5Unbravyerk6VXHuFyR2Qz1/KjWBr+iPmP
	j3Z6cb5yi6f/D6+Onx1nPZoiYLw0c4cjFcQs9CSgLLbOtOeCB5CM3IJ6ErJf6WbN35LNQO7D0MK8d
	YjcheVdWX/s1KhP2vsAu9T8mx+R3OHx5hyee6m0CsxIcPw0onSws5XSmV1JzHAt7Z4bPCCmKic+P7
	lKmiib+R5cmMuc3wWuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAvO-0000000FUzY-0Jmz;
	Tue, 05 May 2026 08:14:38 +0000
Received: from mail.rulkc.org ([155.212.184.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAvJ-0000000FUyx-3ZV4
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 08:14:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7874A100669;
	Tue,  5 May 2026 11:14:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rulkc.org; s=dkim;
	t=1777968869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+iLyLh61C8aEZa/2TYtI1k4JIMZds1vZXdM5uMOUSFM=;
	b=TNRZhxNp7qK1DX6RgkPUFaSFaNfFFMP7/HzjVrbxD6UZp2EUusk6z58EGx4wvI+Kp0Nrfl
	sjoXC2eu0+mZLO8T3kbn6Vt4/MAM16diFZdpTm09RVYDVBt8sah4V3vIVIJHXlQLWL7ERY
	fGBJT98+UoeHoYNPeLn4x8pEKwJTJGV7fVtTETRncvuXa5EqhvI0Io3+NTSZP6A0j/6Vua
	Z1VUTSzomr6wBewHgkjWpOlZJ6BC7pi4U/dNYjrsz0EbESHuUZNAlmLfLT7YT0IuMHeKIG
	M8TTn2gDKgzncyb++Kk1DoxTxnROeQpCCjMG/y+UYT+DXUQ8bwDEJYxwf0EzXQ==
Message-ID: <335fad03-6113-4508-b28d-b21c7efcffe6@rulkc.org>
Date: Tue, 5 May 2026 11:14:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
Content-Language: ru
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, rulkc@linuxtesting.org, oxffffaa@gmail.com,
 stable@vger.kernel.org
References: <20260504221012.1310605-1-avkrasnov@rulkc.org>
 <87mryeqoqs.fsf@bootlin.com> <57b0cc2a-6d62-405c-bfa5-68d1c46dbad9@rulkc.org>
 <87h5omqntt.fsf@bootlin.com>
From: Arseniy Krasnov <avkrasnov@rulkc.org>
In-Reply-To: <87h5omqntt.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_011434_425058_5B607475 
X-CRM114-Status: GOOD (  10.45  )
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

CjA1LjA1LjIwMjYgMTE6MTAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gT24gMDUvMDUvMjAyNiBh
dCAxMDo1OToxNiArMDMsIEFyc2VuaXkgS3Jhc25vdiA8YXZrcmFzbm92QHJ1bGtjLm9yZz4gd3Jv
dGU6Cj4KPj4gMDUuMDUuMjAyNiAxMDo1MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpLAo+
Pj4KPj4+IE9uIDA1LzA1LzIwMjYgYXQgMDE6MTA6MTIgKzAzLCBBcnNlbml5IEtyYXNub3YgPGF2
a3Jhc25vdkBydWxrYy5vcmc+IHdyb3RlOgo+Pj4KPj4+IFR3byBpbXBvcnRhbnQgdHlwb3MgaW4g
dGhlIGNvbW1pdCBsb2cgOi0pCj4+Pgo+Pj4+ICdjcycgaGVyZSBtdXN0IGluIHJhbmdlIFswOm5h
bmRkZXZfbnRhcmdldHMpLgo+Pj4gICAgICAgICAgICAgICAgIGJlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgWwo+Pgo+PiBIaSwgc29ycnksIFlvdSBtZWFuPwo+Pgo+Pgo+PiAnY3MnIGhlcmUg
bXVzdCBiZSBpbiByYW5nZSBbMDpuYW5kZGV2X250YXJnZXRzXS7CoAo+IEkgbWVhbnQgWzA6bmFu
ZGRldl9udGFyZ2V0c1sgd2hpY2ggaXMgdGhlIG1hdGhlbWF0aWNhbCB3YXksIElJUkMsIHRvCj4g
aW5kaWNhdGUgdGhhdCB0aGUgbGFzdCB2YWx1ZSBpcyBvdXQgb2Ygc2NvcGUvZXhjbHVkZWQuCj4K
PiBbMDpuYW5kZGV2X250YXJnZXRzXSBtZWFucyB0aGF0IG5hbmRkZXZfbnRhcmdldHMgaXMgaW5j
bHVkZWQgaW4gdGhlCj4gc2NvcGUgb2YgdmFsdWVzIGFuZCBoZXJlIHNpbmNlIHlvdSBhcmUgZXhw
bGljaXRseSBzaG93aW5nIHRoYXQgaXQgaXMKPiBub3QsIGl0IGZlZWxzIHdyb25nIHRvIHVzZSB0
aGF0IGNvbnZlbnRpb24uCgoKQWhoLCBZZXMgSSBzZWUsIGp1c3Qgc21hbGwgbWlzdW5kZXJzdG9v
ZCBpbiBtYXRoIHN5bWJvbHM6CgpJIG1lYW46IFtBOkIpID09IFtBOkJbCgpodHRwczovL3dpa2lt
ZWRpYS5vcmcvYXBpL3Jlc3RfdjEvbWVkaWEvbWF0aC9yZW5kZXIvc3ZnLzA3MTliMWIwOGNkZjY0
OWU3MzVlNmRhYjZkYzczNTVmYTM3YTliMjEKCk9rLCBJJ2xsIHVwZGF0ZSBpdCEKClRoYW5rcyEK
Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
