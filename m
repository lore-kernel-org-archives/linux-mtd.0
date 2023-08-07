Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4C9EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJOhOsFUGAf0E04uiLyop0k+7A/nUMrnbDGQ0/yFh5Y=; b=rgbx15tqY2ct7D
	f7Vc9Bkbr2Xvf0osyy6JNNnZJz8cXXddnsoWcv8s2UqUeVQHHdx92dN98sFQ4SyEQTeu9eLm+FSu4
	2PN3E5lLTpT9piEznEV+Wf/ILRpnljgGxXS+t004E2hDrBb+Vgt0EQgMqc6yVfvuYP33N2nwkg5ox
	zBQSqIQVjqVrIE+IuqRxzfk4wZqEjapXmsZcAxJqmfZjT84ghaKBSQp+mFl/I365NN0HvxoO6/UUP
	Pw9K7nYrgUoHZwmWWC5rcxi0zTRMyj1l6Ip2fFDLTsLiNjkWoJk3gwW/OLvSY1ZVEozxzhoCU6HEI
	++SJFCiiT7snW64VLFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwkl-00GaO9-2a;
	Mon, 07 Aug 2023 09:42:19 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwki-00GaND-30
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 09:42:18 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-563393b63dbso657008eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 02:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691401333; x=1692006133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK5JqTcazrnzFQkUb1pgAiTMlQXrShoQJmEX5JHWXhU=;
        b=Qt8fcgcdZE/6OlZDuZrOY1+HmrxryIwYNWHpObaVwAn9NWCNAXAUMmU5suzpPDWYBL
         wLklj3lqV5jttQWGGa3z9vIXOrEufoZNOsjUjYzNyLJ4A5vTIHj7oL0rK5qRKPXW6T7Z
         6cqTGXnJoiWeZpfKL9FMzqICslYrlb2/rxrJlBmQ004dGj9z/pWqnCBK/M+WZyOeYLmP
         Giq1Tadot+h2ITfIGTYfpl2YI5KU12pTJnqMGQgGjPpb/Gd33VASD4ziFCY9e6/f9Sn6
         S7NEX+mXyAvlJ6Sv4FBKXJcAuzkdeLlEEpFCAZQOcvWTA3Pt4tI+0EtNhyklGXNfz+ux
         NrBQ==
X-Gm-Message-State: ABy/qLYSI48aHUlQCU+JgsLGe9SswDZKwb209xiv7XySWtOSYqWt7SXu
	nrV891Of63c5EGwcWYJ4Yx349rFzz2YuprrXyJI=
X-Google-Smtp-Source: APBJJlEb7O2dGAF/f7fTBx/HAisyhbmiTj3PawRftJoMI15JdDVqSBYI20CfGwr14y35bjypNJI9KK+xc439zbfSIBc=
X-Received: by 2002:a4a:cf14:0:b0:569:a08a:d9c5 with SMTP id
 l20-20020a4acf14000000b00569a08ad9c5mr19679264oos.0.1691401333651; Mon, 07
 Aug 2023 02:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230807083356.19222-2-vbabka@suse.cz>
In-Reply-To: <20230807083356.19222-2-vbabka@suse.cz>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 7 Aug 2023 11:41:58 +0200
Message-ID: <CAJZ5v0g_OjHSdM_oi515KQUrFZvZH4hNgCy4xknosQC+81GYhw@mail.gmail.com>
Subject: Re: [PATCH for 6.5 regression] PM: hibernate: fix resume_store()
 return value when hibernation not available
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Jens Axboe <axboe@kernel.dk>, 
	dm-devel@redhat.com, gregkh@linuxfoundation.org, hch@lst.de, 
	joern@lazybastard.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-pm@vger.kernel.org, loic.poulain@linaro.org, miquel.raynal@bootlin.com, 
	regressions@lists.linux.dev, richard@nod.at, snitzer@kernel.org, 
	vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_024216_968186_5C1EDEF6 
X-CRM114-Status: GOOD (  22.74  )
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

