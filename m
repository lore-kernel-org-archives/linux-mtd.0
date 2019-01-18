Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35E1C07EBF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 20:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4D52086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 20:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TouNJrol";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YL8wOIyJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4D52086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G1bf4spLCeqAJqclKHks5yZkwy7GCJB7PPsJu+BroXs=; b=TouNJrolgOzHoDV2990l/VH+/
	nvYHWQotB8J4RtllcnLdpPZY7yKFknfKzPNrF5snJx2TjcFOgkc8SwCeNq9QpUjvE4fH/dpmMpnMV
	wDxZkjJecSq2JGbgyYqioostv5XY9b7I7CBw/bwiw26NwA8LckbLPgKRtzBfkSnqR+Bh1Xd/ZPYxM
	EjlBGgfRMvtMGvNPZSfLEYBONOz60QgqsCuI2sViE4dXmt9rK1KyvfkFNSyP2nGiyRGybqVLlSRu3
	6D7o6rl/y/dpLxylG5bd5knMizBBBVIcXx1BeSmjGFQHP4+15P0cr5lRDlrUGFnip2FhaSzoSuRUn
	RW9heEOLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkaMP-0007hY-QT; Fri, 18 Jan 2019 20:03:25 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkaMM-0007h8-Dl
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 20:03:23 +0000
Received: by mail-lj1-x22a.google.com with SMTP id v1-v6so12678505ljd.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2019 12:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5tfKl4Fqp8zgrWnKVQ3q9w0oPomwCuiSj0Nbk7y7Fis=;
 b=YL8wOIyJkcUlZ5e8RSQ+R8t1m+l/ix+jV7IADaEvN8w6vknUjER83v0GB5cjX32Oqf
 vVAhVwr0tArayASBV9pFE2+IN5KhZ31n3lPQhe/xN6/0Cb6tn3vGSlBUHVVdmkRuGavW
 YZVbidOzspbYFxdihL1pKOBdYKChUn71OCO0GA+CBIeVUutUJiFfjkHtQQu4Krq1VKgq
 NXTolAHLCmUGU7MVP7KYLVL15UqXtRVIZlj7Qg2reqef8baVdJcyi+FqsNxe0s8w9eNf
 DAvjogEQDNYJo0+tJnuvPLyFWfLjnDbcNFnsg0cTM633Peedq435cPWO/Tkp0XAVzJ7J
 zHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5tfKl4Fqp8zgrWnKVQ3q9w0oPomwCuiSj0Nbk7y7Fis=;
 b=UhhEMwO7qymbgJyOUu6nfyzG0XneqUXORGIrQXzRZJvBT59RJCHWocsFL8IFiePJFe
 hWY/ADerDi1sFR/JJJaH6y1acF8FB4uZfzrjVIsYUBlXodqdGmiCYmFXf+ctaeYKETr8
 CwQUYaKjKrp667O7ZeAct7oPWlh89N3EQnTdn82KsVWaaTwgbvOfXUR/AvkwGfvhpmBI
 h+NFzyrVYu3k8fQYuymcDRqq+Wr09BS4UeCYj6AZm/ZnDcAlozmHaiJRRquxUwPjehFn
 NL7+J0UaGIHZ/9hwA8XBbRCnbYyaeSgJSmWSVighjRhZj5kGIAvBtcRdYi5nr3bErobd
 Ku4A==
X-Gm-Message-State: AJcUukcbsl5l1a2vXkmYxb3dbtbUBhyzzD22o6zhv59lUXTiPfhMpK7X
 +WkLT9+5Ff81HV6LQBIHFugxhO32
X-Google-Smtp-Source: ALg8bN5ibpwcGuwvpAO6f3ELeu+vCLZjtM5ijGNqO6o83JwvUIH+HBgzweoXjgvoAPOaPGpT+Vo//A==
X-Received: by 2002:a2e:8256:: with SMTP id
 j22-v6mr12874465ljh.40.1547841799568; 
 Fri, 18 Jan 2019 12:03:19 -0800 (PST)
