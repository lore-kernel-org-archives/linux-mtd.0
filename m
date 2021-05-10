Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB17C43460
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:23:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94286144E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94286144E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dv526w2a53Jb7/W/CeCo0LmrBkJnOsbK4CqfQZpjuqk=; b=KqBtMk82E/0OBDfEjTw/RF3Lm
	dWIlMKdVlViPEFw2HLQt0IZ9pk9IP/KTj1aAfgjjNh3gd0N3R7D43QJ2oh5DC94i9wG4aH8dlL96c
	f+cPydbFdFaTKXF9c0KVzNZknC3R0sIGN+0hn39cXJjVLsC3/aCe4VExaQDZKrUyga0vAPwPGT0Bn
	evE0dX284gzLJp2Ztj6bwZtgO1fI0x21Unm2UhhLYZU4NJKl4rYcUoEDqrH8W26nOj7TEoCgfaK2d
	WVq3exIeZq90CeSvd81+2ds3wH0iI+MzuGmf3KmkJospOVSedAs2AuybT09YdmJD1iGUm2XveYGET
	r1tkZ09Nw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg34J-00DvGD-JE; Mon, 10 May 2021 10:23:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg31C-00DuhI-8T
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=YAklBa7DkYoJWxcFsCJD6k0+NthSxlR9HKUgYht4vEE=; b=cY7WEu9RluUcfcT270BIP9YdtR
 MKt2ivTaJZKGkAhXpQ4fM0mdedZk3PhetPXQNJxNQ37m8eoRrJ5LLZwek+baCNTzxu13RIv289T42
 ooXQqa1KVyKdsjnkyXGfvExGIWdcg84ZmLTyZvGbIM7DhQB89lXvz9UPBN4wYlxYlrI+a7HrN/Qyy
 Z75HDbk9X7RlcYrVBaHiwjI6oCVjt9mW2p6YaVCl0SV1tSIyISPPM+dF9eA5izdO2xyqYcTr/Jvmo
 ro78rmsUDrCUcRnxeHPoxUWM0qLxYwZ4FKbG8pn46Er+OyQY5Osbg5oV1yrnqu/Yd6DmEGvNilA9M
 IvqG8O9A==;
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg319-008WId-NU
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:20:05 +0000
Received: by mail-vs1-xe29.google.com with SMTP id s15so5302044vsi.4
 for <linux-mtd@lists.infradead.org>; Mon, 10 May 2021 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YAklBa7DkYoJWxcFsCJD6k0+NthSxlR9HKUgYht4vEE=;
 b=hutKTOaZ/SDxo3w3A+DNWj/dH6C5Zw1Xip/rBvMhJQfAGcxFAe67Q89xP6ARND0zSK
 UQt/1zwF/d4pE2tWhtqFDBKZ6lmZY6cQ6w8EdU5gG/YFrcJxxc3mTt/wNUBIIfetTycA
 beGEz3UDw9HkwU6OGgzpTMRNLSz0K4kIHnlhY6ts0QlECamo2DXQDcbcpigigoA8NvMZ
 kST2zRXRAvtBPvufRaE7XOa8ObpYKESz7SFdCmxV0ryeuBd8yTAvq7LHfgwhabjX9wUk
 1CBMMthZ7dXzKFjJvaYW4Rg1zYTkFc8eOG6oX0ql43UcPcu/8ugRh7eegOSOLL07BdSZ
 CIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YAklBa7DkYoJWxcFsCJD6k0+NthSxlR9HKUgYht4vEE=;
 b=XUG81or/GAxcNBq0yJPnrrfoO9gsVhnTaM5QEtup3d6Y+J5ABlB3gNSPOkzQn12VjJ
 iwgpQc77R44d+g4v1irReedXo8d42rJoe+6+WOSsGVqQqnCvY4fMiFps9jKSBlcYQZRK
 /t6Hr8HM6Y7FHtMpwzMHJx7wuuRZXLZVpm9DR6GpX2/hJDbOTqyZZ7U2NCQab87H1T8V
 bYK1SpAGEU8RnZ2s6Rufqg9uJ6KJPJBZOJFSUf0NI6kESPpmMDOLWMnaE1pV88FqMhU3
 cILIqQyWH6tWrsHDjjV7ynEjzuiGAAdGU0P2y8eSv6PT52PdZd48wr9QZ4KJv07ANlaZ
 ej6g==
X-Gm-Message-State: AOAM531bNtPoOzbYQguAVOH//JKNifvrha3AYLlgmve9sjOwThaepHBj
 KZ6SBW059UZHmHh91mAvjAc2dYpkACbMFzeAnb5Tg2sITrrlvg==
X-Google-Smtp-Source: ABdhPJxrams8tx+nMFa6dQ72z6SsOEXDMFVvNxUG6vcuQZaKsLYSWisf8BdPO7dkbFgDk1agOZsIAfBl4EnHK8wIUGA=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr4207610vsl.9.1620642001573;
 Mon, 10 May 2021 03:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmihzqVhm49oGCYbkFmCFaYAX57xU5yVZm6hn3OCmuk1jBSSg@mail.gmail.com>
 <20210510095907.0c4ae196@xps13>
In-Reply-To: <20210510095907.0c4ae196@xps13>
From: kasi viswanathan <kviswanathan.83@gmail.com>
Date: Mon, 10 May 2021 15:49:50 +0530
Message-ID: <CAMmihzoRMoh9h7Wj2J+wCuZKgH9m4TkWRTmy6ZAzoFsGvvwM_Q@mail.gmail.com>
Subject: Re: NAND flash Write protection
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_032003_800418_BDE402B7 
X-CRM114-Status: GOOD (  23.27  )
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

