Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669C2C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Feb 2022 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ol9Gum+vKEAOoSs9W8sujalzPCGWtqaIPHzTGOcLBE=; b=MtE4rlElqeqRFD
	QLl1iulkXHrexy6agznmF3O3ODowp2Tx9enVeGxUHw+CsmpHhiLh3nx/Z4j0tzojid4JnibgQfWLl
	A73LxKQbPhgbU0WcWj6XTz2LqW7gF5x7PAeMGqynNa7qam9VEgjpHlxBr5+qnCLsjIMNmfFuNJJGg
	XX9xHbPLVTvcSsR9/CpW0s2sFi+anpSotk3ZLgy/us5R+fLVcPynn0mGsVDW0WoTj/Wyd9PTHEO7j
	vqZWzgCT5nydLtlEvCW/GZzosT8mK+QjBJBDn3vZY094P5RwoKhLEmT9xUPQAtZ2H/ff9PXtJUUmn
	C+N8CpLzhBiTPWvSKoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFnnY-003EOQ-Ho; Fri, 04 Feb 2022 01:54:04 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFnnW-003EO1-4S
 for linux-mtd@lists.infradead.org; Fri, 04 Feb 2022 01:54:03 +0000
Received: by mail-io1-xd32.google.com with SMTP id s18so5616084ioa.12
 for <linux-mtd@lists.infradead.org>; Thu, 03 Feb 2022 17:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CxeSMOub6619/Vo/I4fh/hAKT2CKDmbES7X5b4hBt8I=;
 b=MpSoFkim7n2kSWDPKb+IqXhnmOsLb7b5KC27bLpPoVTWuCDoPXkrp/X2PiCCDo5j0/
 oHbaA1J0LbL9NzswCzYHWxQatylxecmokxuWEwq+y06VaMDrDX1OKWQXWVxKp3xw4npT
 2FNeDbtP7DWoIOiXpTtPMrx2c3R4VgnfP+LReiFvGO7gS078fgqIlq9smzd9CD6688Ia
 Os14jTeMHLfh7JRlHh6KXu+Dca9eCT5hJhRA5Xu2g3W06lMsRVCrRMQVBgtYDbEw1nZV
 fYzCKHYA0NDIfFVivpCethfaXfzUJ5hnS2Ax+2VI9yuNw3gNhfhIPoQ3yF3Bn2bjE9ld
 znHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CxeSMOub6619/Vo/I4fh/hAKT2CKDmbES7X5b4hBt8I=;
 b=myvmoIhRXl9PScy7f/9KAOWbRe9HSJoWmhH3AHpUEUZoBdLG0qqU+dPi9cTSOyYrun
 v0sZtTmy45v6sxmDmNT/CyKlsLBGSYvJC2RbtXuLvNGi/LK8GofJc7hUVYDIc2zc2oB0
 zW2AMzeUP2ZZNOmRNlKzuOiINU6hMYVsh2UX5tXyIvT7a/Ic7Aw/DUT52HF+aMswUteF
 WYdcUNNbeQGv7KAtBnF6UVIZt5TeM0QvqSafqITB77LGzG4ohzYm1zEy6fGe3fObyFGG
 LeHrPCCb51HX0gj5Yyr/PckW6KjDcaVcFKxWDlUT8pzeAfBr2k5CEFt85yqQWEF3OHvo
 H85w==
X-Gm-Message-State: AOAM532JmO2lYUzU0ej1KT/7EPQ7nckfTYAJt4LUEmaa/Tq+lY49aFZA
 EcIPZpd6aSo4ZwY+XJOwcq8cTYa+PW8DspoPD8n++A==
X-Google-Smtp-Source: ABdhPJymJ8VU7aQ0lQIoyaDdsEdp0vaAbuhPnh0m/5z8gGx7M8shBPPt2lx3rkcycP/wtHL30dI0Eb1TrqgFhFIuYCs=
X-Received: by 2002:a05:6638:d93:: with SMTP id
 l19mr330160jaj.68.1643939638018; 
 Thu, 03 Feb 2022 17:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20220128220156.4057446-1-jmeurin@google.com>
 <20220131110003.7aacad70@xps13>
