Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FC4C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 18:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1C561221
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 18:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D1C561221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1968uOhgpBDACtZqifKkIWTtyvZZKaXWwxex1C07Nc=; b=MZpn4KSiqmEyRo
	HJxTD0FIpRvrlUWErDz92LMJ5ZP/7pHPHp52+xn1NL/2VQZ09O0aUCRLgGcUOulzKHg8NFUmv0cOn
	FpBQdSJjYy4Fbz8sxXRXzJydNPtyiCw+dzFFm6iLQdv2lbtszoTQBiWwb1eG7dS+0MoZpaMI6+sc7
	ROtl85EPyCyc6jlSXfuUpOvq7Kuzwh/oAOqZePgPInOGiG6aHZ4GjtXYWCRhG4l697qA+FeXZhLi2
	IWlrKhsfohhzpIaTwinwlmkAloRbXm0OMcxCU9QSAB/XUuI31g6rCGwwe4l9DJpfU1oTHIbRDZA3V
	wqScijvUO+gUOk0xUAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH9CX-00Bq6o-SX; Fri, 20 Aug 2021 18:25:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH9CS-00Bq62-76
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 18:25:08 +0000
Received: by mail-ej1-x636.google.com with SMTP id gt38so21825805ejc.13
 for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2021 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tF/rYLQ+DtMioyJLcb3Pd0DjkRnK2a1fMohMiDkI93E=;
 b=BiEuWlvzwz1TCjxw7PuZdooB500Q4kzhIVUdIw3j2f/DYzySsEKyZHNG2apBbVlKd+
 S26tsKYb7CsPo4zgHSDtIzzYo00dcDHQDbnFmVFdGK44zilVcYPK8XbkEB0+pAMq50gC
 d4YZBHWkvFVZ1yHzBrmK/INfta5lh00UQTLjmPTz3Re3NlPs/oYT0HjmIRtpJk9TkiFY
 Ff3JYakC6Th0dSUjZssoBQ2UgXVUbcjpBstZ0r2py3h3LhDGnPij8AaFsW7zcw+tcLVo
 zI2dNXaeDh/LXQFbqvCN37iujdclM04i7cO/IY7dB1QRo+tCfc6BeP1HEMzkhkiqk5GF
 mnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tF/rYLQ+DtMioyJLcb3Pd0DjkRnK2a1fMohMiDkI93E=;
 b=ReZVJv56BLVSkTwp0FtxuAZ1iYusO3aCs8bCiZTJ9yXEJWXe1wMtbAeTvXzRnYtSPe
 tBFFaQoAWEkPJ98LENdATgTEO5tc9jWRgepTelCtuVufpDWXKzsDqA0fVNAMW7tQX5uD
 aIDgt8aqYwsq85vC3xuopazUpyz+mKWPb9rERkr66YxU4tEnGtFSFdSi8l8VGaOKPMUL
 gr3PPfU8GRTJw42TjRaBd5eGx+jyT9qE91yw7hDcPyZOMgy/hv6lvnFQ9mnJh022GdUx
 Uhre7AyknssaHxdXsKwhoCKEmsukkACVE/JTxxVIhyzO49eoqVOe7gYKBfM7+Wwh1O5C
 4Sag==
X-Gm-Message-State: AOAM533F9adfUvV/aUJ2WWd0Vx7L++saHT08BT0GEOXlpSuGUfgwe/uw
 jcMVCmRYqGPPaunDdFKrGYMzmZjbZFdjA5EtNPg=
X-Google-Smtp-Source: ABdhPJz7fGXk3BnM0WOR5XhOuGf6TCNsxu1Wo/01tMBExMGZe8icmT2pSL/tQVP6uELLgOsvWPMUd8g3QIqx0O0Ktmk=
X-Received: by 2002:a17:907:1043:: with SMTP id
 oy3mr3902073ejb.116.1629483901606; 
 Fri, 20 Aug 2021 11:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
 <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
 <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
 <1668790824.35266.1627559144878.JavaMail.zimbra@nod.at>
 <CAAEAJfDDtGcUquyP7Jn0Urttt4kSfAQbJ_qPQ90ROtWLavW9EA@mail.gmail.com>
 <CAOuPNLj+DSigRY_AgHQnGKCK-Vm4ykQBR8UfnTi2UObORTcBFg@mail.gmail.com>
