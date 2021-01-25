Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89354C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 07:56:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E4522C9C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 07:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E4522C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=djXelOXqya0ubRHVH9FTosBx5y1FGdiKGMVfv9sVM7A=; b=HX0c7NdzweC7C06BUZcNBmbwb
	H3dqh27lE01bjzSo8fMNWA3LqwjXa2VMVnHQeLWeUwbOwuHnzV8OH0qBJsV/36FhD6BQJMA0LYY/I
	obCw/zksCQof//grpQptxjzJV4sX8JmcUvr1AJxafOSQ7bg2lEiuxQDOzdSODwhjPZiJ3qXBJTq5W
	jl73mQvi7GrRB7c6catjvccDU+rr/eBEF/jLJ6wuKVfUFRsBEfbhsKkgR5hWbb8wX3JwpUBUCg0h+
	COFLQsAxFftG1v4Co2q4e/M82sishfdnEacxzZOdcozGySHTbI2z34YTcO3CNXPxlyLLBbrQTLx6b
	YJIGAo5ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3wiz-0007eO-4d; Mon, 25 Jan 2021 07:55:49 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3wix-0007dv-5t
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 07:55:47 +0000
Received: by mail-qk1-x72e.google.com with SMTP id a12so1741984qkh.10
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2021 23:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HQfuLGY7+zwlDZhEg0OVcwQeT0assScp36yMfVSg3oQ=;
 b=CDAsSmmGGLHyrV7qmnqiaXRBNktT5aiE2Jq9jbYyXc7uncggROhQvZ9ZJmR4Xe452t
 y07O4FvZ287NIE/bjUM8hPOi2Zz5IZMbOXSQag6gNMbP0qkP7BibYQ74df/1mkbD1Lwj
 HdhJ805awRUoBSdzXnUjapwjeJj0wXidD4eU9jd9S1xy7iVzYheMKrjILck3v3INyKfn
 KbYeizeCSpXdGQt45JdkGkmQmQIaIsCuvcNLbxk0/iFguutGDeM+5MC9XU0P0k+Fziaw
 KCMxFOH0cAuovZnTFFADL0OsVZdV6a2QjE+3ehozQLqR06Ydtz0u1CWJttjwDihEl7y0
 ZoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HQfuLGY7+zwlDZhEg0OVcwQeT0assScp36yMfVSg3oQ=;
 b=BGZ/RkLrxEVV7l8kVxXed9rpOzCed7C2jrWvh0/AXjMx+iA2ijIvG1TfutcpvoPZ56
 cz4C3xaGqdwJISvd28sSKCqdzvFd/gxO+3bynjOUNViX4jhERcxRHo4GUamCWIMBdeUf
 VaHgC145Dy6HnAWlWQvjrV8xNI0eVfsDqWvrvQVVnEB41zWj+8s5wn+stNwlZyAPI8U6
 D9V+cipS/sCHnO+2qfc1LYS41gFJqPoCryx7lmw1fzs2qtL4kyIjSHIFtUgKak7OhbeG
 WIUaAC11l9J15h6+Sdi/fqUyGsAnkW8SnFW6IKay8enIiJ7+zVYwmuwzinnbpJJDrMGZ
 gBQg==
X-Gm-Message-State: AOAM532ypPlvlpYiDYVJ2dQ0H3OUjoj7ieG2eeEN3FJ9uHqSahYFvCfW
 c2Us2EzIvetKNON457Iy8XavWEdzOv6T60MVkss=
X-Google-Smtp-Source: ABdhPJwmg2MPDDk4q2QlROEE2AVJmZ/FfSYRqacNcDz1SW3eQdSbnXPO0bwxNnEesXXxgl+uGB6FqbLDg5c2GZMGRPQ=
X-Received: by 2002:a05:620a:46:: with SMTP id
 t6mr1483533qkt.108.1611561345329; 
 Sun, 24 Jan 2021 23:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20210122212229.17072-1-richard@nod.at>
 <20210122212229.17072-4-richard@nod.at>
 <5b51ff9c-8f5e-c348-5195-c0a0bf60b746@huawei.com>
 <cca6ac4f-4739-76be-9b48-b3643017a556@huawei.com>
In-Reply-To: <cca6ac4f-4739-76be-9b48-b3643017a556@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 25 Jan 2021 08:55:34 +0100
Message-ID: <CAFLxGvyHL5AMWcfLQg2fS6Nbp255yjve5nJ83ELYHnPhKp6Wxw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ubifs: Update directory size when creating whiteouts
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_025547_243582_E2465B4C 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Richard Weinberger <richard@nod.at>, David Gstir <david@sigma-star.at>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMjUsIDIwMjEgYXQgMjoxMiBBTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFv
MUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDIxLzEvMjMgMTA6NDUsIFpoaWhhbyBDaGVu
ZyDlhpnpgZM6Cj4KPiA+PiBAQCAtNDMwLDYgKzQzMyw3IEBAIHN0YXRpYyBpbnQgZG9fdG1wZmls
ZShzdHJ1Y3QgaW5vZGUgKmRpciwgc3RydWN0Cj4gPj4gZGVudHJ5ICpkZW50cnksCj4gPj4gICAg
ICAgcmV0dXJuIDA7Cj4gPj4gICBvdXRfY2FuY2VsOgo+IFN0aWxsIG9uZSBxdWVzdGlvbjoKPiA+
IERvZXMgdGhpcyBuZWVkIGEganVkZ21lbnQ/IExpa2UgdGhpcywKClRoZSBpZGVhIHdhcyB0aGF0
IGluIHRoZSAhd2hpdGVvdXQgY2FzZSwgc3pfY2hhbmdlIGlzIGFsd2F5cyAwLgoKLS0gClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