SGkgTWlxdWVsIFJheW5hbCwKClRoYW5rcyBmb3Igc2hhcmluZyB0aGUgaW5mb3JtYXRpb24uIEl0
IGlzIHZlcnkgdXNlZnVsLgoKCk9uIE1vbiwgTWF5IDEwLCAyMDIxIGF0IDE6MjkgUE0gTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBrYXNpLAo+
Cj4ga2FzaSB2aXN3YW5hdGhhbiA8a3Zpc3dhbmF0aGFuLjgzQGdtYWlsLmNvbT4gd3JvdGUgb24g
U2F0LCA4IE1heSAyMDIxCj4gMDk6NDk6NTggKzA1MzA6Cj4KPiA+IEhpIGFsbCwKPiA+Cj4gPiBJ
biBvbmUgb2Ygb3VyIGN1cnJlbnQgYm9hcmRzIHdlIGFyZSB1c2luZyBNaWNyb24gTkFORCBmbGFz
aCBvZiBTaXplIDUxMk1CLgo+ID4gU29tZXRpbWVzIHRoZSBmaXJzdCBwYWdlICg0aykgZ2V0cyBj
b3JydXB0ZWQgYW5kIHRoZSBib2FyZCBnZXRzIGJyaWNrZWQuCj4KPiBJIHRoaW5rIHRoaXMgaXMg
eW91ciByZWFsIGlzc3VlLiBJIGFtIG5vdCBzdXJlIHRyeWluZyB0byBsb2NrIHRoZSBmbGFzaAo+
IGlzIHRoZSByaWdodCB0aGluZyB0byBmb2N1cyBvbiwgdW5kZXJzdGFuZGluZyB3aHkgaXQgZ2V0
cyBicmlja2VkIHNlZW1zCj4gbW9yZSBsZWdpdGltYXRlIHRvIG1lLgo+Cj4gPiBXZSBoYXZlIHN0
b3JlZCB0aGUgYm9vdGxvYWRlciBhdCB0aGlzIGxvY2F0aW9uLgo+ID4KPiA+IEFzIGEgcHJldmVu
dGl2ZSBtZWFzdXJlIHdlIGhhdmUgYWRkZWQgcmVhZC1vbmx5IGFuZCBsb2NrIGZsYWdzIGluIHRo
ZSBkdGIgZW50cnkuCj4gPgo+ID4gTXkgcXVlcnkgaXMsIElzIGl0IHBvc3NpYmxlIHRvIGxvY2sg
YSBwYXJ0aWN1bGFyIGJsb2NrIG9mIE5BTkQgZmxhc2gKPiA+IG1lbW9yeSBpbiBsaW51eCA/Cj4K
PiBJIGRvbid0IHRoaW5rIHRoaXMgY2FwYWJpbGl0eSByZWFsbHkgYmVsb25ncyB0byBMaW51eC4g
VGhlIHJpZ2h0Cj4gcXVlc3Rpb24gaXMsIGlzIHlvdXIgTkFORCBmbGFzaCBjYXBhYmxlIG9mIHRo
YXQ/IEkga25vdyB0aGF0IE1hY3Jvbml4Cj4gZmxhc2hlcyBoYXZlIGEgc3BlY2lmaWMgYWRkaXRp
b25hbCBsb2NrL3VubG9jayBmZWF0dXJlIHRoYXQgaXMKPiB1cHN0cmVhbSwgYnV0IHRoZXJlIGlz
IG5vIE1pY3JvbiBzdXBwb3J0IGZvciB0aGF0IHlldC4gWW91IGNhbiBhZGQgaXQKPiB0aG91Z2gg
aWYgaXQgZXhpc3RzIHdpdGggTWljcm9uJ3MgZGV2aWNlcyB0aHJvdWdoIHRoZQo+IC0+e2xvY2ss
dW5sb2NrfV9hcmVhKCkgaG9va3MuCj4KPiA+IEkgdW5kZXJzdG9vZCBhZnRlciBnb29nbGluZyB0
aGF0IGEgc3BlY2lmaWMgSC9XIHBpbiBzdXBwb3J0IGlzIG5lZWRlZAo+ID4gdG8gYWNoaWV2ZSB0
aGlzICJQb3dlci1VcCAgUmVhZCAgRW5hYmxlLCAgTG9jay9VbmxvY2sgIEVuYWJsZShQUkwpIgo+
Cj4gVGhlcmUgaXMgaW5kZWVkIGEgV1AgKFdyaXRlIFByb3RlY3QpIHBpbiB3aGljaCBwcmV2ZW50
cyB3cml0ZXMgYW5kCj4gZXJhc3VyZXMgb3ZlciB0aGUgZW50aXJlIGNoaXAgdGhhdCB5b3UgY2Fu
IHVzZSB0byBwcm90ZWN0IHRoZSBjb250ZW50Cj4gb2YgeW91ciBjaGlwLiBCdXQgdGhhdCB3b24n
dCB3b3JrIGlmIHlvdSB1c2UgZWcuIFVCSUZTIG9uIHRvcCBvZiBpdCBhcwo+IGl0IHdpbGwgbmVl
ZCB3cml0ZSBhY2Nlc3MgYXQgc29tZSBwb2ludC4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
