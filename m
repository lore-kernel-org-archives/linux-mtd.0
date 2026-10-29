Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B2F606A927
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QwdSpEFP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meF6PF2i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FmD9SUrXqy+QgKrNBGo910Rc85kGUt61b77yp2hp+v8=; b=QwdSpEFPqfe6bkx4yd9/S06UQs
	i2/71lm5V27RQ4LbB/VREZsVhm62Z4fwi6bKdf942pSnoioKcA1IWINKwCNDD50rZGQSPc2H86wWY
	2cUh3lBuTRO+5vvvvxRmPu2QYQVBjYM5tMBR51OIsWnQoP7LwydgtVYvPiceCQVQApImOoHDudTq2
	YFi9W5YgC7wLna0jbxeC6/64vTEj0xmC7vAGYYQ7Z8Slz9j2kRquyRO9tKWi4RTw8Zs8dXWj/VPfW
	qUF7S8S5OMV6tXB3Qyf8yp7BmrVM+4wBZziMSVKRr46PbiPeq15CxlWuyhDvCi9n7Mea1P4Qvchcq
	c3g4Cd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR1c-00000009VrS-2xBy;
	Thu, 29 Oct 2026 14:22:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR1Z-00000009Vqk-2wrI
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 14:22:38 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3ab30d04674so3251331fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283754; x=1793888554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0K9x4xKKo7OLyxedAFnX+Mg691NejjhQmXoNihJhik=;
        b=meF6PF2iUobAkHujHoTdsxuWx1p3klTkWgfOK0oYaQwW5OTOhHHlN3zMfHMf3tc12O
         zoh+BvwdshhJ0XNOdgSIWA6HIZ7U+0sWfHTcyIEtpkxtTcnSIn1Q5NEAbgNCJQu+Hllc
         c9Djy4kYiz3I8fsMzSLa7GCGzD02IUM6cXQRg/xFHT24bLR9XEuRKC7gzWEye3he8iv8
         EUKuRSKrLVxfGR78TN9jvANYhj5D7ZeFqWt+qmIyQqJVVMVT3VM2o6XfDb3i5tqhc0P+
         hWi+BML/w69juqni0cQg6wxKdE7flEscq2hciXe3CisFdPxia8j7mwZen4+cFUo07ojq
         6hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283754; x=1793888554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0K9x4xKKo7OLyxedAFnX+Mg691NejjhQmXoNihJhik=;
        b=gaCsXswOjm0leuNhHQNaZ38o3QOqCie7F6QIVVcE0o/7EUlynePPG7QSuDZS6G/CBc
         x+1ZHB8AC3idvTjRn+EIE+eQ82MBP96E1h7QlZrV9q8p38eMi4DUHZ55OqbUgrdsUboh
         MVmE8a+ujx2F8OvvQ11p3PIC3HINmPiGNZZP/74xbBC86aYfx6gqArSGJNxAnVg1HWgT
         EbeEk6xsmv6dA5QlVD+4rtcEy3BQPSZE7AHPl4ebwFcTevJ1ti959T3j7Xhf77dyrsbk
         ki/L+3FVugwkLG89s2b4+Rr+QkzPRjqoJgFVRROALX2eLwvbucuJ7ypW6TnMOfJAcg+7
         BY1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7CcFWgLdprWQtCi9zSVnKxf7hQCLmK13xsZmZJQOYOXxfNJ2+ckBQjW1+wT2YHjp2o2+nPrbnqb8=@lists.infradead.org
X-Gm-Message-State: AFq9FYKOLVYK+YoaBGOBzdauAZqk44Ek40Ksk2xZKvK+CFbAPqAixk8g
	aSO84qIu2/YuTqw7mBwBOGCo0fuPwgVQ/quOfo53ns/YuPSAkLuMmpJjJPjwfQ==