In-Reply-To: <20220131110003.7aacad70@xps13>
From: Jean-Marc Eurin <jmeurin@google.com>
Date: Thu, 3 Feb 2022 17:53:47 -0800
Message-ID: <CAL3wywWSDJUsbgJf4NXctxJmrJRzyO9V-PVcu3qftM1GGPyU_Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtdoops: Fix the size of the header read buffer.
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_175402_204711_2EC71B08 
X-CRM114-Status: GOOD (  19.09  )
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

T24gTW9uLCBKYW4gMzEsIDIwMjIgYXQgMjowMCBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEplYW4tTWFyYywKPgo+IGptZXVyaW5AZ29v
Z2xlLmNvbSB3cm90ZSBvbiBGcmksIDI4IEphbiAyMDIyIDE0OjAxOjU2IC0wODAwOgo+Cj4gPiBU
aGUgcmVhZCBidWZmZXIgc2l6ZSBkZXBlbmRzIG9uIHRoZSBNVERPT1BTX0hFQURFUl9TSVpFLgo+
ID4KPiA+IFRlc3RlZDogQ2hhbmdlZCB0aGUgaGVhZGVyIHNpemUsIGl0IGRvZXNuJ3QgcGFuaWMs
IGhlYWRlciBpcyBzdGlsbAo+ID4gcmVhZC93cml0dGVuIGNvcnJlY3RseS4KPgo+IE9uIHdoYXQg
TGludXgga2VybmVsIHZlcnNpb24gYXJlIHlvdT8gSXQgbG9va3MgbGlrZSB3ZSBkb24ndCBzaGFy
ZSB0aGUKPiBzYW1lIGNvZGUgYmFzZSwgYXJlIHdlPwoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9t
dGQvbXRkb29wcy5jP2g9djUuMTctcmMyCmhhcyB0aGF0IGJ1Zy4gIElmIHlvdSB0cnkgdG8gaW5j
cmVhc2UgdGhlIE1URE9PUFNfSEVBREVSX1NJWkUsCmZpbmRfbmV4dF9wb3NpdGlvbigpIHdpbGwg
dHJ5IHRvIGRvIGFuIG10ZF9yZWFkKCkgb2YKTVRET09QU19IRUFERVJfU0laRSBieXRlcyBpbiBh
IGNvdW50IGJ1ZmZlciB0aGF0IGlzIGZpeGVkIHRvIG9ubHkgOApieXRlcy4KClRoYW5rcywKCkpl
YW4tTWFyYwoKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWFyYyBFdXJpbiA8am1ldXJp
bkBnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbXRkb29wcy5jIHwgMiArLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRvb3BzLmMgYi9kcml2ZXJzL210ZC9tdGRvb3Bz
LmMKPiA+IGluZGV4IDIyN2RmMjQzODdkZi4uMDlhMjY3NDdmNDkwIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9tdGQvbXRkb29wcy5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9tdGRvb3BzLmMKPiA+
IEBAIC0yMjMsNyArMjIzLDcgQEAgc3RhdGljIHZvaWQgZmluZF9uZXh0X3Bvc2l0aW9uKHN0cnVj
dCBtdGRvb3BzX2NvbnRleHQgKmN4dCkKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgbXRkX2luZm8g
Km10ZCA9IGN4dC0+bXRkOwo+ID4gICAgICAgaW50IHJldCwgcGFnZSwgbWF4cG9zID0gMDsKPiA+
IC0gICAgIHUzMiBjb3VudFsyXSwgbWF4Y291bnQgPSAweGZmZmZmZmZmOwo+ID4gKyAgICAgdTMy
IGNvdW50W01URE9PUFNfSEVBREVSX1NJWkUvc2l6ZW9mKHUzMildLCBtYXhjb3VudCA9IDB4ZmZm
ZmZmZmY7Cj4gPiAgICAgICBzaXplX3QgcmV0bGVuOwo+ID4KPiA+ICAgICAgIGZvciAocGFnZSA9
IDA7IHBhZ2UgPCBjeHQtPm9vcHNfcGFnZXM7IHBhZ2UrKykgewo+Cj4KPiBUaGFua3MsCj4gTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
