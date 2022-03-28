Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BDBC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DS+Q/iftSAm1tBDSlQgSj2FCwZFmpeDA9sA+8Ks6YMw=; b=zB/F80rOxhM+f6
	fuZ/WmKW9anxDhvo6Rl4C+j82yzH2RTT5dZRz49rRI5hi5MNPee5a/RTgm/UlaMX1M+o1ws/flMZx
	AUFqcIEd6E5DyF1+9PNACdt5JmKtHEekjAg5D12l30f7Ph8nz31/l+HAdD6Tpe2Oim/LYVQOuZCoX
	kaAKbaBrLUly1gZznvFK8jCOm176Hz7LGuzL+GOM3SEgqfKltH7QoYjjqm9nmjBDbQzZ7va+ZOvAB
	vyMtq1D47vFXb5652lXWThFTYbpkkVlR8paTo/1dPS9o1xK3OOed1GHSyp263lkNgMe8Cc9VaBeSX
	DlAwsh1z10tf7NJZKT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkkk-007pfy-83; Mon, 28 Mar 2022 08:29:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkka-007pbo-SC
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 08:29:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id w7so23402178lfd.6
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2022 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=PH4S0hpZv2nJLfK5XoEVr3eyCulEi1Dibxcb+U08Za0=;
 b=jSjUsFdIoW6eCf/7inJwdDe6btp5QHLGSfocsIIJW5F49ycSdGmSUvIgCmFZUAnHf6
 8jMG0zHXoIQFj896OztwVikNyKCMGKhM1pSK1ubEpZdyoGn5xW0kQovSa0RHCHoXF4g0
 qh2s0Yf1k/xFz2CDjevwS7gbVXZEMQekfgms6M6rmsIzulzmMxyE61xT06DoMByIVUj7
 XCpzMxVFnym5W6RB1uopIWhJxdSbMsaRvxVl7Ib6uuri+tpCbeqd+2Nj182jBWa1pSA5
 Ds0UzzLZmFEq7XECU//4iOo9Ul/GfdoPIQLA2S01V31fRC6SqwYVwWTHY8Hyq5BeNVcD
 F3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PH4S0hpZv2nJLfK5XoEVr3eyCulEi1Dibxcb+U08Za0=;
 b=rMBNEsJ+Pe34RZqqeaMueaDthoaOQWU/ljWMoAekvcZUfNnJfSzqCbDtc9hgyJy1ZS
 3V3wovWdxhBhSbO2fp1aegSAo/WSA0L4x+OrrzMMwkBN3uP9hxL7rW0X1QuDpdb8JOmc
 PDauglOO6r8SgU5kN9ZRzlAmQrJGvIJFCW0igQ7k9bfdKR6xQ+0jbmjlv1HSf0PY2evZ
 XivfkPC5N/4VvIEq8W0AN0vv8jgzTgw4TypUP/C/C7EJDDFcRucllu873raGw2WftAg1
 it/YtJfetMboPTVzVQwaFYzJ5xpeWKfdAK1segoCQx0LNaPKS7WGVh/4vBAXBv5MyWm7
 2fYA==
X-Gm-Message-State: AOAM531limWR6y/PVkp32YldvHHeavWD4Gtg5earjcA7aZAxQoLaIE94
 DPBI7VlrvvWFiLktU2B0BHwJSxnfGts=
X-Google-Smtp-Source: ABdhPJxt9zNKy7aIUi3wJuKCdcYtNdW1dMqJB6rEvfTt33RMIs/s7jOT0TV2Ovu6CxO18RC4hCDxJA==
X-Received: by 2002:a05:6512:318a:b0:44a:4dab:4cd2 with SMTP id
 i10-20020a056512318a00b0044a4dab4cd2mr19063879lfe.606.1648456158602; 
 Mon, 28 Mar 2022 01:29:18 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 f26-20020a056512323a00b0044a6d058d37sm1257976lfe.262.2022.03.28.01.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 01:29:18 -0700 (PDT)
Message-ID: <237eda25-8fc0-38df-0da0-96364a9f9359@gmail.com>
Date: Mon, 28 Mar 2022 10:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20220325120025.17931-1-zajec5@gmail.com>
 <798660053.192180.1648452469848.JavaMail.zimbra@nod.at>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <798660053.192180.1648452469848.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_012920_963771_5BDE9D95 
X-CRM114-Status: GOOD (  20.84  )
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

