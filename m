Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B481DC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 13:49:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5CF64D9D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 13:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5CF64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UH2Ct8+TxByNpSQ5ry5oZU5rdKFki388ZqWMpY7tZ3k=; b=p8mRHir+0mqI5/o0t+mVhtIJg
	oNG29dN6fhEHTgqjZu4NSwToFyR5WMgNDDnxDUmgiDK8OU6xZFnZz3STDKkn+H39UNrL/utrS2crM
	hSAsBMCkWj30SSY6nY8GfZJu1DiK57SD+6g8zYckfs1N9AxF7IGkE0TlqdeCIw+EbzOJKDF1JlJPB
	DwCELXUhu+pguI9kPLl58A2JklZ1AL25CQT1gS3vM2+nY6YvDVjIMfPd6nYwB7OYuXrNXepLHuBzi
	Yi0tvI7rzKKbbVzV4FeQRAKQ0doO3JelfYf6NvvRv9Kkzo6zH45Dm5/PEflDREJQT+SdHa2Sn9ttr
	Zkz1ydNWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBeFR-0002gO-7h; Mon, 15 Feb 2021 13:49:09 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBeFO-0002fw-9p
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 13:49:07 +0000
Received: by mail-yb1-xb33.google.com with SMTP id b10so7234776ybn.3
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2021 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tewnbC3dv6CLWZYjCSkkFhNn2HY0qxkNK1L1Y+ZOeD0=;
 b=tIzDAZU9UeVDxFTm4le/n+URb36ilkklhBC998RO0hMSmydCFG+4y9MTpTR9sPYtSQ
 gxRmsV3eI59y9mvXXqdlqsbmnh63LhY6CauIHhvEXgLk5rln6RixH6qUj2QpjO3EOfpH
 j5FvsE3ViS+KCz9oMOd8EG0rEILrfmeKZ9crIgVuBP2JM6iogAvEa1tp+vvyvxTRBmTc
 EDJZJSMiCCjuqnhm73LkbZSESiujmIVlSR8YuhnCSVRFdzACe7t7buZlGEKedIpEy8gw
 GeVm6ov0IxLxEbuQzL+HDi4WsY4700oELqqt+jcDaedhhgWrTCUh0cK3qbW+EFiKMN6h
 nnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tewnbC3dv6CLWZYjCSkkFhNn2HY0qxkNK1L1Y+ZOeD0=;
 b=gjugoT5ZLcSZMN01wICHJC8FLR1Ip4rW18rjEafzTSJXO60i+ljYmUY9HTicyLAwjk
 ROc6QsbHX9Cqj4x/ctL6AZDlB9IMuuUeYGPxt2KpIQxrlK4NIMdvIAZZBnHcdOZYzbpD
 W8n5luO7nnn5Q4abfc9ruY50MSdC/8KDsAcj975IS/FFKt7d/rRoeSLP+hKIgl+i/L6t
 u5zQsCHl4X/xiTDbeOdZtMJmUMVLrdB+8DsDwSgKMlQVQuUl6fRIHR6dTOQseMG0qTA/
 6jzd73Lc4KSuaAERTcvtZmXd6rGx4m9+trXDvGmRjEOc85vEnT9BdyTcWLzFusGD33gN
 L7vQ==
X-Gm-Message-State: AOAM533jV6qrYadhDH0bOxw95aspq5Qwp2bJ1JFKVHKjfrn61nG6ijA2
 LLocpv0gnO0CkN3cSKXx3UJ8vhP074mNscRTFox8gA3Z
X-Google-Smtp-Source: ABdhPJxPuCXbU0xstxqJygYEAbJLELkRR0aQN6MuauSkVr/df+et4nCg6VQhLtDAytbrsiIprzi+nudZ7ZNzTrUNbzg=
X-Received: by 2002:a25:af50:: with SMTP id c16mr22768507ybj.10.1613396943879; 
 Mon, 15 Feb 2021 05:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20210215093740.20080-1-zajec5@gmail.com>
In-Reply-To: <20210215093740.20080-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 15 Feb 2021 14:48:52 +0100
Message-ID: <CACna6rx5ijZ-zO9Mt0yVWJBCd0XG1d5-zU1y-=7BzrFsQ_=Hzw@mail.gmail.com>
Subject: Re: [PATCH] mtd: parsers: add MTD_OF_PARTS_BCM4908 config option
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_084906_378905_9924322B 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNSBGZWIgMjAyMSBhdCAxMDozNywgUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21h
aWwuY29tPiB3cm90ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4KPiBSaWdodCBub3cgb2ZwYXJ0IHBhcnNlciBnZXRzIGFsd2F5cyBjb21waWxlZCB3aXRoIHRo
ZSBCQ000OTA4IHN1cHBvcnQuCj4gSXQncyBub3QgYSBiaWcgaXNzdWUgYXQgdGhpcyBwb2ludCBh
cyBCQ000OTA4IHBhcnRpdGlvbmluZyBzdXBwb3J0IGNvbWVzCj4gYXQgY2xvc2UtdG8temVybyBj
b3N0LiBJdCBtYXkgZGlmZmVyIGZvciBwb3NzaWJsZSBmdXJ0aGVyIG9mcGFydCBxdWlya3MKPiB0
aG91Z2guCj4KPiBNYWtlIEJDTTQ5MDggc3VwcG9ydCBzZWxlY3RhYmxlIHRvIHNldCBhIGNsZWFu
IHBhdHRlcm4gZm9yIGFkZGluZyBmdXJ0aGVyCj4gcXVpcmtzLgoKUGF0Y2ggdG8gYmUgZHJvcHBl
ZC4KCkknbGwgcmV3b3JrIG9yaWdpbmFsIHBhdGNoLCBob3BlZnVsbHkgd2l0aG91dCBicmVha2lu
ZyBhbnl0aGluZyB0aGlzIHRpbWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
