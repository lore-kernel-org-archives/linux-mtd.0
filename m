Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FDAC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 11:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jj1jIQ38MgmmETHZDLAAJm0/mibZfftefoE89L4mlhs=; b=OO1MCCWNWPZH4g
	sEpVrqQh7eoEKqU0RyZuLq1Xm/lwGReBSxyw7PHMK/diGjr+Y8C5XaHswfnbO+guEYDoIldnOo+o3
	qE6WP8QnvfAu+pwXrrmjDEIJJ4VwQIYVrQLRbHJghB9kJxdeZ1zw9x5O34AjsVQ/O1JDUJ/pIcmaW
	K5hJ+orHtoazOKtzHDhXxWsPwVRS53zKF7DkqwhHgROWbkkcnMaHW2cXoVzPdQG5wLgA/GljpVfq7
	mECo79pzh1thdRMYBz+64f5knF3MjLp+m+wmvMAypbAX7cX4qbuChS6C5tIuv63xsiKLGGORyGXXj
	RjwbH+yHUr+pjELjEK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDaL-008o2L-2b;
	Mon, 20 Mar 2023 11:21:53 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDaI-008o1d-2Z
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 11:21:52 +0000
Received: by mail-lf1-x12a.google.com with SMTP id k37so1477392lfv.0
        for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2023 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679311309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99ft7/YoQ9duXPBfyW1HmphbemcXnZRuFvZrCgkdo+w=;
        b=gbA38qgVd7CkwypjA4D5962rcGkC+6jRUlP4DFgHCG3jcMW9RZdRvZ+Pex0NrDtyJS
         wPmsIslYKabu8nL8IfBVHQNnatkaiigySCQv88NUnnj68IxnAQYWE0gkCJ2B8qWAe+yk
         GkavQn+OA3o1YisPlMs77iZbWCm5iskPCtd2DAZpezI1pOjt28TQf/HRjGAXaNxV9BuV
         uwlmZBYg7f9bKX71d1cciDG9xw5ZaubfWxo6k2UYC/V3vKevEPX/36D5ye919MJvOehT
         uW9NVVp7FXcUL8DdWhVWLlOPFxFl3aImIfqigaTlUqwAw6siX3oWLxDAOOiGh76/VvsJ
         kp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679311309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=99ft7/YoQ9duXPBfyW1HmphbemcXnZRuFvZrCgkdo+w=;
        b=OFbOME0ZjSdRz5xyc4j+TUtkXeS6j/w8zTPnIT3La79Znaq3Pql1acLwDxw4ym7Xqd
         XTQEAzeAIIHkSmbR7DKpgKOZovtbKkgVhEFeWN2aZPmwCf6jtfFTfj6+Ko/SWzQmmNHS
         9JGeeWfu5s+zAoC2gRSyusOM3lIgU1aBxkF4DN1Iww8RPF1OIoQweunxMt+8v4VaWO59
         2Z76d5ZGmMa7ExHxRmg0T7h+J81xVGZDuuynFDb42ImAW1f0+0kQYiKCjwKMvMD5bFYL
         rd6mldjmsOrQuoQJKKvwj5vbrznsB5gnOCS//fdxuWlVblNCf15F0SzaduUytTFjV1tK
         hd0A==
X-Gm-Message-State: AO0yUKVSja0XBjxkXrzC3BVwhp1SvC2mUpMSWMclvnKbLCOH1XNzyQEM
	s6k+OOUiUJHgv6E7OXh+oYfPUgwbRRI=
X-Google-Smtp-Source: AK7set8NoNgMSKi24nZ8ajZueFIQdBHOB1Hq0IhFhxNtjgxJ5DMo/GTFQQTimakcFZMa6KJ41cx+TA==
X-Received: by 2002:ac2:430d:0:b0:4dd:9a38:1b9c with SMTP id l13-20020ac2430d000000b004dd9a381b9cmr5832486lfh.20.1679311309134;
        Mon, 20 Mar 2023 04:21:49 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id 4-20020ac25684000000b004db1afe388asm1652740lfr.163.2023.03.20.04.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 04:21:48 -0700 (PDT)
Message-ID: <06b37e2a-baab-8b14-60b1-dc695746b906@gmail.com>
Date: Mon, 20 Mar 2023 12:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] mtd: core: print error code if registering NVMEM fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230317074736.28944-1-zajec5@gmail.com>
 <20230320120617.6b9e2a4d@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230320120617.6b9e2a4d@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_042150_833230_8BD444B2 
X-CRM114-Status: GOOD (  17.03  )
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

T24gMjAuMDMuMjAyMyAxMjowNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiB6YWplYzVAZ21haWwu
Y29tIHdyb3RlIG9uIEZyaSwgMTcgTWFyIDIwMjMgMDg6NDc6MzYgKzAxMDA6Cj4gCj4+IEZyb206
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gSXQncyBhIGNvbW1vbiBw
cmFjdGljZSB0aGF0IGhlbHBzIGRlYnVnZ2luZyBwcm9ibGVtcy4KPiAKPiBUb3RhbGx5IGFncmVl
LiBJIGFjdHVhbGx5IHNlbnQgYSBwYXRjaCB0byBhdm9pZCB0aGUgZXJyb3IgbWVzc2FnZQo+IHVw
b24gRVBST0JFX0RFRkVSIHdoaWNoIGhhcyB0aGUgc2lkZSBlZmZlY3Qgb2YgcHJpbnRpbmcgdGhl
IGVycm9yCj4gKHRoYW5rcyB0byB0aGUgdXNlIG9mIGRldl9lcnJfcHJvYmUoKSk6Cj4gCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMwMzA3MTkyNTA2LjQzOTUzMi0xLW1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20vCgpJIHNlZSwgdGhhbmtzLCB3ZSBjYW4gZHJvcCB0aGlz
IChteSkgcGF0Y2guCgoKPj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgfCAzICsrLQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+
PiBpbmRleCA4M2EyMjU2NmE4Y2UuLjgzMDNjZTYyYzc1MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+PiBAQCAtNTM5
LDcgKzUzOSw4IEBAIHN0YXRpYyBpbnQgbXRkX252bWVtX2FkZChzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPj4gICAJCWlmIChQVFJfRVJSKG10ZC0+bnZtZW0pID09IC1FT1BOT1RTVVBQKSB7Cj4+ICAg
CQkJbXRkLT5udm1lbSA9IE5VTEw7Cj4+ICAgCQl9IGVsc2Ugewo+PiAtCQkJZGV2X2VycigmbXRk
LT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgTlZNRU0gZGV2aWNlXG4iKTsKPj4gKwkJCWRldl9l
cnIoJm10ZC0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIE5WTUVNIGRldmljZTogJWxkXG4iLAo+
PiArCQkJCVBUUl9FUlIobXRkLT5udm1lbSkpOwo+PiAgIAkJCXJldHVybiBQVFJfRVJSKG10ZC0+
bnZtZW0pOwo+PiAgIAkJfQo+PiAgIAl9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