T24gMjguMDMuMjAyMiAwOToyNywgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiUmFmYcWCIE1pxYJlY2tpIiA8emFqZWM1
QGdtYWlsLmNvbT4KPj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4+IENDOiAibGludXgtbXRkIiA8bGlu
dXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiUmFmYcWCIE1pxYJlY2tpIiA8cmFmYWxAbWls
ZWNraS5wbD4KPj4gR2VzZW5kZXQ6IEZyZWl0YWcsIDI1LiBNw6RyeiAyMDIyIDEzOjAwOjI1Cj4+
IEJldHJlZmY6IFtQQVRDSCBtdGQtdXRpbHNdIG5hbmR3cml0ZTogd2FybiBhYm91dCB3cml0aW5n
IDB4ZmYgYmxvY2tzCj4gCj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KPj4KPj4gU3VjaCBibG9ja3MgbWF5IGJlIGluY29ycmVjdGx5IHRyZWF0ZWQgYXMgZW1wdHkg
KGV2ZW4gdGhvdWdoIHRoZXkgbWF5Cj4+IGhhdmUgbm9uLWVyYXNlIE9PQikuIFdhcm4gYWJvdXQg
aXQgc28gcGVvcGxlIG1heSBzdGFydCBzdWluZwo+PiAtLXNraXAtYWxsLWZmcyAuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gLS0tCj4+
IG5hbmQtdXRpbHMvbmFuZHdyaXRlLmMgfCAxMyArKysrKysrKysrKystCj4+IDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9u
YW5kLXV0aWxzL25hbmR3cml0ZS5jIGIvbmFuZC11dGlscy9uYW5kd3JpdGUuYwo+PiBpbmRleCBl
OGEyMTBjLi5jZDUzYTE3IDEwMDY0NAo+PiAtLS0gYS9uYW5kLXV0aWxzL25hbmR3cml0ZS5jCj4+
ICsrKyBiL25hbmQtdXRpbHMvbmFuZHdyaXRlLmMKPj4gQEAgLTI4MCw2ICsyODAsNyBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqIGNvbnN0IGFyZ3ZbXSkKPj4gCWxpYm10ZF90IG10ZF9kZXNj
Owo+PiAJaW50IGVic2l6ZV9hbGlnbmVkOwo+PiAJdWludDhfdCB3cml0ZV9tb2RlOwo+PiArCXNp
emVfdCBhbGxfZmZzX2NudCA9IDA7Cj4+Cj4+IAlwcm9jZXNzX29wdGlvbnMoYXJnYywgYXJndik7
Cj4+Cj4+IEBAIC00MTcsNiArNDE4LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25z
dCBhcmd2W10pCj4+IAkgKi8KPj4gCXdoaWxlICgoaW1nbGVuID4gMCB8fCB3cml0ZWJ1ZiA8IGZp
bGVidWYgKyBmaWxlYnVmX2xlbikKPj4gCQkmJiBtdGRvZmZzZXQgPCBtdGQuc2l6ZSkgewo+PiAr
CQlib29sIGFsbGZmczsKPj4gKwo+PiAJCS8qCj4+IAkJICogTmV3IGVyYXNlYmxvY2ssIGNoZWNr
IGZvciBiYWQgYmxvY2socykKPj4gCQkgKiBTdGF5IGluIHRoZSBsb29wIHRvIGJlIHN1cmUgdGhh
dCwgaWYgbXRkb2Zmc2V0IGNoYW5nZXMgYmVjYXVzZQo+PiBAQCAtNTU1LDcgKzU1OCw4IEBAIGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICogY29uc3QgYXJndltdKQo+PiAJCX0KPj4KPj4gCQlyZXQg
PSAwOwo+PiAtCQlpZiAoIXNraXBhbGxmZnMgfHwgIWJ1ZmZlcl9jaGVja19wYXR0ZXJuKHdyaXRl
YnVmLCBtdGQubWluX2lvX3NpemUsIDB4ZmYpKSB7Cj4+ICsJCWFsbGZmcyA9IGJ1ZmZlcl9jaGVj
a19wYXR0ZXJuKHdyaXRlYnVmLCBtdGQubWluX2lvX3NpemUsIDB4ZmYpOwo+PiArCQlpZiAoIWFs
bGZmcyB8fCAhc2tpcGFsbGZmcykgewo+IAo+IFdoeSBpcyBjaGVja2luZyBmb3IgYWxsZmZzIG5l
ZWRlZCBoZXJlPwoKV2l0aCAtLXNraXAtYWxsLWZmcyB3ZSB3YW50IHRvIHdyaXRlIGJsb2NrIGlm
IGl0IGNvbnRhaW5zIGRhdGEuCgpJbiBvdGhlciB3b3JkcyB0aGlzIGNoZWNrIGlzIGVxdWFsIHRv
OgppZiAoY29udGFpbnNfZGF0YSB8fCB3cml0ZV9hbGxfYmxvY2spCgoKPj4gCQkJLyogV3JpdGUg
b3V0IGRhdGEgKi8KPj4gCQkJcmV0ID0gbXRkX3dyaXRlKG10ZF9kZXNjLCAmbXRkLCBmZCwgbXRk
b2Zmc2V0IC8gbXRkLmViX3NpemUsCj4+IAkJCQkJbXRkb2Zmc2V0ICUgbXRkLmViX3NpemUsCj4+
IEBAIC01NjQsNiArNTY4LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2
W10pCj4+IAkJCQkJd3JpdGVvb2IgPyBvb2JidWYgOiBOVUxMLAo+PiAJCQkJCXdyaXRlb29iID8g
bXRkLm9vYl9zaXplIDogMCwKPj4gCQkJCQl3cml0ZV9tb2RlKTsKPj4gKwkJCWlmICghcmV0ICYm
IGFsbGZmcykKPiAKPiBXaHkgY2hlY2tpbmcgZm9yICFyZXQ/CgpJZiBtdGRfd3JpdGUoKSByZXR1
cm5zIGVycm9yIHdlIGRpZG4ndCBhY3R1YWx5IHdyaXRlIGFueXRoaW5nLgoKCj4+ICsJCQkJYWxs
X2Zmc19jbnQrKzsKPj4gCQl9Cj4+Cj4+IAkJaWYgKHJldCkgewo+PiBAQCAtNjE1LDYgKzYyMSwx
MSBAQCBjbG9zZWFsbDoKPj4gCQkgICB8fCAod3JpdGVidWYgPCBmaWxlYnVmICsgZmlsZWJ1Zl9s
ZW4pKQo+PiAJCXN5c19lcnJtc2dfZGllKCJEYXRhIHdhcyBvbmx5IHBhcnRpYWxseSB3cml0dGVu
IGR1ZSB0byBlcnJvciIpOwo+Pgo+PiArCWlmIChhbGxfZmZzX2NudCkgewo+PiArCQlmcHJpbnRm
KHN0ZGVyciwgIldyaXR0ZW4gJXp1IGJsb2NrcyBjb250YWluaW5nIG9ubHkgMHhmZiBieXRlc1xu
IiwKPj4gYWxsX2Zmc19jbnQpOwo+PiArCQlmcHJpbnRmKHN0ZGVyciwgIlRob3NlIGJsb2NrIG1h
eSBiZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIGVtcHR5IVxuIik7Cj4+ICsJfQo+PiArCj4gCj4g
V2hpbGUgSSBsaWtlIHRoZSBwYXRjaCBJJ20gc3RpbGwgbm90IHNvIGNvbnZpbmNlZCB3aHkgd2Ug
Y2FuJ3QgbWFrZSBza2lwYWxsZmZzPXRydWUgYnkgZGVmYXVsdC4KCkkgdGhvdWdodCBpdCdzIGFi
b3V0IGNoYW5naW5nIC8gYnJlYWtpbmcgdXNlciBpbnRlcmZhY2U6CgpbMjAyMi0wMy0yNV0gWzEx
OjQwOjUzIENFVF0gPGRlclJpY2hhcmQ+IG1yYXluYWw6IGkgdGhpbmsgd2Ugc2hvdWxkIG1ha2Ug
LS1za2lwLWFsbC1mZnMgZGVmYXVsdCBpbiBuYW5kd3JpdGUKWzIwMjItMDMtMjVdIFsxMTo0MDo1
NiBDRVRdIDxkZXJSaWNoYXJkPiB3aGF0IGRvIHlvdSB0aGluaz8KWzIwMjItMDMtMjVdIFsxMTo0
MjowMCBDRVRdIDxybWlsZWNraT4gaSB3YXMgcHJlcGFyaW5nIGEgcGF0Y2ggd2l0aCB3YXJuaW5n
IGlmIGFueSAweGZmIGJsb2NrIGhhcyBiZWVuIHdyaXR0ZW4KWzIwMjItMDMtMjVdIFsxMTo0Mjoz
MyBDRVRdIDxybWlsZWNraT4gaSBkaWRuJ3Qga25vdyBkZWZhdWx0aW5nIHRvIC0tc2tpcC1hbGwt
ZmZzIGNhbiBiZSBkb25lClsyMDIyLTAzLTI1XSBbMTE6NDc6MDUgQ0VUXSA8bXJheW5hbD4gd2Vs
bCwgdGhhdCB3b3VsZCBicmVhayB0aGUgdXNlciBpbnRlcmZhY2UKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
