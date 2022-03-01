Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79GJ5UlmUSYDoXiQcNJChEVjAoIW1q/Ae4vZpy2CJEs=; b=aROR7H/2pdZgtu
	EzbmtIHyQa33qPavLa22WUrjsr/eTDHBrX/4Prrb8UVK7OYaOb5lJ6+Til8ZA87E5mIuSo5ABISFm
	aWCoQ2O/hOGkqX3wc5zD/P45jCsh6TPeKl2uWuFimdk/oIdYIu9pBjHvRRDXc3BAJHSjaBw0Q9uGN
	nlM+iWPzgQbpQmDz+uhT3ovMqSHlQwZYYiv5bw4zvjZ8Jm+0odo0osMSIKu2Lz+9tI+IZK9yNBi6z
	+nvcqIHHzvFbDoW2+qfrEuehC3hz0WFUWMJuRy3Nll2Wyj99F3527W88nZTf+J32MB316bFfTicHe
	DTW3LcMlclvMMyJNdWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP4PC-00HJeI-Ip; Tue, 01 Mar 2022 15:27:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP4Nn-00HIRB-8G
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 15:25:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u1so21059881wrg.11
 for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2022 07:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pCV3B7TS4aCvWLkBAafjmXlImHeZ58cVSFXmovkWYyU=;
 b=JSEJ86n5yjtPt2dV/f43r6O6uLNJZvnHJQc7tAMwdz6x9W56GcYVlZcuh2D9jq2rNk
 QCkkinyaQrSgD92fl1iodWGfJpFGGO3vicxIvSKYPPIBScrw9Rc5XHFt0/QjrKbQhCpw
 x9yM0ddrQWdnF8ZFEM+meZFcOxQZtwjFVTpghKahXHJLJkT8QXaqXuINo7mfvg5s9x7s
 A6falHN7fL3Tv3q781LymlUw98gkLkHFmoLHVZfC9b1OAq9jmHyiiA661Hv5eSKRWsGV
 9cHQfh/zc7jjHnalpp7kq8w3Extj8deA1OBRHPVRR8ZrBfdQ3IyZgF2Jzs7VBAxRmox9
 gjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pCV3B7TS4aCvWLkBAafjmXlImHeZ58cVSFXmovkWYyU=;
 b=aBE157taxkvaGPkXIumNkVHfzBB2EBD5mu31wIQm4jVXy77bCq+e7+xpjrmG6Yti3g
 gPdIYeA4jnWlz6dYX1ZhkftkvBkVCchx5Xthm8Hxb07uYd56xgqSDNd687QassUzq+qc
 oiyrD6JwSjd0TPd40baQQ+Y5qvPz5dokc4p6/5vQS8iItb0/vaaoRCixSzoTjQMQWOAW
 HOghus0G5fgjNBuX1WO9gR3ICEHpHtt2z/Fy4KlVVJv8Mj6QS3dEEnyUUzcU2tDN6vkY
 2XbAVPQS+03ic3sisS2KzLRXyoqlJ32Q3eazYJ5EDZyW0oyCWyGaqJV+g/pew76hhn/U
 axug==
X-Gm-Message-State: AOAM531tv/fYk9kiyKtqEkTF1EH++Ze0jTSwagOmiEmcvNv3Ekfv1BHr
 XVyxfG4l2N5cY2Y0PoVVdB5i3hJUI5JrT9cLzQk=
X-Google-Smtp-Source: ABdhPJyS38TCc+icP/RpAutyaC8cHH7zyMH8To14lcuUGqOjC0yDAZ0DZG5X3WV1r9HpVMgmIV6UialiQIUEJvG2Xdc=
X-Received: by 2002:adf:ec03:0:b0:1f0:2488:8ff9 with SMTP id
 x3-20020adfec03000000b001f024888ff9mr154418wrn.542.1646148345438; Tue, 01 Mar
 2022 07:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20220301124935.2893622-1-michael@walle.cc>
In-Reply-To: <20220301124935.2893622-1-michael@walle.cc>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Mar 2022 16:25:33 +0100
Message-ID: <CAEyMn7YnoGnfgauXUDqgkVJ2krt7RrcXHrwfSgxdTmGmkgBPJA@mail.gmail.com>
Subject: Re: [PATCH RFC] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_072547_344428_BB0150AF 
X-CRM114-Status: GOOD (  23.38  )
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

