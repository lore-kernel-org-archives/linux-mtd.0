Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B95CC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ifFPM5lAYRHuE7Xk5h0YFU+HafgmCiNEFeKOoEhikI=; b=LDeYRj8LEAqYwCqspAghRV9Kal
	YwZCM4lncICeACd3tcVd1lgDPOtxhraBcv0wtD9gx9Q/NaQ6djEtkrjJLtMkotDemKqvVIm/Wsvwk
	+AlG1CUDzvNNrHx5OUbFC4fdwrkSD6grg+1b+zSmyUvE7jRDEwHLmnFacNYL9C49JqLsPuASFB97G
	+3mo5r9rRaJ7MSnD7uJs5wuVJEzux6YCYGiGSvZsfZ6olYv1j/zyv/Xb8PR5fOwYtyvs3ca5i4ZF5
	wGfVbv+t7YsmlQ+nMKjQu3CURgW5fxsI/BKFiutudOvEdUN95cB+ns25VU+NcUKFR2hyqfeLeqsVs
	3+s8TJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZ6c-00Dzno-0P;
	Tue, 19 Dec 2023 12:21:50 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZ6Z-00Dzlu-0J;
	Tue, 19 Dec 2023 12:21:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 56CF83B9;
	Tue, 19 Dec 2023 13:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702988500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4462tXyvX8m/dDm2VaEPF8Qf0tyEGqZeXunhv64sqpM=;
	b=P1FOmpz5vI/3M+LFLI7NhYcJfJBk0SxRKkmZ90WnMTjf4ndFUmk/hog/rw+QylMEiTLWzj
	dYNKTV5FELNlG8iA9AqQezWXL9R9jWzJ+3rn3EzsjPP4TJW84I38hPL5uWeebaNku9/Pc+
	Gzvq+jaVxThTY5ypYr+PT/kXjUOssuXgt5LZYtUbae50Ml88tQ/aV/Mdx/oAFzArVbxUSt
	t8VNfYcThNO5utaMcINZE2ESnmhi0vi0uQ7kz7VyLUHvpMiRFL5KD7QEsxDlWbF+Ssm04v
	Vb/gXBqWVXrPGu1OSnX38/hxj/4cjsBon/O1L5DVJdn234Z8l78v7E6yCPJdNg==
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 13:21:40 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>
Subject: Re: [PATCH v6.8 2/2] nvmem: drop nvmem_layout_get_match_data()
In-Reply-To: <20231219120104.3422-2-zajec5@gmail.com>
References: <20231219120104.3422-1-zajec5@gmail.com>
 <20231219120104.3422-2-zajec5@gmail.com>
Message-ID: <040fbc414bf7404046b12dfed7a1c647@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_042147_303669_3B7A7178 
X-CRM114-Status: UNSURE (   6.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVGhhbmtzIGZv
ciBsYXlvdXRzIHJlZmFjdG9yaW5nIHdlIG5vdyBoYXZlICJzdHJ1Y3QgZGV2aWNlIiBhc3NvY2lh
dGVkCj4gd2l0aCBsYXlvdXQuIEFsc28gaXRzIE9GIHBvaW50ZXIgcG9pbnRzIGRpcmVjdGx5IHRv
IHRoZSAibnZtZW0tbGF5b3V0Igo+IERUIG5vZGUuCj4gCj4gQWxsIGl0IHRha2VzIHRvIGdldCBt
YXRjaCBkYXRhIGlzIGEgZ2VuZXJpYyBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKS4KCklzbid0
IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIHByZWZlcnJlZD8KCj4gU2lnbmVkLW9mZi1ieTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgpSZXZpZXdlZC1ieTogTWljaGFlbCBXYWxs
ZSA8bWljaGFlbEB3YWxsZS5jYz4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
