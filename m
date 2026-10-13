Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D69CC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b10nvzE+w8umLqd8ZswwxU/FHVHOQIK7JygA4FAB+Ac=; b=ioMZAa+vG0sFeA
	PFfOexpD1fKqzOwUUI6K9biTkf5KnPmHBpJeiRjtfX3ieAuLwe4rrW5elBg0eAFrAboa5baxlxw0A
	qIWa+j1daHKUe2irk/A0LQaEGomSEwJFTn2Z/VMcvrWZNjCxogEjrcH3AbFdLCudziw3ZvBzbnFXh
	BIHK0Oqw2nWvG77eUjhQG9JuFd8dtlCyyh07kU4OaxffIWbbWDAp/MAu20O2ki7vMm+THfFgG+h7V
	PdHedcmWetpDcyNiHunqmJRtTQpmB0O0eqjoNbDrfXgEvcUjRKVh3Owt1MfZrc3xLtAhayqjo0uTf
	d5n5YE30SFQma81HHLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhVP-0000000DrC7-1QXW;
	Tue, 13 Oct 2026 18:45:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhVL-0000000DrBH-1sH9
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 18:45:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso24004815e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 11:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917137; x=1792521937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEuxeF3lk2YJ0h7X1bLy5+0xJGtPSrxFy+aXoHrL3w4=;
        b=D9SSCvEm4cA9D5xy1XUWEhAHXVOdoex4peKL6ZPgnfmEzCiaO8u8wVSkmCk7dNc6kA
         RNs9Zf73mcBaP17zomOSi7+lxIPPHyuwShaYIl6TdXvkRJbk3dY6+UmqBaQotvmihQJR
         idDQpOYZdnuf2WnTDxBFU/wKslp7AKG1oGpYYIXAMjJyS5vjEM/dPs8OfyJPbwsFPljQ
         FACnDM4JD8+YrLZAN1tJx1olpmhfYYODoB1qhcQHYigtAqj9zsJ6LOl7jyXmRj7aakIE
         +UqXYyIkt0aAz9dm7kkLuCiO5t2Zs8f9LrM9+gDwg7sC074+r5mme2h0sT8Q1aOqoWWo
         /JqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917137; x=1792521937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEuxeF3lk2YJ0h7X1bLy5+0xJGtPSrxFy+aXoHrL3w4=;
        b=PAovQLw81xVjTFDoM8smogtXIAmOOoTU5sN19aY0nGhf8U9FaYLSangfzj7d/Jk7Gb
         NnnwKyEZYpfX8AF4kAwfw2rFlTckU1Zh4osvkcL1a5CM4QpQr13X2bzNdB64QOkZcPAr
         cKGwiQArqdNleYiwtzGGJQA8X2wjetsQhKN37/wgb5W0bLl+VJjqBcs6Ft8N4hevoo+A
         3C9BDvDG0I+LfFzLlEsSol7J6/FdFjS7DX+uxRGnCOg98BwsqnTwnRc3VnEQPQnLj9k4
         Mt/7SNQG1f24A8C7TbMCUKMb4fWVp3GZhYatheMKPkRA9oBGoBseexF8Vqe34VWYL1uj
         8EwA==
X-Forwarded-Encrypted: i=1; AKwUvBxBPcXqvMTCcfVhklv7qLPV2VzgaW1qZQlP3khjlbtYe/v65SaS2D0fm3fsMm7sj5m0oRvZ8v5uE48=@lists.infradead.org
X-Gm-Message-State: AFq9FYInLvidlZFCPoRLJk9jCoIlLtpWUmUrt3w6UjzllVd6F32AfGp6
	pp2Heu1kUQ8Sna7LVRctWOsstDur5DINFrspcso0qfZ6NkOquK52DRF/
X-Gm-Gg: AYBFou2Bc8U0fzAquuQbAp1kC+JyW2Y6uLrzVw7x54vahEgBAnWtl5k8ucEYYgsE7dw
	CAmuLxpPDOG2aDEPGrECJn+Ie3ls7K5xDOAjE9imVMU+HAC+c63f+C+U+CYaTiPxwitaLacCiFU
	WaYngZneRN81yzswOZWYn8I8v9kFAJwAOUm3rVPXWlPE2KmvP4jIu4HcE7cCM2kGiQoVOAeLqh+
	Wi4qJI07Am8MUoO1A7uaZy1eD9QuDspiAS5yTXRnrbUC12foL0w09f6mI6RnyLbE7z5Su7S3q0M
	qdkvOd8yfUtA6f78NmjgW7EYcuaUfQ+D4/owNW0ssVkDW72cEiS9EmbPSSpWMxfWP+JecUho64x
	EMaA2Lv9ez6Yw7L2R9fxNrXPmkIw9iU9ME/wDDVtnXDUyV9ta+A/KG/8MDFZT/DG4tAAX0ZEr60
	4V+3CzcPu+xrLcAKxPyt5cjHVpGwSr0bX+n1sJh+ot/aMvL+ieB29d0egWDodOOx8DS8kMRtu1H
	i/mE1v4OA7OpuRLBdfiR9hc5gA+MNT14DaeK7jKe0iRkMm1J8bKgElwmaL9Y4e3WH95OOyR/NM0
	MYM/DN7UwWWka9y90RClwhlqIWWz
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr192085875e9.15.1791917137521;
        Tue, 13 Oct 2026 11:45:37 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4edfsm7386322f8f.26.2026.10.13.11.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:45:36 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Tue, 13 Oct 2026 18:45:35 +0000
Message-ID: <20261013184535.555535-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87ld82zsc2.fsf@bootlin.com>
References: <87ld82zsc2.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_114539_488214_609D88A0 
X-CRM114-Status: UNSURE (   8.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

Sorry about that. I resent it as v2, as a new thread this time instead of
under the v3 mail of the first patch (which is already in your tree):

https://lore.kernel.org/all/20261013182327.549640-1-orgads@gmail.com/

It applies cleanly here to mtd/next at 2f7fa8d90694; the file has not
changed since cfc5ebc9540e. If it still fails for you, which tree and
commit are you applying it to?

Thanks,
Orgad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