Received: from [192.168.75.106] (staticline-31-182-180-253.toya.net.pl.
 [31.182.180.253])
 by smtp.gmail.com with ESMTPSA id j9sm951523lfk.74.2019.01.18.12.03.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 12:03:18 -0800 (PST)
Subject: Re: VIRTIO iface in mtd
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
 <20190117214654.08542c12@bbrezillon>
From: =?UTF-8?Q?Marcin_Krzemi=c5=84ski?= <mar.krzeminski@gmail.com>
Message-ID: <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
Date: Fri, 18 Jan 2019 21:03:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190117214654.08542c12@bbrezillon>
Content-Language: en-AU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_120322_498657_9C9F5739 
X-CRM114-Status: GOOD (  20.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxNy4wMS4yMDE5IDIxOjQ2LCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gK1JpY2hhcmQg
YW5kIE1pcXVlbAo+Cj4gSGkgTWFyY2luLAo+Cj4gT24gVGh1LCAxNyBKYW4gMjAxOSAyMToxNjox
OSArMDEwMAo+IE1hcmNpbiBLcnplbWnFhHNraSA8bWFyLmtyemVtaW5za2lAZ21haWwuY29tPiB3
cm90ZToKPgo+PiBIZWxsbywKPj4KPj4gcmVjZW50bHkgSSBoYXZlIHNwb2tlbiB3aXRoIEJvcmlz
IHJlZ2FyZGluZyBuZXcgTVREIGRyaXZlcgo+PiB0aGF0IHdpbGwgdXNlIFZJUlRJTyBpbnRlcmZh
Y2UgdG8gY29tbXVuaWNhdGUgd2l0aCBRZW11Lgo+PiBUbyBzcGVjaWZ5IGhvdyBzaG91bGQgdGhp
cyBsb29rIGxpa2UgZXhhY3RseSBJIGFtIGJyaW5naW5nIHRoZSB0b3BpYwo+PiBvbiBNTC4KPiBU
aGFua3MgZm9yIHN0YXJ0aW5nIHRoaXMgZGlzY3Vzc2lvbi4KTnAgOikKPgo+PiBNeSB1bmRlcnN0
YW5kaW5nIGlzIHRoYXQgdGhpcyBkcml2ZXIgd2lsbCB1c2UgVklSVElPIHRvIGNvbW11bmljYXRl
Cj4+IHdpdGggUWVtdS4gRnJvbSBRZW11IHNpZGUgYXQgdGhlIGVuZCB0aGVyZSB3aWxsIGJlIGEg
ZmlsZSB0aGF0IHdpbGwKPj4gc2ltdWxhdGUgTkFORC9OT1IuIElzIGl0IGNvcnJlY3Q/Cj4gVGhh
dCdzIG15IHVuZGVyc3RhbmRpbmcsIGJ1dCBJJ20gbm90IHJlYWxseSBhIHZpcnRpbyBvciBxZW11
IGV4cGVydCBzbwo+IEkgbWlnaHQgYmUgd3JvbmcuCj4KPj4gV2hhdCB1c2UgY2FzZXMgZG8geW91
IGhhdmUgaW4gbWluZCBmb3IgdGhpcz8KPiBJIGhhdmUgb25lIGluIG1pbmQ6IHNpbXVsYXRlIE5B
TkQgKGluIHBhcnRpY3VsYXIgTUxDIE5BTkQpIGJlaGF2aW9yIGluCj4gYSBwc2V1ZG8tcmVhbGlz
dGljIHdheSB0byB2YWxpZGF0ZSBVQkkvVUJJRlMgY29kZSAob3IgYW55IG90aGVyCj4gRlMvd2Vh
ci1sZXZlbGluZy9GVEwgY29kZSkgd2UgbWlnaHQgd2FudCB0byB1c2Ugb24gdG9wIG9mIHN1Y2gg
ZGV2aWNlcwpJbiB0aGlzIHBsYWNlIG15IHF1ZXN0aW9uIGlzIHdoYXQgd2UgcmVtb3ZlIGZyb20g
ZW11bGF0aW9uPwpJIHVuZGVyc3RhbmQgdGhhdCBjb21tdW5pY2F0aW9uIGxheWVyIGlzIHJlbW92
ZWQsIGhvd2V2ZXIgY29tbXVuaWNhdGlvbiAKcHJvdG9jb2wKbmVlZCB0IG8gc3RheT8gRWcuIGJl
Y2F1c2UgTkFORCBhbmQgT09CLgoKPgo+IEknZCBhbHNvIGxpa2UgdG8gcmVwbGFjZSBuYW5kc2lt
IGJ5IHRoaXMgZW11bGF0aW9uIGFwcHJvYWNoLiBJbmRlZWQsCj4gbmFuZHNpbSBpcyBlbXVsYXRp
bmcgdGhlIHBhcmFsbGVsIE5BTkQgcHJvdG9jb2wgbW9yZSB0aGFuIGFueXRoaW5nCj4gZWxzZSwg
d2hpY2ggd2UgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgdW5sZXNzIHdlIG5lZWQgdG8gdGVzdCB0
aGUgcmF3Cj4gTkFORCBmcmFtZXdvcmsgKGFuZCBJIHRoaW5rIHRoZXJlIGFyZSBiZXR0ZXIgc29s
dXRpb25zIHRvIGRvIHRoYXQpLiBPbgo+IHRoZSBvdGhlciBoYW5kLCBiZWNhdXNlIG5hbmRzaW0g
dHJpZXMgdG8gdXNlIHRoZSBmdWxsIHJhdyBOQU5EIHN0YWNrLAo+IGl0J3Mgb2Z0ZW4gaGFyZCB0
byBlbXVsYXRlIHJlYWwgZGV2aWNlcyAoSUQtYmFzZWQgZGV0ZWN0aW9uIGRvZXMgbm90Cj4gd29y
ayBmb3IgT05GSS9KRURFQyBjb21wYXRpYmxlIGRldmljZXMpLiBBbGwgb2YgdGhpcyBtYWtlcyBu
YW5kc2ltIGEKPiBwb29yIGNob2ljZSB3aGVuIHRoZSB1c2VyIHdhbnRzIHRvIGVtdWxhdGUgYSBO
QU5EIGRldmljZSB0byBkbwo+IHBvc3QtbW9ydGVtIGFuYWx5c2lzIHVzaW5nIGEgTkFORCBkdW1w
LgpUaGlzIEkgbmVlZCB0byB1bmRlcnN0YW5kIGJldHRlci4gSWYgd2UgZWcuIGhhdmUgTkFORCBk
dW1wLCBkbyB3ZSBjYXJlIAp3aXRoIE9PQiBvciBFQ0MsCm9yIG5vdD8KCkF0IHRoZSBlbmQgSSBh
bHNvIG5lZWQgdG8gYWRkLCB0aGF0IEkgdW5kZXJzdGFuZCBOT1IgZGV2aWNlcywgYnV0IAp1bmZv
cnR1bmF0ZWx5CkkgaGF2ZSBsb3cgZXhwZXJpZW5jZSB3aXRoIE5BTkRzLiBUaGlzIGNvdWxkIGxl
YWQgdG8gc29tZSBtaXN1bmRlcnN0YW5kcyA6KAoKVGhhbmtzLApNYXJjaW4KPgo+IFJpY2hhcmQg
cHJvYmFibHkgYSBmZXcgbW9yZSB1c2UgY2FzZXMgOy0pLgo+Cj4gUmVnYXJkcywKPgo+IEJvcmlz
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
