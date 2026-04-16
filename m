Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97E1F433DD
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 03:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Levzns6xdjbcsQMkVR4XYq/dsRWetDNutT27oatfUyg=; b=f+fLMGZNDdj8nQ
	w8VjLlmVMon/avCR0RZW3Q2s2QCciHPfIc7tU+HMSmWqsWZrFi9j2AhKC3wARw7YtEFwS1rilMNLy
	so+unXYjD/G7XGxpsStvH49AuozP2sYrlfXfp7vpB0gj9aQIRDShw7Dan8TM7p6zCbP+S7cHVr4Ev
	gxs/5/xRzZdf5P+v15DD+YsuYIFNajuC8Q4ssGseDAaECtEs5yA4pUyfWChH2upgk5wf0RThCSJc2
	/OJB0oe7DaaTe7gAzSR52CskDZOLnPN4fHtkv0mDXNF6WYkz9QkecQmAWtv8arFqVFnkQ6eS+6PiD
	mcaHqGyFF8eN6Lg6BybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDVT-00000001vqx-26P2;
	Thu, 16 Apr 2026 03:35:07 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDVQ-00000001vqa-3ur0
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 03:35:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6715006f4f7so6761444a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 20:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776310503; cv=none;
        d=google.com; s=arc-20240605;
        b=K7/l69BN+h3oST2TlGtefedMfHEHV7ipQXgWIrgR2Zzcv5iW6WF/Crwgovf+zEcseI
         CDTHztSHB8jjPYUoED32a4ycXK+0DA5915FEm3Spxw1+MG/EuNfoMoujpX8M2Gq3gxPs
         JepzKCqxcXezYbrYBpjG+ECCp6ZDukIduEQGtPXjl9ONnFuKjMKEiRIUZ9t8sNNgzITF
         U3ncgio66ea+0lnnQuSW9ZKO65k2VJstyNocOzH8Cr1tP4uEgh0r6tWwGOp/6Lu6IJys
         4rqiZZcqSFp/MB/ZhWKXqLAqXfW2bCxGRSOy+23XlzUzAE+xo/L452h5Kdl5CtMTk2oj
         ZuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/SRRbafW8S1JoLsCklgG/xA3ps86quLF/hHDOQaA5k=;
        fh=4bvZkWNtPG3I9eKYRvPMKgXwbrN8KP79e9XA2C8gDi8=;
        b=aXE+CPbLSDDQ1ozuOhwPBW1W6qmfG4wu95HfXMrDboGaRBjGSz+3Fg3N1y8PRSdBXZ
         oAC819jKnAyrE/BIpVnPsMW9v4Npb3VirctfngDtTWWuCU4hn7jhaRfCCkYQsDdnvK25
         PGqgfTyWLqke6FYYmxIOn/GoSZX2usKB5U83HG79N+8DCjibL11atvB3VSEBz8Tfj5v+
         DvKbEzzc8K85FtoLwR9Mao/caxc3npXIvMyAaThxItra94CwBIH+Q3ydMM4GfN8lujmS
         +ET+SL7ZQMTrTwJPABj/rqg3aE75JhrmGuAI/B1kVl3bRwRZhXOrAOKEI3yAFcAfC5Zj
         gXBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776310503; x=1776915303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/SRRbafW8S1JoLsCklgG/xA3ps86quLF/hHDOQaA5k=;
        b=HhOWQSExzzxt/MayEbH8An0OwiQVkgVBOOTO8DvYS/7Ixr9IdKHqpj1MFUDswQf16O
         0r3p3igGGrcuNohHnqMZZUCe0OsRmFUAE1MbdMPHVRnE6kcPc5COTKxhHD9VNknxaIik
         977O0QIA4tH1b3oecb+vqLI1MJwuNU/kWsHB4ygEXpLEK9ADfXzL1QOZ7xiCzRdVKRPv
         wN9br9hBomEfjOE5j1sd1UbZHJY9i87UzJPFrWFgl1s44TZSUjlEUsZwfCWHiNX87/tE
         Ttoh4fCJEuzZJDyjP9EaQIGO1XT6LSMECv0ueAk98gI2Uz0U3btN3dzULiTJhtQq3ETA
         429g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776310503; x=1776915303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/SRRbafW8S1JoLsCklgG/xA3ps86quLF/hHDOQaA5k=;
        b=OFQeJeHX66/17+eDDDUb0s5FObxuFajQi8ehUO7SAivf6/78vluw1c4TU77xpaHn10
         4nTuwI0K1wLBDDfhlSNz3g/GWJNe7M00psSpVaX3PBHAC8gty+3Cp6jtQIrC/Ne1CxCD
         IKXrIPJI6VgqVuE80B/fDog7KG8yroXzJ93XhZt8U1zqwR16ceo7aTy/DaIj8Q/DnKaI
         F8k9yt4NX9N1sEMYgwNE2jKwn/L9NAzKtMe75YGwaa2vsg9eeJtyAXjIsbRwfXocf9Zc
         ThYaetDp+V3Hw+umykq4sICwKyB3kOoRhAy+vNeJQ+QsEJ5YNtSyaDmSgehqnGoz/w9j
         J0qw==