SGkgTWljaGFlbCwKCkFtIERpLiwgMS4gTcOkcnogMjAyMiB1bSAxMzo0OSBVaHIgc2NocmllYiBN
aWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPjoKPgo+IEZvciBmbGFzaGVzIHdoaWNoIHVz
ZSB0aGUgZmlyc3QgSkVTRDIxNiByZXZpc2lvbiwgd2UgZG9uJ3Qga25vdwo+IHdoaWNoIGVuYWJs
ZSBtZXRob2QgZm9yIHF1YWQgbW9kZSB3ZSBjYW4gdXNlLiBUaGUgZGVmYXVsdCBvbmUgaW4KPiBz
cGlfbm9yX2luaXRfZGVmYXVsdF9wYXJhbXMoKSBpcyB3cm9uZyBmb3IgYXQgbGVhc3QgdGhlIE1h
Y3Jvbml4Cj4gTVgyNUwxMjgzNUYsIHRodXMgY2xlYXIgdGhlIGVuYWJsZSBtZXRob2QuIEZsYXNo
ZXMgd2l0aCBzdWNoIGFuCj4gU0ZEUCByZXZpc2lvbiB3aWxsIGhhdmUgdG8gdXNlIGEgZmxhc2gg
KGFuZCBTRkRQIHJldmlzaW9uKQo+IHNwZWNpZmljIGZpeHVwLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4KClRlc3RlZC1ieTogSGVpa28gVGhpZXJ5
IDxoZWlrby50aGllcnlAZ21haWwuY29tPgoKPiAtLS0KPiBQbGVhc2Ugbm90ZSwgY29tcGxldGVs
eSwgdW50ZXN0ZWQuIEhlaWtvLCBjb3VsZCB5b3UgdGVzdCB0aGlzIHdpdGhvdXQKPiBoYXZpbmcg
dGhlIHNlY29uZCBzZXJpZXMgZnJvbSBUdWRvciBhcHBsaWVkPyBUaGVuIHlvdSBzaG91bGQgaGF2
ZSBhdAo+IGxlYXN0IGEgd29ya2luZyBmbGFzaCB3aXRob3V0IHF1YWQgbW9kZS4KCkkgcmVtb3Zl
ZCB0aGUgc2Vjb25kIHNlcmllcyBhbmQgYXBwbGllZCB5b3Vycy4gV2l0aCB0aGF0IGl0IHdvcmtz
LgoKCi0tCkhlaWtvCgo+Cj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIHwgOSArKysrKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9zZmRwLmMKPiBpbmRleCBhNTIxMTU0M2QzMGQuLmMyM2U4NTI3NGZmMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc2ZkcC5jCj4gQEAgLTU0OSw2ICs1NDksMTQgQEAgc3RhdGljIGludCBzcGlfbm9yX3BhcnNl
X2JmcHQoc3RydWN0IHNwaV9ub3IgKm5vciwKPiAgICAgICAgIG1hcC0+dW5pZm9ybV9lcmFzZV90
eXBlID0gbWFwLT51bmlmb3JtX3JlZ2lvbi5vZmZzZXQgJgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTk9SX0VSQVNFX1RZUEVfTUFTSzsKPgo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIFRoZSBmaXJzdCBKRVNEMjE2IHJldmlzaW9uIGRvZXNuJ3Qgc3BlY2lmeSBhIG1ldGhv
ZCB0byBlbmFibGUKPiArICAgICAgICAqIHF1YWQgbW9kZS4gc3BpX25vcl9pbml0X2RlZmF1bHRf
cGFyYW1zKCkgd2lsbCBzZXQgYSBsZWdhY3kKPiArICAgICAgICAqIGRlZmF1bHQgbWV0aG9kIHRv
IGVuYWJsZSBxdWFkIG1vZGUuIFdlIGhhdmUgdG8gZGlzYWJsZSBpdAo+ICsgICAgICAgICogYWdh
aW4uCj4gKyAgICAgICAgKi8KPiArICAgICAgIHBhcmFtcy0+cXVhZF9lbmFibGUgPSBOVUxMOwo+
ICsKPiAgICAgICAgIC8qIFN0b3AgaGVyZSBpZiBub3QgSkVTRDIxNiByZXYgQSBvciBsYXRlci4g
Ki8KPiAgICAgICAgIGlmIChiZnB0X2hlYWRlci0+bGVuZ3RoID09IEJGUFRfRFdPUkRfTUFYX0pF
U0QyMTYpCj4gICAgICAgICAgICAgICAgIHJldHVybiBzcGlfbm9yX3Bvc3RfYmZwdF9maXh1cHMo
bm9yLCBiZnB0X2hlYWRlciwgJmJmcHQpOwo+IEBAIC01NjIsNyArNTcwLDYgQEAgc3RhdGljIGlu
dCBzcGlfbm9yX3BhcnNlX2JmcHQoc3RydWN0IHNwaV9ub3IgKm5vciwKPiAgICAgICAgIC8qIFF1
YWQgRW5hYmxlIFJlcXVpcmVtZW50cy4gKi8KPiAgICAgICAgIHN3aXRjaCAoYmZwdC5kd29yZHNb
QkZQVF9EV09SRCgxNSldICYgQkZQVF9EV09SRDE1X1FFUl9NQVNLKSB7Cj4gICAgICAgICBjYXNl
IEJGUFRfRFdPUkQxNV9RRVJfTk9ORToKPiAtICAgICAgICAgICAgICAgcGFyYW1zLT5xdWFkX2Vu
YWJsZSA9IE5VTEw7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gICAgICAgICBjYXNlIEJG
UFRfRFdPUkQxNV9RRVJfU1IyX0JJVDFfQlVHR1k6Cj4gLS0KPiAyLjMwLjIKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
