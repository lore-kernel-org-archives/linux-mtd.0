Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F2BC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 12:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1847A613C0
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1847A613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ha4w0US9kIYN6aEtOO1WEwgsvBpVSYTcToE63dTv6H0=; b=zjsrGQfKkea+rQ
	kiBLNYSRvL+nHsprAkDYPaaOerTRPkw3Lj5ranP4OZsAn3GWbJX4C8S2Hr4JPnBMcJDVAIdHFeJ2P
	ZiW0XzCktnkxLvv5uxD8qX+y7f7PTenxFv5jBbSPnZZO0W4/txzfcAEIYR540tmVRZ2V3iXi23v7D
	SX6H78e6coZrPr9uMAW23BAiNFkErvm4L2k/r6nXEp570f3hCum3XTarYILCLWoU08ONN7hJap8i6
	JFh9+waCDMu55tPX6HhnNzWVveovgEa97sBVg54M6/DKydtppAq5iXYRKrmyvlu1o1ghnUhuXvr7f
	t5unJBlBYW36nqHb0glg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrKAk-000mOb-Fw; Thu, 10 Jun 2021 12:52:34 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrKAh-000mO0-8N
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 12:52:32 +0000
Received: by mail-ej1-f41.google.com with SMTP id og14so38684773ejc.5
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2021 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BIJBn/I6DRBXkEoZUzmiw1Hh2oOM7OAEUZCbmNimrwY=;
 b=JkluSf/kl2F7pNpCnxbzkaVwHuZZbX004ST6XQIMXpUB48TnjcdtkwyMJF3vjfK+US
 dCsa1LW5/u5uVXRow00lXdnBnabFjYoxv4ih3oGHdLwcYW7N+3t0VO///nBRaMPE4CQM
 y17F3pnDnvPxrH6LrAPIZJiWTHw6yzLRGkG9q+XdGSy8RojgFDBH14Qwf1/0YGP6JfgV
 ir1CGl09B0TG9crbxf1wpzWsS9/iGdKfXfAZqTthgRm/AfsIbHcNB3tOSzicfcQfkc49
 YOaec5jHZNOY0VZ5bDGQg/uwbGnJzwfcCZ9ESx6gRYiB/iYHZxpQ+ZAuoXqaZ2N4hECy
 IBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BIJBn/I6DRBXkEoZUzmiw1Hh2oOM7OAEUZCbmNimrwY=;
 b=NaOQgQFGhShxXSmg/pcQKyvaOeHO/biZJepWpyzTS5ZgOTufSoy7H9wxt+fAtJVH6V
 38BXj5VWbqeWMZGxLjPN6tzWCo6+bMfo1X72rN228UCWbBo8ortyVwLuA2K+Y9sCxb6U
 xFauvRdX8GV8sHe1+ImySuz6QahQuiMkQkdgYjhTGsiF3+/rr//zjKLWe7tVOWKk0keL
 a0XiCvrYxNZEk0f0On7IWwFlgKhoCcyCVS8LAO11WUD1PP4L4HCrfXS9j5vyKKSN9P7Q
 UefnWxe6swqTiL5FI+B7Ilf4EollMSlxz2Hs0B+due9QBhjLg9V/2ADOQihQ9B8SmA6L
 3PaQ==
X-Gm-Message-State: AOAM532c3YoZmXNEOy0Xx7Pj2ze243hHrEv6p0+Oh0ovFfVvaBBuShAT
 zu2pussd0ySBA92AQyzlF26wZwGc9FKyseP0qPPUozHQN78=
X-Google-Smtp-Source: ABdhPJxXGCyOtIxT2sWmcCzl9YoKQTh3945/iYZzq+xMr4L07m30j9mVZpaBSttdKfgV16WQ8kEgWktAM7iiCMaEC60=
X-Received: by 2002:a17:906:c293:: with SMTP id
 r19mr4417749ejz.252.1623329489454; 
 Thu, 10 Jun 2021 05:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiRDZ9M4n3uh=i6FpHXoVEWMHpt0At8YaydrOM=LvSvdg@mail.gmail.com>
 <295072107.94766.1623262940865.JavaMail.zimbra@nod.at>
In-Reply-To: <295072107.94766.1623262940865.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 10 Jun 2021 18:21:18 +0530
Message-ID: <CAOuPNLhPiVgi5Q343VP-p7vwBtA1-A5jt8Ow4_2eF4ZwsiA+eQ@mail.gmail.com>
Subject: Re: qemu: arm: mounting ubifs using nandsim on busybox
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_055231_341118_58CCED7B 
X-CRM114-Status: GOOD (  16.42  )
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

