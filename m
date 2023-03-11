Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB94C61DA4
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Mar 2023 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eonYHKr1qoNvqvFeAMfUNEfzYw/v1oFcHVwqQU8/fTE=; b=3WCLF5IbQwQmN5
	WFM/3N22/1ayig97ARS5qme3ey3AzQ0AS+U454l9GXD2HM5PO+YAHJzZ81oM+gLmoWp46y6M1kndU
	8g6QA+/W5TNz8bdLhGgOqsWcEb0CnBnD52Y6eZSkRyVY/eWuK+NYd79tBdqVcjC91T5g6bpnWlE2b
	g2yO3QGSVl5YwJ1myODxeOus8Wmx/tNUXRQpZWfqNrDV234IPQ6s4Hr3YnJmiJ0DVG2YuQL1ZKsxO
	UWJpIgdQCGdpcCudBrLIuJ4VhE6wrGqvnoUpk1WD+BthmJXFfakpiVaXb9UZHU5w3yNqKGwl9AchF
	3EXXf0mYYGdeRFIN2daA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb2bL-000vHX-3l; Sat, 11 Mar 2023 17:01:47 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb2bI-000vH6-T4
	for linux-mtd@lists.infradead.org; Sat, 11 Mar 2023 17:01:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id cn21so2648444edb.0
        for <linux-mtd@lists.infradead.org>; Sat, 11 Mar 2023 09:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678554102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcBBeG/GDbaNyK6Z6mOsW8TdOcvbbaTtm0OR9JM78tc=;
        b=TruVEfCcNCj9tqbYMkbuWTQ4Su3dpCnlYBs5cOtEae7gv/6RTLuQSSzsOSPuWjQ7kA
         GpTzm5dyaRQnJ3pKwYv3ZI0bbyN3GiPKea99MVar57P+tBCEy1bIcnHKH17+GsL3X1Hr
         XCTgFFIHI44n7T2Flv/+rMa+LjfW6p9bUfP44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678554102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcBBeG/GDbaNyK6Z6mOsW8TdOcvbbaTtm0OR9JM78tc=;
        b=rf6Nqpn0V18H7uMP6Lp8WFQyBg7GJwFy8qa9XBBw3KhxojrYBLhpALcpWwRC5F+F3/
         7MOm58vkNf2JtTxmZda0bM+yirI3IxQ9jOmiqW95wiC3thvXJB7yy7WML9TwMz7MgnK3
         eHr04Y1At1o73kQR9UtL94YxcFERNTOR8du7vgrlV97YaFY+xrOXJggJCmL5KyUSdBNb
         7NZIGXAEwHkBdPIBgbNPsiJtn7V6VQR+p9MJSw5IArSAJY70KDoxEh16qr+egxwEtYJ6
         sdEv/RZFSA8fKz97TO/kxuIoN2aA9Y+P/d2A2ufmYJuulvhs2MPRWyYiTvLaUe1iq1Lu
         3iFA==
X-Gm-Message-State: AO0yUKXyHrI5tjqJqTNP8h3UIb0LLW0DwOM/jANKVTR5xcnWykd4zUa1
	FNlR/OufnVtIqJJp4l2x7kc0VDSQ3g+aHeYmwgmBGQ==
X-Google-Smtp-Source: AK7set+s8/zT7wPPBCVvu7BqmOhnfQ62RBhaETjop1EVAEw7jWRUOoWNvsJSUGKRwtqOs7SmW/INNA==
X-Received: by 2002:a17:907:3f18:b0:8f6:5a70:cccc with SMTP id hq24-20020a1709073f1800b008f65a70ccccmr37440042ejc.66.1678554101965;
        Sat, 11 Mar 2023 09:01:41 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id os19-20020a170906af7300b008c44438734csm1261959ejb.113.2023.03.11.09.01.41
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 09:01:41 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id x3so32762744edb.10
        for <linux-mtd@lists.infradead.org>; Sat, 11 Mar 2023 09:01:41 -0800 (PST)
X-Received: by 2002:a17:906:3d51:b0:8f1:4c6a:e72 with SMTP id
 q17-20020a1709063d5100b008f14c6a0e72mr14164994ejf.0.1678554100867; Sat, 11
 Mar 2023 09:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20230311092929.2827-1-richard@nod.at>
In-Reply-To: <20230311092929.2827-1-richard@nod.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 11 Mar 2023 09:01:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh7QzwMbkGC3yRhkqf=8BRk0KjS2pRwo3c5wTqqR4JKPA@mail.gmail.com>
Message-ID: <CAHk-=wh7QzwMbkGC3yRhkqf=8BRk0KjS2pRwo3c5wTqqR4JKPA@mail.gmail.com>
Subject: Re: [PATCH] ubi: block: Fix missing blk_mq_end_request
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Palmer <daniel@0x0f.com>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_090145_070646_23B3454D 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMToyOeKAr0FNIFJpY2hhcmQgV2VpbmJlcmdlciA8cmlj
aGFyZEBub2QuYXQ+IHdyb3RlOgo+Cj4gU3dpdGNoaW5nIHRvIEJMS19NUV9GX0JMT0NLSU5HIHdy
b25nbHkgcmVtb3ZlZCB0aGUgY2FsbCB0bwo+IGJsa19tcV9lbmRfcmVxdWVzdCgpLiBBZGQgaXQg
YmFjayB0byBoYXZlIG91ciBJT3MgZmluaXNoZWQKCkFwcGxpZWQsCgogICAgICAgICAgICAgICAg
IExpbnVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