T24gTW9uLCBBdWcgNywgMjAyMyBhdCAxMDozNOKAr0FNIFZsYXN0aW1pbCBCYWJrYSA8dmJhYmth
QHN1c2UuY3o+IHdyb3RlOgo+Cj4gT24gYSBsYXB0b3Agd2l0aCBoaWJlcm5hdGlvbiBzZXQgdXAg
YnV0IG5vdCBhY3RpdmVseSB1c2VkLCBhbmQgd2l0aAo+IHNlY3VyZSBib290IGFuZCBsb2NrZG93
biBlbmFibGVkIGtlcm5lbCwgNi41LXJjMSBnZXRzIHN0dWNrIG9uIGJvb3Qgd2l0aAo+IHRoZSBm
b2xsb3dpbmcgcmVwZWF0ZWQgbWVzc2FnZXM6Cj4KPiAgIEEgc3RhcnQgam9iIGlzIHJ1bm5pbmcg
Zm9yIFJlc3VtZSBmcm9tIGhpYmVybmF0aW9uIHVzaW5nIGRldmljZSAvZGV2L3N5c3RlbS9zd2Fw
ICgyNHMgLyBubyBsaW1pdCkKPiAgIGxvY2tkb3duX2lzX2xvY2tlZF9kb3duOiAyNTMxMTE1NCBj
YWxsYmFja3Mgc3VwcHJlc3NlZAo+ICAgTG9ja2Rvd246IHN5c3RlbWQtaGliZXJuYTogaGliZXJu
YXRpb24gaXMgcmVzdHJpY3RlZDsgc2VlIG1hbiBrZXJuZWxfbG9ja2Rvd24uNwo+ICAgLi4uCj4K
PiBDaGVja2luZyB0aGUgcmVzdW1lIGNvZGUgbGVhZHMgdG8gY29tbWl0IGNjODljNjNlMmZlMyAo
IlBNOiBoaWJlcm5hdGU6Cj4gbW92ZSBmaW5kaW5nIHRoZSByZXN1bWUgZGV2aWNlIG91dCBvZiBz
b2Z0d2FyZV9yZXN1bWUiKSB3aGljaAo+IGluYWR2ZXJ0ZW50bHkgY2hhbmdlZCB0aGUgcmV0dXJu
IHZhbHVlIGZyb20gcmVzdW1lX3N0b3JlKCkgdG8gMCB3aGVuCj4gIWhpYmVybmF0aW9uX2F2YWls
YWJsZSgpLiBUaGlzIGFwcGFyZW50bHkgdHJhbnNsYXRlcyB0byB1c2Vyc3BhY2UKPiB3cml0ZSgp
IHJldHVybmluZyAwIGFzIGluIG51bWJlciBvZiBieXRlcyB3cml0dGVuLCBhbmQgdXNlcnNwYWNl
IGxvb3BpbmcKPiBpbmRlZmluaXRlbHkgaW4gdGhlIGF0dGVtcHQgdG8gd3JpdGUgdGhlIGludGVu
ZGVkIHZhbHVlLgo+Cj4gRml4IHRoaXMgYnkgcmV0dXJuaW5nIHRoZSBmdWxsIG51bWJlciBvZiBi
eXRlcyB0aGF0IHdlcmUgdG8gYmUgd3JpdHRlbiwKPiBhcyB0aGF0J3Mgd2hhdCB3YXMgZG9uZSBi
ZWZvcmUgdGhlIGNvbW1pdC4KPgo+IEZpeGVzOiBjYzg5YzYzZTJmZTMgKCJQTTogaGliZXJuYXRl
OiBtb3ZlIGZpbmRpbmcgdGhlIHJlc3VtZSBkZXZpY2Ugb3V0IG9mIHNvZnR3YXJlX3Jlc3VtZSIp
Cj4gU2lnbmVkLW9mZi1ieTogVmxhc3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4KPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gQWNrZWQtYnk6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gLS0tCj4gUmVzZW5k
IHdpdGggcmV2aWV3L2FjayB0YWdzIGFkZGVkIGFuZCBub3QgYnVyaWVkIGluIHRoZSB0aHJlYWQu
Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzJjZmE1ZjU1LTFkNjgtOGE0Zi1k
MDQ5LTEzZjQyZTBkMTQ4NEBzdXNlLmN6Lwo+Cj4gIGtlcm5lbC9wb3dlci9oaWJlcm5hdGUuYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5jIGIva2VybmVsL3Bvd2VyL2hp
YmVybmF0ZS5jCj4gaW5kZXggZTFiNGJmYTkzOGRkLi4yYjRhOTQ2YTZmZjUgMTAwNjQ0Cj4gLS0t
IGEva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5jCj4gKysrIGIva2VybmVsL3Bvd2VyL2hpYmVybmF0
ZS5jCj4gQEAgLTExNjYsNyArMTE2Niw3IEBAIHN0YXRpYyBzc2l6ZV90IHJlc3VtZV9zdG9yZShz
dHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGtvYmpfYXR0cmlidXRlICphdHRyLAo+ICAgICAg
ICAgaW50IGVycm9yOwo+Cj4gICAgICAgICBpZiAoIWhpYmVybmF0aW9uX2F2YWlsYWJsZSgpKQo+
IC0gICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIG47Cj4K
PiAgICAgICAgIGlmIChsZW4gJiYgYnVmW2xlbi0xXSA9PSAnXG4nKQo+ICAgICAgICAgICAgICAg
ICBsZW4tLTsKPiAtLQoKQXBwbGllZCBhcyA2LjUtcmMgbWF0ZXJpYWwsIHRoYW5rcyEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