T24gV2VkLCA5IEp1biAyMDIxIGF0IDIzOjUyLCBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0PiB3cm90ZToKPgo+IFBpbnR1LAo+Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAt
LS0tLQo+ID4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50
IHJvb3QgZnMgb24gdW5rbm93bi1ibG9jaygzMSwwKQo+ID4gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiA+Cj4gPiBJZiBhbnkgb25lIGhhcyB1c2VkIG5hbmRzaW0gb24gcWVtdSBiZWZv
cmUsIHBsZWFzZSBsZXQgdXMga25vdyB0aGUgZXhhY3Qgc3RlcHMuCj4KPiBuYW5kc2ltIHdvcmtz
IGFzIGV4cGVjdGVkLiBJdCBjcmVhdGVzIGEgbmV3IGFuZCAqZXJhc2VkKiBOQU5EIGZvciB5b3Uu
Cj4gU28geW91IGhhdmUgbm8gVUJJIHZvbHVtZXMuIFRoZXJmb3JlIFVCSUZTIGNhbm5vdCBiZSBt
b3VudGVkLgo+IEkgc3VnZ2VzdCBjcmVhdGluZyBhIHRpbnkgaW5pdHJhbWZzIHRoYXQgY3JlYXRl
cyBVQkkgdm9sdW1lcyBiZWZvcmUgbW91bnRpbmcgVUJJRlMgb24KPiBvbmUgb2YgdGhlIGZyZXNo
bHkgY3JlYXRlZCAoYW5kIGVtcHR5KSB2b2x1bWVzLgo+Cm9oIHNvcnJ5IEkgZm9yZ290IHRvIG1l
bnRpb24gdGhpcy4KSSBhbSBhYmxlIHRvIGNyZWF0ZSBhbmQgdXBkYXRlIHZvbHVtZXMgbWFudWFs
bHkgYWZ0ZXIgYm9vdGluZyB0aGUKc3lzdGVtIHdpdGggaW5pdHJhbWZzLgp7e3sKQ3JlYXRpbmcg
cm9vdGZzIHZvbHVtZToKbWtub2QgL2Rldi91YmkwIGMgMjUwIDAKbWtub2QgL2Rldi91YmkwXzAg
YyAyNTAgMQp1YmlhdHRhY2ggL2Rldi91YmlfY3RybCAtbSAyCnViaW1rdm9sIC9kZXYvdWJpMCAt
TiByb290ZnMgLW0KdWJpdXBkYXRldm9sIC9kZXYvdWJpMF8wIHViaWZzLXJvb3Rmcy5pbWcKbW91
bnQgLXQgdWJpZnMgdWJpMDpyb290ZnMgdWJpLXJvb3QvCn19fQoKQnV0IEkgd2FudGVkIHRvIGRv
IGFsbCB0aGVzZSBhdXRvbWF0aWNhbGx5IGR1cmluZyBib290IHRpbWUgaXRzZWxmLgpBbHNvIEkg
d2FudGVkIHRvIHVzZSB1YmluaXplLmNmZyBhcyBpcyBmcm9tIHRoZSBvcmlnaW5hbCBzeXN0ZW0g
YW5kCnNpbXVsYXRlIGV2ZXJ5dGhpbmcgdXNpbmcgcWVtdSBhbmQgbmFkc2ltIChpZiBwb3NzaWJs
ZSkKU28gSSB0aG91Z2h0IGl0IG11c3QgYmUgcG9zc2libGUgYnkgc2V0dGluZyBzb21lIHBhcmFt
ZXRlcnMgaW4gcWVtdSBzdWNoIGFzOgptdGRwYXJ0cz1uYW5kOiwKLWRldmljZSBuYW5kLGNoaXBf
aWQ9MHgzOSxkcml2ZT1tdGQwLAotZHJpdmUgaWY9bXRkLGZpbGU9Li91YmktYm9vdC5pbWcsaWQ9
bXRkMCwKYW55dGhpbmcgZWxzZSA/CgpPciBtYXliZSBkbyBzb21ldGhpbmcgYXQgdGhlIGJvb3Qg
dGltZSBpdHNlbGYgdG8gbG9hZCB0aGUgdm9sdW1lIGltYWdlID8KSWYgdGhlcmUgYXJlIHNvbWUg
cG9zc2liaWxpdGllcyBwbGVhc2UgbGV0IG1lIGtub3cuCldpdGggdGhpcyBJIGNhbiB1c2UgbXkg
b3JpZ2luYWwgc2V0dXAgYXMgaXQgaXMgYW5kIHZlcmlmeSBldmVyeXRoaW5nCndpdGggZGlmZmVy
ZW50IGtlcm5lbCB2ZXJzaW9ucy4KClRoYW5rcywKUGludHUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
