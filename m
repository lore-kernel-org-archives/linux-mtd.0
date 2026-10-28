Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F8606A326
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HA2qn4BF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUjGc/2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UYOjpaTIqypDi/Q5//kQ19Uq0eSeabNoPDt/bF2lgZg=; b=HA2qn4BFCWOj2MOUyAG8ScpFwZ
	gLTprshueUOO169MGCErkGl0VNQFWv95/X3g5nBJTvdv+2o9v45oOk9JwvJmvWg4Q3sLG4D9WmnQ2
	CSY3I7n9QEhKqbCBesoARbTGYXMV67NBKIIYvVyCLS9hlb+KL9l5IvTFN5ZzgqY1rAt+DN3fjT8oS
	FkUmu/yLB1f0b8qXt0TfdQaZAIyEHmnUDc1I8H9SEOtZpUObGiI1riD+9tuEd1ePq3xS2jx1wA/jS
	4lPrEiaR7G+jHsgGZmjkrvb6wg/6ysKMCykp387F0J7kttsTbK/orFgcJGd5sLykXQRE2MJ345Shw
	SwWoALOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyqF-00000006WQz-45Ch;
	Wed, 28 Oct 2026 08:17:03 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLypu-00000006WNO-2d7n
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 08:17:03 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so349906a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793175401; x=1793780201; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewTGkXdsNJwvYFPISDJjvcJQGNkUEeqtLfVaYw+sa6o=;
        b=TUjGc/2yTNw/A4sqFV8tkA6VvB2c+QcEtaLI0+mF2LK2OvJDWJeq9o54xRQGzUU4kO
         Ab8DUCtA/VwoghcF5ujdS/PSOUD8cbTThtYw79u36ZmWIimdfKri3nftYXfoxXXyC3Wu
         vr4ngkywAnKlnxh23gbIsYbl8vOx5UDpQ5cQaUzsmsMefzpWPREeyhUkIN1iUvwTf9xr
         qHfAGVJqnSi5HDpL7SJrtRNYj/thmGSS9ZX0zEP3H/uZ6RWWd2ugnuMMKicvJH0seDH1
         5lAOERLiL+T27DuG52Tnq3VZVCm2a8IiEuh78IBRKrvs42CJhZBVjA6Um2m/De7KWciX
         Zh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175401; x=1793780201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewTGkXdsNJwvYFPISDJjvcJQGNkUEeqtLfVaYw+sa6o=;
        b=hhIbDcFpAPonsTnc5oWpV2xxJE7xEY1F3wPGV+7QlKzE0mCW1UGvTkDrtk/2ARWMzA
         klbVClbVp2cD2kDVGAov9FvQsxARkDr8xluoZYVnnpwaOWfR28Wc/ZI/GfOOMtfnWdVz
         17/eY7IsjC/651kRQrYatC9yYL6HxhbetaZkppaDI7546fM3cEndyJajTIHe5REG91cV
         yLHN9YR14dgvQOyBY6OwjhSEOL86g7W1dFRHKvc8exnhztTwx4CnQcTmJei/h2BknXAG
         gtDzs1O3fq6waU4H6+hAgb5FBGhi4zfWK7kVCFyuk1mQjKN4AxfCYMK+a0DNTUakbklS
         1Sag==
X-Forwarded-Encrypted: i=1; AKwUvBydfAn6boQzZtn237y5X7Uqw4RPI2k+wxmxqJ2nMy37FYM1HJj509VeqVERTU2qy4XrP+AF/qxH9bQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+TOOUk15tDj/mb+9Tc6gwUX6MgXvDzaT90+armdnnaiUAfxLL
	/K34W2fwcmhyTt0OjaK0/yhaJ105JrB07ebW3Njdci6TdbQXFNx/d2fo