In-Reply-To: <CAOuPNLj+DSigRY_AgHQnGKCK-Vm4ykQBR8UfnTi2UObORTcBFg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 20 Aug 2021 23:54:50 +0530
Message-ID: <CAOuPNLgfJGzp-RJBjydFDL1ZAvOd7=-MgXhnsb2eb_xFSLC66w@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_112504_342794_5C1426B7 
X-CRM114-Status: GOOD (  25.28  )
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

T24gVGh1LCAyOSBKdWwgMjAyMSBhdCAyMjo0MSwgUGludHUgQWdhcndhbCA8cGludHUucGluZ0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyOSBKdWwgMjAyMSBhdCAxNzozMywgRXplcXVp
ZWwgR2FyY2lhCj4gPGV6ZXF1aWVsQHZhbmd1YXJkaWFzdXIuY29tLmFyPiB3cm90ZToKPiA+Cj4g
PiBPbiBUaHUsIDI5IEp1bCAyMDIxIGF0IDA4OjQ1LCBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0PiB3cm90ZToKPiA+ID4KPiA+ID4gRXplcXVpZWwsCj4gPiA+Cj4gPiA+IC0tLS0t
IFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+ID4gPiBbc25pcF0KPiA+ID4gPgo+ID4gPiA+
IE91Y2gsIHNvIHN1cnByaXNlZCB0aGF0IGFmdGVyIGFsbCB0aGVzZSB5ZWFycyBzb21lb25lIGlz
IGRvaW5nIHNxdWFzaGZzL210ZGJsb2NrCj4gPiA+ID4gaW5zdGVhZCBvZiB1c2luZyB1YmlibG9j
ayA6LSkKPiA+ID4gPgo+ID4gPiA+IENhbiB3ZSBwYXRjaCBlaXRoZXIgS2NvbmZpZyBvciBhZGQg
c29tZSB3YXJuX29uY2Ugb24gbXRkYmxvY2sKPiA+ID4gPiB1c2FnZSwgc3VnZ2VzdGluZyB0byB1
c2UgdWJpYmxvY2sgaW5zdGVhZD8KPiA+ID4KPiA+ID4gYSBoaW50IGluIEtjb25maWcgbWFrZXMg
SU1ITyBzZW5zZS4gRG8geW91IHdhbnQgdG8gc2VuZCBhIHBhdGNoPwo+ID4gPiBBIHdhcm5pbmcg
aXMgdG9vIG11Y2ggc2luY2Ugb24gc29tZSB0aW55IGVtYmVkZGVkIHN5c3RlbSB3aXRoIE5PUiBm
bGFzaCBtdGRibG9jayBpcyBzdGlsbAo+ID4gPiBhIGdvb2QgY2hvaWNlLgo+ID4gPiB1YmlibG9j
ayBpcyBtb3N0bHkgdXNlZnVsIGZvciBOQU5EIGZsYXNoLgo+ID4gPgo+ID4gPiA+IEkgcmVtZW1i
ZXIgdGhlcmUgd2FzIHN0aWxsIHNvbWUgdXNlIGNhc2UocykgZm9yIG10ZGJsb2NrIGJ1dCBJIGNh
bid0IHJlbWVtYmVyCj4gPiA+ID4gbm93IHdoYXQgd2FzIGl0LCBwZXJoYXBzIHdlIHNob3VsZCBk
b2N1bWVudCB0aGUgZXhwZWN0YXRpb25zPwo+ID4gPiA+IChJcyB0aGF0IGZvciBKRkZTMiB0byBt
b3VudD8pCj4gPiA+Cj4gPiA+IGEgbG9uZyB0aW1lIGFnbyBtb3VudCBkaWRuJ3QgYWNjZXB0IGNo
YXJhY3RlciBkZXZpY2VzLCBzbyB5b3UgaGFkIHRvIHBhc3MgbXRkYmxvY2tYIHRvIG1vdW50Cj4g
PiA+IEpGRlMyLgo+ID4gPiBUaGlzIGxpbWl0YXRpb24gaXMgZ29uZS4KPiA+ID4KCkhpLAoKSnVz
dCBhIGZ1cnRoZXIgZm9sbG93LXVwIG9uIHRoaXMgZGlzY3Vzc2lvbi4KV2hldGhlciB0byB1c2Ug
L2Rldi9tdGRibG9jayBvciAvZGV2L3ViaWJsb2NrIGZvciByb290ZnMgKHNxdWFzaGZzKQptb3Vu
dGluZyBkdXJpbmcgYm9vdC4KCkFzIHN1Z2dlc3RlZCBoZXJlOgpJbnN0ZWFkIG9mIHVzaW5nIHRo
aXMgaW4ga2VybmVsIGNvbW1hbmQgbGluZToKWyAgICAwLjAwMDAwMF0gS2VybmVsIGNvbW1hbmQg
bGluZTogLi4uIHJvb3Rmc3R5cGU9c3F1YXNoZnMKcm9vdD0vZGV2L210ZGJsb2NrNDQgdWJpLm10
ZD00MCwwLDMwIC4uLgoKSSB1c2VkIHRoaXM6ClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5k
IGxpbmU6IC4uLiByb290ZnN0eXBlPXNxdWFzaGZzCnViaS5tdGQ9NDAsMCwzMCB1YmkuYmxvY2s9
MCwwIHJvb3Q9L2Rldi91YmlibG9jazBfMCAuLi4KClRoZSBkZXZpY2UgaXMgYm9vdGluZyBmaW5l
IHdpdGggdWJpYmxvY2sgYXMgd2VsbC4KQnV0LCBwZXIgc2F5LCBJIGNvdWxkIG5vdCBmaW5kIGFu
eSB2aXNpYmxlIGRpZmZlcmVuY2UuCkkganVzdCBvYnNlcnZlZCBhIHNsaWdodCBpbXByb3ZlbWVu
dCBpbiBib290IHRpbWUsIGJ1dCBJIG5lZWQgdG8KZG91YmxlLWNoZWNrIG9uIHRoaXMsIHdpdGgg
ZmV3IG1vcmUgcmVib290IGN5Y2xlcy4KCkFwYXJ0IGZyb20gdGhpcyB3aGF0IGFyZSB0aGUgb3Ro
ZXIgdmlzaWJsZSBiZW5lZml0cyBvZiB1c2luZyB1YmlibG9jawp3aGljaCBjYW4gYmUgZXhwbGFp
bmVkIHRvIGJlIG1hbmFnZW1lbnQgb3IgaW50ZXJuYWwgdGVhbSA/CkkgY291bGQgbm90IGZpbmQg
YW55IGRvY3VtZW50YXRpb24gZXhwbGFpbmluZyB0aGUgZGlmZmVyZW5jZSwgZXhjZXB0IHRoaXMg
b25lOgpodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRlYWQub3JnL2RvYy91YmkuaHRtbCNMX3Vi
aWJsb2NrCgpDYW4gc29tZW9uZSBhbHNvIHBvaW50IG1lIHRvIHRoZSByZXNwZWN0aXZlIGRyaXZl
ciBjb2RlIGluIGNhc2Ugb2YKdXNpbmcgL2Rldi9tdGRibG9jayBhbmQgL2Rldi91YmlibG9jayA/
CkFwYXJ0IGZyb20gdGhlb3J5IEkgYWxzbyB3YW50IHRvIGNoZWNrIHRoZSBpbXBhY3QgYXQgdGhl
IGNvZGUgbGV2ZWwuLgoKVGhhbmtzLApQaW50dQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