X-Forwarded-Encrypted: i=1; AFNElJ9ueiYrlIZBjt5wr3XwyohBkFVs7iRr/Ti210buQhwpVpAAfhrCiHhpVIn12hqF9s0ZXtpxnIGayEY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAETRUrsckf9E4bLJKwqvwIh/ClbrRE5/60qYhEqQJwMCY140p
	sLqetwKZHJwxSnMNvOEOzZvgssxioxAq5VtFr/1gO/9H+7UrvZJEXu2hrPC2PnefpvCE2+xtuSu
	eojhppDSki9ThBIXJdByRbgt6yJjTUkA=
X-Gm-Gg: AeBDietRbRuvDnN7F4jVNSPRQCZlyict4B0MHa1EYfgz3Bq8xhZjt0419Tgr1Z/j3C4
	PJTTLgMgWmqykEYezgSeDcDo7qe4jSrZZwLXQnGaLFxXQA9VCj8UOJ4JLtvYbX0r7UMsQ/4m/tx
	x/ac6egOgepYBQM0C1DJ5wTpegIzc3nwadWRm4GgzfIL5Cy4be03V0ibmUHpsN6EiR35EzZyY9x
	0AmKlPlEy2cW0GSmw1+Oc7TvHxAo8CtTcCEQJuK6CWps37Hw7x3xQuHGnEAVCxg0rLMG5YRvkEO
	R2ZmKR8kWWNXifZm
X-Received: by 2002:a05:6402:a0db:b0:66e:5622:a2e with SMTP id
 4fb4d7f45d1cf-670798f065bmr10717002a12.22.1776310502888; Wed, 15 Apr 2026
 20:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260416011128.45754-1-dbgh9129@gmail.com> <26c9c959-a3b6-e1de-1215-887990a46870@huawei.com>
In-Reply-To: <26c9c959-a3b6-e1de-1215-887990a46870@huawei.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Wed, 15 Apr 2026 23:34:51 -0400
X-Gm-Features: AQROBzC3cH7QOw0XNn3Tam6Xdzuf1sJAOxu1FHayVi7Q9MEIADp44N6_Uo_53J8
Message-ID: <CACrCO_WrgZBQ_4dH5yn0T=W-2erwqKm2FqmH_c=cG3dtc5ZNng@mail.gmail.com>
Subject: Re: [PATCH v1] mtd: ubi: fix kref leak on -EBUSY return in ubi_detach_mtd_dev()
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Kim, Taegyu" <tmk5904@psu.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_203504_992649_91796E82 
X-CRM114-Status: GOOD (  19.83  )
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