X-Gm-Gg: AYBFou0k+YKTeVzhjlXUkeJi7SmKGdhAmI9Knc2G1GX+cBQTq703LDjVDSZDlR5jR08
	rTq0FZmYiBezlIH+LrGo3p3e8SdG5LLRBSfW+9CapHMMafDPJkGISLm2GBgcXRRPIqF5TR/+S7c
	o+CeLOhycer0OFiteAJ1Gqx7Hmj2Lnc+xo+D6MytqrdtUKll3n7mN16Z63DLMQdsOLnAam8nqh0
	QqWCMuArE7iG0bL9sIg7PvTTTPHr+Xgp4nhMqGeZ+ztnGPijXGZptrDdJ2q8HZ4j+xhRS6/ZpQf
	KtXiiNb3I84DEKZUvLlnTQ/QmQtY+s+SC4mDEmAEJoG3pK8flPRpcQD4yFYFPogO4F2+bnmCDG+
	s3MdRy5/G+xegYh8PP+VDsLYaOxiLmMuy7u2FmE1mrZxOkG7XUFe8B+6gKfHL2yOq32aBb/0Osf
	pLdrotq2IHzLffvOWB6Tesx25SrSSUfJmQ4inp6gp1h67TBqFvjLFXJ9gIwe5p24dTnqJ/aeDR7
	Tss2xq4+CSIKL6M3PQfV5dIME7V2sbJ2tD1u1QZDUtndmNBDwMbotMfrphAtguo7AAVxvkwjKBw
	xsiNlhRDcb+9gzZK4AYI63d7NVrkc+dr2BikcI5Uz8kf2m2Vk+U=
X-Received: by 2002:a17:90b:4c:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae580c7a08mr1105748a91.19.1793175401041;
        Wed, 28 Oct 2026 01:16:41 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a902a51sm1953639a91.3.2026.10.28.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:16:39 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 2368A4163B73;
	Wed, 28 Oct 2026 16:16:37 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Marek Vasut <marex@nabladev.com>
Cc: Michael Walle <mwalle@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Maarten Zanders <maarten@zanders.be>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for MX25L51245G
Date: Wed, 28 Oct 2026 16:15:34 +0800
Message-Id: <20261028081534.945416-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
References: <20261024001658.222147-1-marex@nabladev.com> <8ee5b312-80bc-4584-ac35-cc76c2812c5d@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_011642_706765_196F94EC 
X-CRM114-Status: GOOD (  19.48  )
X-Spam-Score: -1.9 (-)
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

Hi Marek,

On 10/24/26 2:18 AM, Marek Vasut wrote:
> Cheng Ming , can you (or someone from Macronix) please have a look at
> this patch and confirm that it is OK ?

I checked the patch against the MX25L51245G datasheet. RDCR (0x15),
CR bit 3 as TB, the TB bit being OTP, and the 4-BP locking scheme all
match the datasheet, so the description is correct from our side.

One concern, in line with the sashiko-bot comment: since locking is
an optional feature, I think failing to read CR should not fail the
probe. Controllers with a restricted opcode set (e.g. spi-intel) will
return -EOPNOTSUPP for 0x15, and this part probes fine on them today
with macronix_qpp4b_fixups. Rather than special-casing -EOPNOTSUPP,
how about just leaving locking disabled on any CR read error, e.g.:

	/*
	 * Locking is optional. If CR cannot be read (e.g. the controller
	 * does not support RDCR), leave locking disabled instead of
	 * failing the probe.
	 */
	if (mx25l51245_read_cr(nor, nor->bouncebuf))
		return 0;

Michael, a related question for you. Maarten posted a series last
year to make the RDCR opcode configurable in the core and use 0x15
for Macronix:

https://lore.kernel.org/linux-mtd/20250922155635.749975-1-maarten@zanders.be/

It stalled because setting 0x15 for all Macronix parts is wrong (e.g.
MX25L12805D has no RDCR), and because there was no user of RDCR at the
time. This patch is now such a user.

I have gone through the flashes currently in the Macronix ID table
and checked which ones do not have a CR / do not support RDCR. If it
helps, I can add this information per flash entry, so that 0x15 is
only used for the parts that actually support it. For IDs that are
shared by several parts, RDCR would only be enabled if all of them
support it. That should address the concern on Maarten's series, and
this patch could then simply use spi_nor_read_cr() instead of
implementing its own RDCR helper in macronix.c.

Would that be an acceptable direction?

Thanks,
Cheng Ming

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
