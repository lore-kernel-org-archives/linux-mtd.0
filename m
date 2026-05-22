Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1AECD5BAC
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=lnuyv+pvTV9DmZ
	WgMs6ZmWDmChkE3O+2fYQA/syxTqsvcC61q0q3hWpVj+1dnf/TBstmPgN788+Ofv5Hk60gpam3Vnj
	GBGtoRJEs5uzqTTbH60+gk6OO8Srq2zEbN47Ewv641X5NYSjuJNFqGgI2rFXqOrTEq63pdzQD7YS9
	ws0kBwdi8wc9ljdUXqccN3I8mEyNQknfxHVbqbGlVBqoouOanKK1pOys12Y4eWbpc6trVQBOuGyIQ
	g5HVsQZyC2bcaYaQy2ujoTd66g3QizN3yJifij8y9sLZ3M0suX2w6wRNMoLp4p06xkUhYX8v0Pnvq
	yXaTGSwMb1A3YGpzIjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLsi-0000000AHRA-18Z4;
	Fri, 22 May 2026 09:09:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLsf-0000000AHQU-2cpo
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:09:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso91696145e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779440960; x=1780045760; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=TS1Uywp0JkCnEk8Sy5sUuKrdsKbgmhh6oZNMZ5cEkVrZOnZUfNY3OTzInKQOznx0t8
         8jWHIwoRNskltvespeQQyU2Fbg43HXc4YbUneIiLy/GMR1uEfT3Z7ADPtJzhKKTjB9VP
         zO45OnMDmqvpQOTixlPKxiFBL+Aevb6LvXBVEkau6Y1B4gPIt8vLp3IDDXGDVEqMKdT2
         EM3uRImlmahvllHYsvtx4WB4VvlnfGFZ/JVHV9T1ecSMN13hF/hko+uIDBpsqOX7bSUg
         9BIP/o5Prs+n0XVdepppE1gidOBbKtyz7QPzLEm0HT8DvmHkltiaNAnN/ktZwGGa5ApC
         t5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779440960; x=1780045760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=rD9F7NQkjjYXHhShDfh6db3YaQiYVGDdCv8J/VuPxnlM2sZ2c6cWfs0qHams5wVPQu
         EepPNILYYCvGVX2AywKsLw9XftxexV9vfO3WWuwkUvP83+x/yTNiCip/PfzKHgjCOvrF
         c0vzsDM+9X+uo98CystBM6xmw6OYcg1AhmkLCD4MDOCLNnnTSRok7JElcdYYpA6kiqXr
         FuzRaS0ioKfnpdhgMoJsUtw9eLnqqz+Jw4xcAUSE/BMlw+4QNuBFlizBNCz596m3RA1F
         Gnz+1vP9DvV/CQ8lertnJJF9aVtGWxzaKuP/llaR3rOEDQkTzopPgqjZskWS4dH2CMBz
         oUWg==
X-Gm-Message-State: AOJu0YwcKjlGZhJ/VxgmMskOdjJlO8yhntFkufjH9/G3SxOXZiQxiTX5
	RCW5TYPZoKvAdN0HbB6bsyloT61D/gqOrQ+NpeS6Y71P+sonCDv0FQgO8P3t+XT1x4g=
X-Gm-Gg: Acq92OF0ztEl6PL1Me5EouSc9nxTMUWlivy9Z4aeN3P1zazMe5jsHiqrMJjT9XgM3Oc
	4XbtXIO5IhFD5SWTaqNV+a7tSrT0CFfvVexCrSJ4m29Vt7uBehPKDms0OIph8j0jgUtCnAedHZt
	wetC6AMiQ58uj92f4ak1jn3L4EJBwUQkCJDaImJ8F5xd8mdv9J4u6PazAuqSHBWkMzDJ172WuZ7
	vXQ5CBsn9GP7lvzIxBbBj3/ZhQieJUPCT8e0lZpJG0W3GyxvowithLvGveAxaGIY41COh5D1bqC
	4RPF9OcJcTEdTgCDboo3k7iI61jSgJ+Gi9HEZ56IP7qOzWnhf/QUUNQe8ZvBPf7QJuJvJWjgGUo
	pvBF9hD33p+OwXHXOqfJ4qBehtAzj6Kl6x5qqIW0vbyJ5DRAjexCTwMuGMjGovzO/0mNJ9HtR2C
	i/G85hQ3qtFBj+o7KtMFA++1gMzMPNOAjjcISw4zUE7w==
X-Received: by 2002:a05:600c:8b23:b0:48f:d5b2:7c1a with SMTP id 5b1f17b1804b1-490425aa7a4mr33550915e9.13.1779440959863;
        Fri, 22 May 2026 02:09:19 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm18926085e9.0.2026.05.22.02.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:09:19 -0700 (PDT)
Message-ID: <fcdad6ef-d5b5-4ce3-aff7-e743923b4e9a@linaro.org>
Date: Fri, 22 May 2026 12:09:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] mtd: spi-nor: spansion: add die erase support
 in s28hx-t
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
 <20260522-die-erase-fix-v1-2-733ac8967df1@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260522-die-erase-fix-v1-2-733ac8967df1@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020921_671375_CDC62B88 
X-CRM114-Status: UNSURE (   3.25  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