X-Gm-Gg: AYBFou3P9KM8EMFAL9ssvNbYBJNeZfR1qwx+gbLtOIDTtpo95+PYTN17aBpg1p7zVgd
	8n65EoZKpsJLxwzXajhDXwcIPtx4xATh3aiYuQuUzQAlCzSh+AGfYpmIjxLUCLsTPIzh87PS/ZN
	pXA6POfsaCcBKA8BSdK9diGSlmITGq5VKkBWhnrZTQQQnFF/9xGjMKMqEs3CTRTyPAoGLLNNYd/
	VnvWh2A1msbTgF7+L5HsN2L9Ddh8+cZmWnPWGaIP+LrJBvzJ6wc1iSvGeLnblTuO9IzbegmYWVE
	VQlypKI9chyPHiFJYjzxT6q4SBXjN50MOUvkptnp6L5UnYnm01AmXmYHlBKsz2p5MoPdFvxWvHa
	TkQAMmWiUuZJKEmlook+8eRW/PxozDGnFfLYbWLQZDnWYSjILOop0TOBLBat9Ozc6tDZm8g1Lod
	zbiZR1gXMhCnvR2g2B1X5BsHsVHApHfrzHsMqF2D1ekYpc/KDBANgkQRZDbljFlkhoBEhQe6AB0
	6fUT6auUac/N186Wu+5ba5LneCRoCs8XIYhJJIqthvWN/BHnkQGg++T+AVkhCnXPZTLmPEcKstn
	XuJZiI9bFqG/qL6KVrUe9VKxCHFs2cETqP5iVCKOMmv2Mmw7Dg==
X-Received: by 2002:a2e:888f:0:b0:3a7:812b:d11 with SMTP id 38308e7fff4ca-3ac9cedf30cmr10647271fa.1.1793283754176;
        Thu, 29 Oct 2026 07:22:34 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm37558751f8f.32.2026.10.29.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:22:33 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: take the flash lock in spi_nor_restore()
Date: Thu, 29 Oct 2026 16:22:14 +0200
Message-Id: <20261029142214.3701995-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004104311.2196527-1-itai.handler@gmail.com>
References: <20261004104311.2196527-1-itai.handler@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_072237_763980_5EF6D654 
X-CRM114-Status: GOOD (  15.32  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 4, 2026 at 1:43 PM Itai Handler <itai.handler@gmail.com> wrote:
> Take the lock in spi_nor_restore(); both callers are teardown paths
> that can sleep and neither already holds it. Waiting is deliberate: a
> partially erased sector cannot be undone from here, and the wait is
> bounded by the one operation already in flight. If the lock cannot be
> taken the restore is skipped with a warning.

There are two mistakes here.

The wait is not bounded the way this suggests. spi_nor_erase() holds
the lock for the whole request, so shutdown or unbind can end up
waiting for a full chip erase.

And v4 still skips the restore when the lock cannot be taken, as v3
did. In my reply to Michael on v3 [1] I offered to do a best-effort
restore with a warning instead, but v4 only adds the warning:

> +	ret = spi_nor_prep_and_lock(nor);
> +	if (ret) {
> +		dev_warn(nor->dev,
> +			 "Failed to lock flash, skipping restore, err = %d\n",
> +			 ret);
> +		return;
> +	}

In practice that only fails on an RWW flash when the waiting task gets
a fatal signal, e.g. someone killing an unbind stuck behind a long
erase. The chip can then be left in 4-byte mode for whatever runs
next, which is exactly what this patch is meant to prevent.

Sashiko's review of v4 flagged both.

Please don't apply v4. I'll send v5 soon. It will still wait for the
request in flight, with a commit message that says how long that can
take. If the lock can't be taken it will warn and do the restore
anyway, as the code does today. That can race with the operation in
flight, but only after the waiting task has been killed.

[1] https://lore.kernel.org/r/CAFpOueRGN2TSNo+m3319qn00p-BYn8w7OQ6OPt4XTcVG63-uUA@mail.gmail.com

Thanks,
Itai

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
