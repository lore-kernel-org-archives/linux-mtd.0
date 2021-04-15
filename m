Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C73C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 19:18:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506A161139
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 19:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 506A161139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h8q2DD/E2r5Sa8rangjcyVixVEwH0CTMq6E4d/Ioa5w=; b=l6bd3wiGl2BWeeWw/DXHXGd6e
	TOmb+aFeuj2KgypH8wUKTHDRDRxrfYZ2MOvIXnxJBv23s7yJp8bWfPqIxOdZia+t0zcO9zzhGzuyD
	RxHfFJm+ZIkmpEqoWalry4PD270fv+JctdxZJEbpPRgURHn3uk5IPb2Jlfxr2hEyJ20qLBRab76TV
	4geyh5VBuJ8Ps6Qbqq8xZCvRFsNzBz0pZSmOGI3Dz5oZcXpBhiMpm6Vp9MAEZERc/635YQuM2YIjO
	5DQc4Fk3BDzThc2/qZ2bBi6I4RoreYwOXiYkUreKbwoZQZ13f7M6pglOOM4N5CfNLrwvZsSrWT27g
	tfqxdEgAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX7UR-00H6SP-9O; Thu, 15 Apr 2021 19:17:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX7UN-00H6Rr-FR
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 19:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=n28/F85+qeb+LoxzcFTtMcJozM2f+oFx7qwpmbGjZk0=; b=TVhAYeCxG7zK08EYvmNSDvHUf/
 0eIPmWhuqDNrUyBGBoTazdGaVIOSnURjAhtuyWuFnzFg3nvlI1jXgago67a3Xaxm62+lu/5Zqper3
 ZnImiW4rBc+f2DGS5wpVLG5IRAHFa8RZFvFizbMwjJ+0njsmNa7XGU5jM53CktgdAzc1RLQuQdq6G
 pZS6LnKm4ZN6nEh0MTrr9C0N3Fsml02EwA2O/tKUq9t6f0LkJiY7Jl2m5SskPQYfSdBXLpL+ZwJQY
 il1RQsr6fz9Eb/catdztscJIK0FPhcaJN7FRwE2LTMEtu/UCU77CMqpRvLMB6go+SiNd59nAiqZuO
 AgGgMdYQ==;
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX7UK-008q6m-Nf
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 19:17:18 +0000
Received: by mail-qk1-x72c.google.com with SMTP id o5so26447271qkb.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2021 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n28/F85+qeb+LoxzcFTtMcJozM2f+oFx7qwpmbGjZk0=;
 b=FuBbN9dXiR4UIN6YqqAHKyv27OrbqlG94JKs1/srlKC4kc939YtuQyL5lHR1vCD7kc
 66yzoPDoINXdEbmk1RIDzrPQN9sw9/cOrp4e6CeLFGoeoVEMjkyZERkbmsH8Hc0oyWbY
 a9HSanekmc1drNKhry611PFgiQv2miE7g+hJtfjy1B5Ix7m8zOy73bzAuXNY8YZzj9ZR
 oazBG4v+ry21LhszUnRETlGnlPILjEs8A1oTqgJfBfcIytQS1c4v+6/rruOMvuTpu0Qo
 /TFiAhsM761+5bIoXU0eKzqDJiT2Ucrz8oSr/29lsM1nSczWAaTLdH3KkcROdMIaz9Rw
 Rv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n28/F85+qeb+LoxzcFTtMcJozM2f+oFx7qwpmbGjZk0=;
 b=SnUCw9JrtcUjrX/Kase6DtYpSODlbEbEY6D3yjRLHfy6RsweTws1r3QPNkkUXIjVG1
 TArv36CP1EkYuICQYXystZSd6fWOwYu0mo4oNlyU122Pf0nK1xOS1PDSd6x+3FHi2Ysy
 IsCdLbM0PiCV7ZpXmQLuPCCVzq07HcPjtKiKoHtcTsre5AghZCgtEL/Hl/JNN9AoRmTY
 FtZWmr5+9ghoozM4993zvOzdaC32PDKVOr9blf4+Ju3sLmwgt/O4NtUVBBiZdZuoUr92
 Sopgf5sVnWotMLhwbCxumNFPNAPkvL/ah7CpbsKqSauGYtGDBz3i1BHBcIH6hOBzZTaO
 52zw==
X-Gm-Message-State: AOAM530q4EWltbGu9IyxroawA1yInJD+zcqJoijB8NMcYPIWmhgHzlnl
 6GuTANR+bPzE8ULOuYmzqcON97wpFiudGN8Q53A=
X-Google-Smtp-Source: ABdhPJzLDGnTIpUoCMDm5Fuj0o3jy5uRHHR+nfzNMfSRg8GxYMC/gaZeRj9UthEX6hC5KjIxw7Pp1FsZ6GGdNDm0j48=
X-Received: by 2002:a05:620a:1112:: with SMTP id
 o18mr2408222qkk.52.1618514231095; 
 Thu, 15 Apr 2021 12:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210413110249.04d5d368@xps13>
In-Reply-To: <20210413110249.04d5d368@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 15 Apr 2021 21:17:00 +0200
Message-ID: <CAFLxGvw7SZzvUCkx9HZnz6hjoHJsB2PbcgZBH6kkqoCGJc_Smw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 5.13
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_121716_794996_B5B42DCC 
X-CRM114-Status: GOOD (  10.17  )
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTE6MjAgQU0gTWlxdWVsIFJheW5hbAo8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IFRoaXMgaXMgdGhlIE5BTkQg
UFIgZm9yIDUuMTMuCj4KPiBUaGFua3MsCj4gTWlxdcOobAo+Cj4KPiBUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0IGEzOGZkODc0ODQ2NDgzMTU4NGExOTQzOGNiYjMwODJiNWEyZGFi
MTU6Cj4KPiAgIExpbnV4IDUuMTItcmMyICgyMDIxLTAzLTA1IDE3OjMzOjQxIC0wODAwKQo+Cj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbmFu
ZC9mb3ItNS4xMwoKUHVsbGVkLCB0aGFua3MhCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