RGVhciBaaGloYW8sCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgYXBwcmVjaWF0ZSB5b3Vy
IGZlZWRiYWNrIG9uIHRoaXMgZml4LgoKQmVzdCByZWdhcmRzLApZdWhvCgpPbiBXZWQsIDE1IEFw
ciAyMDI2IGF0IDIzOjIyLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3
cm90ZToKPgo+IOWcqCAyMDI2LzQvMTYgOToxMSwgWXVobyBDaG9pIOWGmemBkzoKPiA+IHViaV9k
ZXRhY2hfbXRkX2RldigpIGNhbGxzIHViaV9nZXRfZGV2aWNlKCkgd2hpY2ggaW5jcmVtZW50cyBi
b3RoCj4gPiB1YmktPnJlZl9jb3VudCBhbmQgdGhlIGRldmljZSBrcmVmIHZpYSBnZXRfZGV2aWNl
KCkuIFdoZW4gdGhlIGRldmljZQo+ID4gaXMgYnVzeSBhbmQgYW55d2F5PT0wLCB0aGUgZnVuY3Rp
b24gcmV0dXJucyAtRUJVU1kgYWZ0ZXIgcmVsZWFzaW5nCj4gPiB1YmlfZGV2aWNlc19sb2NrLCBi
dXQgbmV2ZXIgY2FsbHMgcHV0X2RldmljZSgpIHRvIGRyb3AgdGhlIGtyZWYKPiA+IGFjcXVpcmVk
IGJ5IHViaV9nZXRfZGV2aWNlKCkuIFRoaXMgbGVha3MgdGhlIGtyZWYsIHByZXZlbnRpbmcgdGhl
Cj4gPiBkZXZpY2UgZnJvbSBldmVyIGJlaW5nIGZyZWVkLgo+ID4KPiA+IENvbW1pdCA3ZTg0Yzk2
MWIyZWIgKCJtdGQ6IHViaTogaW50cm9kdWNlIHByZS1yZW1vdmFsIG5vdGlmaWNhdGlvbgo+ID4g
Zm9yIFVCSSB2b2x1bWVzIikgbW92ZWQgcHV0X2RldmljZSgpIHRvIGFmdGVyIHViaS0+aXNfZGVh
ZCA9IHRydWUKPiA+IHRvIHBhaXIgaXQgd2l0aCB0aGUgbm90aWZ5K251bGxpZnkgc2VxdWVuY2Us
IGJ1dCBpbmFkdmVydGVudGx5IGxlZnQKPiA+IHRoZSBlYXJseSAtRUJVU1kgcmV0dXJuIHdpdGhv
dXQgYSBtYXRjaGluZyBwdXRfZGV2aWNlKCkuCj4gPgo+ID4gQWRkIHB1dF9kZXZpY2UoJnViaS0+
ZGV2KSBiZWZvcmUgcmV0dXJuaW5nIC1FQlVTWSB0byBiYWxhbmNlIHRoZQo+ID4gZ2V0X2Rldmlj
ZSgpIGluc2lkZSB1YmlfZ2V0X2RldmljZSgpLgo+ID4KPiA+IEZpeGVzOiA3ZTg0Yzk2MWIyZWIg
KCJtdGQ6IHViaTogaW50cm9kdWNlIHByZS1yZW1vdmFsIG5vdGlmaWNhdGlvbiBmb3IgVUJJIHZv
bHVtZXMiKQo+ID4gU2lnbmVkLW9mZi1ieTogWXVobyBDaG9pIDxkYmdoOTEyOUBnbWFpbC5jb20+
Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAxICsKPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
dWJpL2J1aWxkLmMgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ID4gaW5kZXggNjc0YWQ4Nzgw
OWRmMC4uZDgxZjVlMDM5NWFjMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWls
ZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ID4gQEAgLTExMDYsNiArMTEw
Niw3IEBAIGludCB1YmlfZGV0YWNoX210ZF9kZXYoaW50IHViaV9udW0sIGludCBhbnl3YXkpCj4g
PiAgICAgICBpZiAodWJpLT5yZWZfY291bnQpIHsKPiA+ICAgICAgICAgICAgICAgaWYgKCFhbnl3
YXkpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmdWJpX2RldmljZXNf
bG9jayk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHV0X2RldmljZSgmdWJpLT5kZXYpOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiAgICAgICAgICAgICAg
IH0KPiA+ICAgICAgICAgICAgICAgLyogVGhpcyBtYXkgb25seSBoYXBwZW4gaWYgdGhlcmUgaXMg
YSBidWcgKi8KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
