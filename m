Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF421CCF9E3
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXz4Sn5UJSiK2AJ0rwi1vqoUAEk2iI+fc7JDdoblHm0=; b=lHNOGVQZkZsCD4
	WBBlTF60hKoiGxD4/6BRm9UobCuvCOFUcoBJqIfd6e27lsMbyrkMz3QSA3qZNu+zHqYZtgjwJtmyI
	m+v7FKKefcMJYq+yMYHxG9n32nzeqCSQVDRmH6o94WzNVh1IGVhjHjjwuSj0ZQKgo8PubH7DPhVbN
	vkBa/qaHCeVT+EIdUYdegUjPPEjhkTajb4MHFltk2TORAFq4GjZocdFxtlwXiTBym8FuJff2cyM3R
	sTY1jhnkhMenX9+ugH80wqFT50MlzbDFFOWUwlwiRBElWsIkA0Q0N1O6+/vi1xyLYSRF4fVKuc3KG
	8/YgeZNh3dNK5PWe45vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHu5-0000000GtSt-2veZ;
	Fri, 07 Nov 2025 08:33:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHu1-0000000GtSY-2uJC
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 08:33:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-294fe7c2e69so5519155ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2025 00:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762504381; x=1763109181; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiFFFZfbJYTgNgjkvynOKEvJ6sYmA2OtVtFdpgrjxyI=;
        b=bQFUlJtTO84eVROayeifMAYZwRqKAdCY8B8tT4631kjbR1s1zerKbaMjet7XeqCuoZ
         ttfp/k3WU8sO15XltdM1E7uknKBt6z9oGKK4uXlUCSEh1p6var77kmKAl+aKrlFtCvNY
         DI2dQnXHyaax5WB2ItwdLiyUkmPcbM1ZylCoVa1oAMMvIQTX8rDjJsPDMfl2k1bMZsOe
         IhPa1WuPjokRZgv3OpSFLn6doPMn4vPqXW7o/tm5ibOs2eh3fDyw1M4CxZ2jl3le7Hff
         TPikr9G4ZQ0n14NoJbW6+3+a+HB4SNNBRwQr9Qp5l9jkKFL3I1jUFpOsn8SqSqfunJJ4
         ZPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762504381; x=1763109181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiFFFZfbJYTgNgjkvynOKEvJ6sYmA2OtVtFdpgrjxyI=;
        b=bK0chNVKd8P702/+tZnXeIcldbgE9263Qf1MACm7XK97mWzJtarwpCoD5DOxCj9ZVu
         mW5myV6xFCFq/SqVs9M8tZgyxxjPh6wxkeICpyJaaW7DXUNbP2nzLvArFsY69iRTEx2Q
         g8jB/NJxDcsFjtxRQp6Sb2hiqTdlYYruir+FUOV8Jcnw7Xu2MzD8VSXL8twXCE/PMaWD
         +EX12m0QgrBo7KMUn79suwqUGX/FkcGaoUZk6C9hySyyExDm9a+0d+lybXX3lzOVZMPW
         5XFyLG2RsWk0dfL5i7s+OCycOmm2IqsOuosO1pFXjIyh69apc34kPVmtFfp4r9GNPTfe
         BNOg==
X-Forwarded-Encrypted: i=1; AJvYcCX55Uz52omTSVhQ1CuYOh+RHwT00wM3WsGTYfWPlWWncKvZvzj0aRS1OnnXJMCEph/4vP3ABtYGIkw=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl2ruorDUfLMXfWZtuaTGEQ/4VyPHy0sP4CEK1N7975HnlQzi3
	tdhldetrfy77TJvtptdnafqncF1Nf1uVB7UyTWdTalfX7qlsdkAO6dSl4y92I8fTMsLK95lW8Vs
	QNrRjHP0ZTUQyLgTeA3rMp4rRd0w9Wds=
X-Gm-Gg: ASbGnctjwfKizSSnh1clDqtvHub7I2yhPeIB6sfhvz5I8Y8xpSv0/Ec908aJ9mjhTMN
	JlJZ34rdRWY+8aZk+5l2pSbsv2HyMR3gBRtwGt2qA7jiopbmoEBgVec28AiMakTLywm1jLItYVs
	KxITslbNrvXw0R81h6zFxBOMt0gcB9ZzSB1gnJIjsPfSKOdPesQafFOBlP6ltOb8JMmixEsuCiL
	lGxQVUZtnMwjoqAat3uQhXUo3RbWAgd0DLXZQ6C6FUj8CZTq+Zvns9iaM3e68K6nQD3GT0=
X-Google-Smtp-Source: AGHT+IHyDIIizr0tEJrJgOxhiQ2tNOEOeDfT7xB1P+WgbdSo29IJ7VFkjIMhqlfphw/t91fN74y/sss2by5tkWnrRHk=
X-Received: by 2002:a17:902:f645:b0:295:5da6:5ff3 with SMTP id
 d9443c01a7336-297c0292ed9mr33017155ad.0.1762504380817; Fri, 07 Nov 2025
 00:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20251106054940.2728641-1-linchengming884@gmail.com>
 <20251106054940.2728641-2-linchengming884@gmail.com> <87o6pf8r24.fsf@bootlin.com>
 <CAAyq3Sb8-FRC+bZt_bEvOdBNVSN4xa5F_TpBbKF__HzhVPEpTw@mail.gmail.com> <874ir68d4u.fsf@bootlin.com>
