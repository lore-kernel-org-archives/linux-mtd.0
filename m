Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFB0606A8BF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXX6Uh0D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=X0io3Ygf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6UF1Py6d1eUm5/mjB5yOr5OZjlOXt80jHxHqpad9pSk=; b=vXX6Uh0DHXu5DCo9MkRcflSncm
	0TJiXDzsaM2P4j3DhkhU/kQrripIsiY0q0kkZOi91dVhSPLahBhio9gt5YunZjlmwMyE/7qxe01G0
	qYXNxEJPTqwFRUWP5B1cRhadylfbNv5fCrLQcm/o1KdZbYrRU+DmelQqrDsKrnWdvv+YaNkGbvdkU
	zXNkhfSWojw6oxDyWMLTmXS9e7zo2yj5urO6ycwFHAYybSqGaAjOnuSjo78szdxOMhEsTqDFw3sb/
	Wv4vT1X4Ob6gr1QB/7b+J/SqgDcCWnfarTjtM3B9fRRf2RoJwcszjSW2oK6ptk5KZy3ZQ53Z91ZIV
	L3GOzmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxSQ-0000000EKLD-3qJa;
	Fri, 13 Nov 2026 20:01:10 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxSM-0000000EKGz-3BER
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 20:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aLum
	z5CHjOJTllo97qgVcnqY9y2ht9c0L800dC3uAtQ=; b=X0io3YgfB141+Z5RXvbU
	a6Hh228LbvqcyoDEnE7oULDbMrb8F/Bwok0xAcmMwATLrRhMbfOEWW6WsVjr+WhC
	4XbKvH8deshYKS9sI0Mae7xHHiv2HvY031n8bUP8SU4H/aEYUtfW4KYqfzwf20GS
	PzV/mdinm8eT2hIOrftuumjaeanHf2oStXe0UHdpKVqhzImA/R/pnGyOfLWkFcub
	mGc0dQ/2QhlF5qebLDbimUuRi0ILu7g7eGEYMlIF7LXx01AwOulRIsmh3hRTh4/2
	829Gz+sYCPG3FjSzQKPlGGCtpqQYo7ZJ2OYGATv0EgDQwPDpUwtEyXYVAq2jI++8
	vg==
Received: (qmail 350957 invoked from network); 13 Nov 2026 21:01:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2026 21:01:01 +0100
X-UD-Smtp-Session: l3s3148p1@qY4m4y1gcJIujntX
Date: Fri, 13 Nov 2026 21:01:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 36/58] mtd: rawnand: renesas: retain open-handle state
 on removal
Message-ID: <avdsfFHl1Eoj-2i1@shikoro>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-36-556b1d7c6221@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_120107_714795_C2E5563B 
X-CRM114-Status: UNSURE (   9.17  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 11:14:52AM -0700, James Hilliard wrote:
> Keep chip metadata and controller storage alive until the final MTD
> reference is released. Unregister and disconnect each published chip
> before releasing the resources used by its hardware operations.
> 
> Disconnect all chips before dropping runtime PM and transfer buffers.
> 
> Run NAND cleanup during disconnection; the final core-owned put only
> releases retained allocation and layout data.
> 
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

From what I understood from the coverletter, this seems valid.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

@Miquel: can you test it? My RZ/N1 board doesn't have NAND.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
