Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F5AEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9NAoUnRlm+jsXEu+LXRRqZ9bVppR2lLQNiRyh7oF54=; b=QJzXZBvlXTpUxY
	W7K6RDj/62Uq+084KCUeeey2uA3SaElxRSbfJwi/CMlf6qEc40fNA2+ewe++KJXvtG2/S6CdsvvxX
	1Rx7m2LL5DH7P/TpbO9ztD8QyJQMWX3/vxascVRo8HD32PFqx1yUtqwvbfhS+j6RmdZVneSuP1OLI
	yIW/NeRQzQO9OVaHcG0S98y0tuvO3/VplVex+kwdqSK7xFwCbZlIiLpXuKkciLoJWdHKvHZPm+mod
	rPTVnm2iEBbSUuAfFQvXuNjKRUb+bFx84MOKBqZbF3ywmv8xtilLcmVuOfNKoYuDO0EALpDd8ibHq
	OQVagBdKOYfbjqM9wiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vBP-00GDuX-0d;
	Thu, 15 Jun 2023 22:11:11 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vBM-00GDsh-0Z
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 22:11:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9827bd8e0afso296685766b.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2023 15:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686867063; x=1689459063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMfpGXgXUiBhBplb6MiyxnSYCXqw3vciMv4l5IOtWhc=;
        b=IX1TO4+N7YXmYMplT4+BpNI2p6VYPbwFRQb/8kWMDHyTRq+g9mQdh/sKfod+wyMh1S
         3ymS3xt6SdZG2UjRUShUZk/JKH5m/eTwEe/eNsU0EsAVKwF7Tz/vlDqJ6upM9z0p8ml5
         rSpxIuaZyCjW8kvbBBwnQcpqorbf5mb2A3gPOhkMmOxVpe0Jz+KJzW0vipfDvPCb/U2u
         9oiDZ8ZOref4OExhQuxayEmKAU4HQ7gq6ghYOfjVYIlQSt/izHqm15tRLONdtUjLTlLa
         lmSbsAy6CE8S4r/lJxPjV86kZgZgpLlec0CYCbDjcKq2ynN41GDuz+p5lnA070wR+uDk
         nuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686867063; x=1689459063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMfpGXgXUiBhBplb6MiyxnSYCXqw3vciMv4l5IOtWhc=;
        b=cJZNW4l3TmhFYwSry0rz36m4N/07oL9ssMKKK6xbuRGMZrDmO1sZhX/IUVmk8Nb4sc
         lXhrsdl/0ow6GWyA6X0vz/1ZUY5/4Sqc9bDIRuY0YAO1NPoeKEfWYthKXVHNPDJZcLwn
         Md9/ZpFN4fWoN59Pl5pMCenE8Zxde4VAFmluCKaHD5fH4/4gGyyu1Cfts7X/maFswIOz
         QWlbZyd6W8zf5qoxfmLzN/rw3kwA6qJn3Q01/86WxmAAothK9mfu5TtTuXEtgtYS3sNk
         /OHcSe7eF0lZVNuhYaa7c3FXwttx1oOZpGqB3fhOXSi+pC3Q09VDLPT6X7+qgKdETPPh
         q0zg==
X-Gm-Message-State: AC+VfDzPpTsTwoLa3y+snM2rDmfPnmmbDfgIMGVflQ4fBxLLXlzCdSu3
	6GWrcs5WmgkNAjrrKD1j09mZQvW0YYS4OHYf7ug=
X-Google-Smtp-Source: ACHHUZ48SjOqD3+l7gehPO9gdGbzzRCAGLT76sqPbKxzQmwJCFloNdvtXR067KL2tfd5rNJYLE4jUmXqGnZi2MROPFg=
X-Received: by 2002:a17:906:dffc:b0:970:553:272c with SMTP id
 lc28-20020a170906dffc00b009700553272cmr214493ejc.27.1686867063160; Thu, 15
 Jun 2023 15:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230615164210.25515-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615164210.25515-1-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 16 Jun 2023 00:10:52 +0200
Message-ID: <CAFBinCAJ5m+NTVry56=0AYMYr9xiM9KS7F837Hqb=ptOG_u54g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] mtd: rawnand: Remove unused of_gpio.h inclusion
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, JaimeLiao <jaimeliao.tw@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_151108_228554_7474E9A6 
X-CRM114-Status: UNSURE (   9.00  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgNjo0MuKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IFRoZSBvZl9ncGlvLmggaXMg
bm90IGFuZCBzaG91bGRuJ3QgYmUgdXNlZCBpbiB0aGUgZHJpdmVycy4gUmVtb3ZlIGl0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5p
bnRlbC5jb20+CkFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rp
bmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
