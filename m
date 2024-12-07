Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE64E7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 18:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Hx52gkGO0E0++2nZkpZIWrirJ/OlJy8rvNXT9pzREs=; b=zrzHMoFWECMDDa
	kWGkEVIMB/35DBBNKfxm9CGl6dM7lb46detwi+IdEhxqYH3pOqvT1gCD0Ci9m0UXIzUIP2Hxz232S
	IV87EZXt6C+Az03OL+0tWwU27kc9T3AafF5scufthpy8NMTIBnSeYD+3qV81BjBY7uhiQ2WGSlZZk
	Ulh/+0Sfotm9ZFMTbDS1oydnPKU8i1mXJg2puIG7zY8I4QacrSE2aemWYoNG9/fOI+SZHPJwgdos8
	v969ZwpPimgrNnHDt3J4SdOk7u4XjmtP3sAtK2BNLP+SWtXqE/WPw12BD0u2teJxvcJSTZqEDm6y5
	J0CWhdYIgYmVdDELIZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJz9J-00000004Esf-0n82;
	Sat, 07 Dec 2024 18:03:25 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJz9H-00000004EsD-0FOe
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 18:03:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so3771760a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Dec 2024 10:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733594601; x=1734199401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAM1ejACCgzwtGZ317f04iGWR3vRaZlARtBj3sdN7kc=;
        b=AFzQzMRK4KdIUoqgFrQSaECnyn9Qr+70y0PA8D4CBmSkjzUa97F5Sw8qz6gI8Z9npr
         1+cpXJogoZ/HtOC+pJ2/Wmnz9uZ67pBE1smRYQBtzdNf4IS+zMIHenQh/FhXceh0nEwN
         Ym5J9uFtjAMrsTd2dC5IAiDPPFQsV3O3P4RpzyF31V+4SvIg6X27Jmx/Zwfh/P5RiGHl
         3Y12DyHQBaWDnk3wSRgvtCArbcRKVwloZujgazIen8/jXXmyi5bGr+uMPR0jBicgt53q
         y3B7awfvKb48Lyh3A1JMZFa6FMLh7lmj0irwSQpCTrqCRGcf/BRJ/ti87yyQoeuDW76s
         jktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733594601; x=1734199401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAM1ejACCgzwtGZ317f04iGWR3vRaZlARtBj3sdN7kc=;
        b=J+n8Gkk9w9wT5UEv7qXVq+2DCeSdTkzsUZuScp89sLO2Hw7og9Ud3tBnyMujXpLTZX
         krzUUzpStItbLFki64EpPb5fGylLBAmOE1iNiGW5tGtbhJzfIVy1uPAZ+eCcuzUz8KBT
         BiU+Fc970WbwyPGRfNfJeVLfdO2uItCl88/JW7cf7ZWaPhyZ7bWEtqT6RDaRgKrB18t3
         DAp6Q/ojZ8rOOO46X4oAxq/9n9QfyQxdPI5B7pwAdoKp43HtnZsmSIn9+u5j1WePeDzZ
         uKoP4cnNY7zfysgIOxargrQfbMCPbEP+jefIrBQEiKTya8ExCASSWgdyx86RNFQx2lT8
         aiFA==
X-Forwarded-Encrypted: i=1; AJvYcCWmNshtWVCZRjIAYh/fKp4xRDT44zRaDd3vlHludK4rUIQI3NKC7EMS5+ijAwcNnqH3aoUrBVWYEOs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvkgcE9CyXOruKw/eRnPQEYKdJ9LqE6Lo+HpAL1SSikHXxTMqn
	DCqOMPhfOwgMASc+nfVmrENA06TzyBUrEqsIf4MNP3w7hDZXHgUhFdqepracC3V3/39DYLoqqmz
	b0zAe7Ymf/6nWCDdZl4FheDkvNa8=
X-Gm-Gg: ASbGnctiO1O8KmQAv/qwPzTDNkRRMvg0qwvXo02Sn5Bpn8HYJPLv3KZkkkTU5oTUuvW
	f+9WJ0jMCRiXoOGgBOv/tqcbQPFyQ7oEQ
