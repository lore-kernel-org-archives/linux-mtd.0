Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EA360A262D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CVf/m8g5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADjw1S3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5mxN1yEIcPqaIzDnjpVgAd3kRlUoQqGXFx/h2T+1UCw=; b=CVf/m8g5DRR6rvRJAahUuG+3yf
	Xzf0deUz1jYrhi6x534KGLnoqWgM1p7Yhi55RFLnL7QaQohOpJgRWKKR2tqRZHcooaSs/4sUFaI11
	vrEokdiuYwlN2T8oJHsmXpq9Lr/c8CphgWibXatqR5M5f0axm3rhLk4GQ6XvfZOQndQJj2wRi3xEs
	DqX/RHWLYyfgBDZVnH3Pgn4F1Uvumu97gRBnn7zaE23rHojSdVBSGv0KcCRzshkHT+IT/Nb3SA0tj
	jmJbiMFXix6sgMYG/1GxgkCTS4+CVTCBoJ4UbF5z025mH7aR8sZCgHkQCX9b4HyCXMcl08YtfIemH
	N9ujWtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhCt-000000037S4-1Jry;
	Tue, 10 Nov 2026 08:27:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhCo-000000037PP-2yz0
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 08:27:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4aa3a2a5a15so1744185e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2026 00:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299267; x=1794904067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJd1FBKDVsSxZhIE6xre9cpQW3ehpWs32eSf98wT1Go=;
        b=ADjw1S3qsBxmqp6DllnH7YMxG+HUozfx0ctxYmE3B6Qpckd0Z6ys68Vxc7J5kvNVn/
         GPbYLTzqfBWdpIhLenX8k9vTKgPXdI1gp9oawggGR5GcKkI1Y2VgNKeb54mFWfb/wI5u
         bRqf7HlzHQDBijdboUy56uyvcv9SlAjYhZq/Dq9u6akXiyr8Vy22ASVFiP6XdoN6xGR+
         56ecLgdgGdOR52ODyI8X1jBhzcuQpMPy4FCFxbq7p60+aISQoZKT5g9GExC5e/IAml5K
         vtUScz8Hjw1PxLLwKBnk57hfiAICCwvLREjNOj4dX/PGqV8UqkVabKer46D6AsX8VI+f
         R8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299267; x=1794904067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJd1FBKDVsSxZhIE6xre9cpQW3ehpWs32eSf98wT1Go=;
        b=rTWK7nkHqosplE50Y/fTZlHghF347OWojfKSZEfmVMQy8S2mWHDIH4E5sLd+MLWXU1
         zLSju+SIgF+ruPeOMn8E9Uc7A0GRudvsdwJgzc+ueXbAa1LNuUXQ7eW6qBlfOq1BqvU9
         HqlD0vTBTgeiQ7Yghjft2zprdKJl+d8kI/mJvMCmk/ppnLe4vKGcFfUy+LKqzH0MwY78
         WtvKK/zaTvG9sTKyjfgzJH9pqW0kA1wnRcH2QZprFa/D76VfhURyi3VOMllfhJ1y7XfL
         8XnpwyouQoaa+xcGsTjaC08APzRu5tWu4OWvX7JJ+mdzSbHWyS/nyYRS/DlbnKaTKhNz
         djew==
X-Forwarded-Encrypted: i=1; AL+hErFRlEvLuBY1HxHFI6L3fHXr3DB4ZWYZGYcJfPV2Q8HUebWN+Qpzk+mmx4mk/Z8AnsyIcTD4ZwJGjnY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+W9Mx4RPRU2ljtujLcqoi3g4qr7ufPYIGInZGJRltwzAuAbcqf
	XncrCs8qQE0+WXZC9Y8wEQAu9UWdiIQgh1ROP06Ls/oTLRmJOwUshV5X
X-Gm-Gg: AYBFou0OLFyqLzLe/YtahOFRhqzm9svRI3lqfFEznE3SkLd75jy4bKElhYpnkle1Q0O
	O563ZlQQ1WdhQO+woOXVQIGnlHgD+6YhThoINNObwGcF3pYOY9ZfND+XdvGmywz9xsljyYsQCk+
	pbD2sfoGgiLnf7PbgzfgJTdrD+EY6xbfwNk0Fio3U1/2gyXhwkhrwROt60hYg5yIbiXPgv/UJG0
	4YMZSQTe8Of8bpQmLL7Kv5L5NmgS/ZOjOUAw8I6xSPOtzjarxQ1T3v4jGf1tVoT6ohPFl0k53yF
	RAuaecGsnDaMAhxLnq2OM/RKIFNmtn9qi/9tUWz/pFBa7cNnntx0lg87/QBwHMbtcdgF0MLQEck
	UczppF0wIhYE4chvfqZaY3gYd2AnNfX2oqad8IP8E2pWcCqIgNQAlatcvn2kEqzLNjy018//80x
	O/73Qv9paAQQc9iCG5QM2mcQcqSgUSSSVby3NfF1QqP3qef2xcoo0DokizFn3VaWHX9KioGIpLl
	Jk2P06UJPapp4Y78mN51B8jUB2gyyt6CMPymkFmkLY8LJxodbY3323yIRN3JTDabwsNR0PrrI7V
	fG2rQ+NCpeOvo0tpsNe/vSQTBc1+a8I/fRLM5vYIUv5HokjgaQ==
X-Received: by 2002:a05:600c:13ca:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4ba022c9d83mr18304505e9.0.1794299267228;
        Tue, 10 Nov 2026 00:27:47 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm3885849f8f.11.2026.11.10.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:27:46 -0800 (PST)
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
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Tue, 10 Nov 2026 10:27:07 +0200
Message-Id: <20261110082707.556862-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029210153.3986211-1-itai.handler@gmail.com>
References: <20261029210153.3986211-1-itai.handler@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_002751_057580_EDB48B7E 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael, Pratyush,

Gentle ping on this fix. It still applies cleanly on top of v7.4-rc2
and spi-nor/next.

Could you please take a look when you have a moment? I'm happy to
rework it if anything needs changing.

Thanks,
Itai

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