In-Reply-To: <874ir68d4u.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 7 Nov 2025 16:28:23 +0800
X-Gm-Features: AWmQ_blyRFNdq6bG7DRRVA8-bAzYofiDnApOK9hfVftd1T4Sua3lGtTQ0JnqN7A
Message-ID: <CAAyq3SZ33K4Ot8OgZnv1-CR5mJt0wNaPC55CMXMzpjbhBgiYOg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi headers
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, chengzhihao1@huawei.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_003301_733187_44BC7C34 
X-CRM114-Status: GOOD (  19.16  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQxMeaciDfml6Ug6YCx5LqUIOS4i+WNiDQ6MjPlr6vpgZPvvJoKPgo+IEhlbGxvLAo+
Cj4gPj4gPiArICAgICBpZiAodWJpLT52aWRfaGRyX3NoaWZ0KQo+ID4+ID4gKyAgICAgICAgICAg
ICBtZW1zZXQoKGNoYXIgKilwLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXplIC0gVUJJX1ZJRF9I
RFJfU0laRSk7Cj4gPj4gPiArICAgICBlbHNlCj4gPj4gPiArICAgICAgICAgICAgIG1lbXNldCgo
Y2hhciAqKXAgKyBVQklfVklEX0hEUl9TSVpFLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXplIC0g
VUJJX1ZJRF9IRFJfU0laRSk7Cj4gPj4KPiA+PiBIZXJlIEkgYW0gcmVhY2hpbmcgdGhlIGxpbWl0
cyBvZiBteSBVQkkga25vd2xlZGdlLCBzbyBJIHdvdWxkIHByZWZlcgo+ID4+IFJpY2hhcmQgdG8g
KGluKXZhbGlkYXRlIHdoYXQgSSBhbSBzYXlpbmcsIGJ1dCBBRkFJVSwgdGhlIFZJRCBoZWFkZXIg
Y2FuCj4gPj4gYmUgbGl0ZXJhbGx5IGFueXdoZXJlIGluIHRoZSBwYWdlLCBub3QganVzdCBhdCB0
aGUgc3RhcnQgb3IgZW5kIG9mIGEKPiA+PiBzdWJwYWdlLCBzbyBpbiB0aGUgdmlkX2hkcl9zaGlm
dCBJIHdvdWxkIGV4cGVjdCBzb21lIGV4dHJhIG1hdGhzIHRvCj4gPj4gaGFwcGVuLCBubz8KPiA+
Cj4gPiBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCBub3cuIElmIHRoZSBWSUQgaGVhZGVyIGlzIG5v
dCBndWFyYW50ZWVkIHRvIGJlCj4gPiBhdCB0aGUgc3RhcnQgb3IgZW5kIG9mIGEgc3VicGFnZSwg
dGhlbiB5ZXMsIG15IGN1cnJlbnQgbG9naWMgbmVlZHMgdG8gYmUKPiA+IHJld29ya2VkIHRvIGNv
dmVyIHRoYXQgY2FzZS4KPgo+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGVhc3kgdG8gZG8sIGJ1
dCBtYXliZSB5b3UgY2FuIG1lbXNldCB0aGUgd2hvbGUKPiBidWZmZXIgYmVmb3JlIGZpbGxpbmcg
aXQuIFRoYXQgd291bGQgYXZvaWQgdGhlIG5lZWQgdG8ga25vdyB3aGVyZSB0aGUKPiBWSUQgaGVh
ZGVyIHdpbGwgYmUuCgpBdCB0aGlzIHBvaW50IEkgaGF2ZSB0d28gcG9zc2libGUgZGlyZWN0aW9u
cy4KClRoZSBmaXJzdCBhcHByb2FjaCBpcyB0byBrZWVwIGRvaW5nIGl0IGluIHR3byBwYXJ0cywg
bGlrZToKCm1lbXNldCgoY2hhciAqKXAsIDB4RkYsIHViaS0+dmlkX2hkcl9zaGlmdCk7Cm1lbXNl
dCgoY2hhciAqKXAgKyB1YmktPnZpZF9oZHJfc2hpZnQgKyBVQklfVklEX0hEUl9TSVpFLCAweEZG
LAogICAgICAgdWJpLT52aWRfaGRyX2Fsc2l6ZSAtICh1YmktPnZpZF9oZHJfc2hpZnQgKyBVQklf
VklEX0hEUl9TSVpFKSk7CgpUaGUgc2Vjb25kIGFwcHJvYWNoIHdvdWxkIGJlIHRvIG1vZGlmeSB1
YmlfaW5pdF92aWRfYnVmKCkgaW4gdWJpL3ViaS5oLApzbyB0aGF0IGl0cyBtZW1zZXQgZmlsbHMg
dGhlIGJ1ZmZlciB3aXRoIDB4RkYgZnJvbSB0aGUgYmVnaW5uaW5nLgoKVGhlIHNlY29uZCBvbmUg
aXMgY2xlYW5lciwgYnV0IHViaV9pbml0X3ZpZF9idWYoKSBpcyBub3QgYWx3YXlzIGNhbGxlZApi
ZWZvcmUgdWJpX2lvX3dyaXRlX3ZpZF9oZHIoKSwgc28gSSBhbSBjaGVja2luZyByaWdodCBub3cg
d2hldGhlciB0aGlzCndvdWxkIGFmZmVjdCBvdGhlciBwYXRocy4KCj4KPiBUaGFua3MsCj4gTWlx
dcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