X-Google-Smtp-Source: AGHT+IGAye18gAHqZ9L2Lr8q5n9wtcP/p7ADT0zM7BSTAQNqS6J3MjlTsob+61cxDEMmI523pVCiblUDvARThzh1XG8=
X-Received: by 2002:a05:6402:3485:b0:5d0:b040:4616 with SMTP id
 4fb4d7f45d1cf-5d3be742d60mr6739486a12.28.1733594600824; Sat, 07 Dec 2024
 10:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20241206125258.9212-1-quic_pintu@quicinc.com> <e43da923-0184-d41e-a273-a02848f3b671@huawei.com>
In-Reply-To: <e43da923-0184-d41e-a273-a02848f3b671@huawei.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Sat, 7 Dec 2024 23:33:08 +0530
Message-ID: <CAOuPNLgPmq6DyjQVQkmRi3Ap8UXURaU7w_g_zJ3yzheaNNZa2A@mail.gmail.com>
Subject: Re: [PATCH] ubifs/debug: remove return from end of void function
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Pintu Kumar <quic_pintu@quicinc.com>, richard@nod.at, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_100323_157182_F21DA1E7 
X-CRM114-Status: GOOD (  12.97  )
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

SGkgWmhpaGFvLAoKT24gU2F0LCA3IERlYyAyMDI0IGF0IDA4OjI1LCBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI0LzEyLzYgMjA6NTIsIFBp
bnR1IEt1bWFyIOWGmemBkzoKPiA+IE5vdGljZWQgdGhhdCB0aGVyZSBpcyBhIHVzZWxlc3MgcmV0
dXJuIHN0YXRlbWVudCBhdCB0aGUgZW5kIG9mIHZvaWQKPiA+IGZ1bmN0aW9uIHViaWZzX2R1bXBf
bGViKCkuCj4gPiBKdXN0IHJlbW92ZWQgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGludHUg
S3VtYXIgPHF1aWNfcGludHVAcXVpY2luYy5jb20+Cj4gPiAtLS0KPiA+ICAgZnMvdWJpZnMvZGVi
dWcuYyB8IDEgLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gSGksIFBp
bnR1LiBUaGUgdGl0bGUgb2YgdGhlIHBhdGNoIHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZSAidWJp
ZnM6Cj4gdWJpZnNfZHVtcF9sZWI6IHJlbW92ZSByZXR1cm4gYXQgZW5kIG9mIHZvaWQgZnVuY3Rp
b24iLiBTZWUKPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdC4g
T3RoZXJ3aXNlLAo+Cj4gUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+Cj4KVGhhbmsgeW91IHNvIG11Y2ggZm9yIHlvdXIgcmV2aWV3IGFuZCBjb21tZW50
cy4KT2gsIG5vcm1hbGx5IEkgZm9sbG93ICJzdWJzeXN0ZW06IGZpbGVuYW1lOiA8dGl0bGU+IiBm
b3IgdGhlIG90aGVyIHBhdGNoZXMuCk9rYXksIG5vIHdvcnJpZXMsIEkgY2FuIGZvbGxvdyB5b3Vy
IHN1Z2dlc3Rpb24gYXMgInN1YnN5c3RlbTogZnVuY3Rpb24tbmFtZSIKYW5kIHB1c2ggY2hhbmdl
cyBhZ2FpbiBmb3IgYm90aCB0aGUgcGF0Y2hlcy4KCkFjdHVhbGx5LCBzb21ldGltZXMsIGZ1bmN0
aW9uLW5hbWUgY2FuIGJlIHF1aXRlIGJpZywgc28gSSBhdm9pZCBpdCBpbgpzdWJqZWN0IHRpdGxl
cy4KQnV0IG5vIGlzc3VlcywgSSBjYW4gY2hhbmdlIGl0IGFuZCBwdXNoIGFnYWluLgoKVGhhbmsg
eW91LApSZWdhcmRzLApQaW50dQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
