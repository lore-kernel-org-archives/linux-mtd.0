Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E28AC63697
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 07:55:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DC72073C
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 07:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1tC6vHuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DC72073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iu5U81vIPOf9mmuFIuNPXxCsbZoVq+bVZBgmFioiRz8=; b=1tC6vHuJuqxXSbaN0Jq72W9uD
	sNScBx0w2oLHMcQfwINXu8Xg6+UgFxmYnIDImHbYZNenQ6YfuwWvTFUgG2hMprsPMv5xlG8ag1kFe
	6S3xS4AefXO/TJJ/0AzkU3RmUVrIGHRHKIm3Fm5CpHu/4LYIPI5NKfR/MgeqN/LKITTxFEJKOlx+W
	1jWpI9F2vKVNCfZ6/BUJuej69JSupa3bR46fTnmyE+jWaCvgBkIKEZ3TzBaKAjz3fyf/ftShhWYdo
	Q/U5pyomRq8/8IQiXkvFczr3AmJftt791yJHlvZzVlzh1xeOUTVDpSoV4LSOKZsAJ2FcL/ISbJmqB
	OHQ3cWvyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh6gE-0005H5-Ec; Mon, 23 Nov 2020 07:54:34 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh6gB-0005Ei-Ts
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 07:54:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 66671625DE1D;
 Mon, 23 Nov 2020 08:54:22 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uSaAkqWVZgvN; Mon, 23 Nov 2020 08:54:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 22D4E625DE24;
 Mon, 23 Nov 2020 08:54:22 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KimVQF91ahyd; Mon, 23 Nov 2020 08:54:22 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0847E625DE1D;
 Mon, 23 Nov 2020 08:54:22 +0100 (CET)
Date: Mon, 23 Nov 2020 08:54:21 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sergei Poselenov <sposelenov@emcraft.com>
Message-ID: <115359785.11218.1606118061930.JavaMail.zimbra@nod.at>
In-Reply-To: <20201123103706.13a56898@sergmir.emcraft.com>
References: <20200924113518.7c6dda33@sergmir>
 <CAFLxGvyp9C6BuM3V3DDxCrs3LCuWc0dJgACZShB5qU01SHwh2Q@mail.gmail.com>
 <20201123103706.13a56898@sergmir.emcraft.com>
Subject: Re: Help with UBI failure analysis
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: Help with UBI failure analysis
Thread-Index: MdMkVfAVg8u6yOTncsFdbNN3Oo/zGQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_025432_098983_5E270137 
X-CRM114-Status: UNSURE (   5.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2VyZ2VpLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IC4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uCj4gLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4udWJpMSB3YXJuaW5nOiB1YmlfZWJhX2NvcHlfbGViOiByZWFk
IGRhdGEKPiBiYWNrIGZyb20gUEVCIDg5NSBhbmQgaXQgaXMgZGlmZmVyZW50CgpzZWVtcyB0byBt
ZSBsaWtlIGEgbXRkIGRyaXZlciBpc3N1ZS4KVUJJIHJlYWRzIGJhY2sgdGhlIGRhdGEgaXQganVz
dCB3cm90ZSwgdGhlIGhlIHJlc3VsdCBpcyBub3QgdGhlIHNhbWUuClBsZWFzZSBub3RlLCBpbiBy
ZWNlbnQga2VybmVscyB0aGlzIGNoZWNrIG5vIGxvbmdlciBleGlzdHMsIHNvIHRoZSBmYWlsdXJl
IHdpbGwgbG9vayBkaWZmZXJlbnQuCgpUaGFua3MsCi8vcmljaGFyZAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
