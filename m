Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46E4C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 05:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oglUGCUKr2wNzugjVDV7SBMytMsnmrjtKzyYlR8Ri5U=; b=WunBdKn/tZgXzJ
	qNHpFNH0HyYhQEMX+WLarxuDRXFy9ml/nVrAoyPE7Hu3WICCXvktIH8zmGnebRvWmxidPzGdldzRg
	LpnGcL9GnjiPEh4nXswGM/5/gNpCsaEnpyD+PZJJz35q/ouw5wsTX+rNKf0uctQiK0v5F9oNQu3NF
	7x9BVPljGrPZ6hs2SxdxvzlfisT2vq2LZgrL0YpjIlELhrKgQOsNagrX6xN9HRkYpjM2UDrHHGRZ+
	uzx7gSNalqSdBNPj4k1xRruyPvRwitJh6iuzLndzmpF76BWnLXF4D32aWlXnC/HUcpzYFJUU+VJfs
	U3qW4s0+6gGS+F4hLUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu19P-0000000FQ1a-1YUU;
	Wed, 12 Aug 2026 05:05:15 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu19K-0000000FQ09-14Ns
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 05:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786511085;
	bh=pD4IWGzJHFK+KF3ubn6aSqcZqEG10D027CXIva4fczQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNBgOnUZQ16grpwHuSaoHAxqY8PU1y3qKNbKCytBKFAPy+0xKZo3DcrDj+Y13ueIt
	 QF8ZZDLdeBKpLxbxj+PmNmFeI2eBPvrzozlI/kU1B56sqsw61R5ZovZOBRFO7/JTHG
	 WOystZsFHra2FqcvkCyPXKW/23ajKp0Mt3MX0BaVmyuDu0tqCTTM5kaZ1Ji0y5DNA1
	 ouuPSJNwFpdFdeKfwfxAue0rQBpNvcGQsxDjpAvkgx7xF70bVggzw46u4seBv9f9UB
	 8OiUJDItJsJ8SCK55mcIYjl8t4+SoojM7li65ACmQJ+K04bVBihJwPNgvi5phh4CjO
	 ybzX9k4CjKD4Q==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 8717C36F
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 14:04:44 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=DvWSTHez;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 6C8B365C
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 14:04:43 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1042103a91.3
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 22:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786511082; x=1787115882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=akYJB0CEk2MxEJH5GxMyOVOGBdGEdJyU/dJjTH4kJ/Q=;
        b=DvWSTHezD7GCSfVF3HPalsYomppc3Zr/Qi9tzK5kp/KJNmHwMbD9/4wit2CyvibJK6
         nP+fD2JNqSOjObN+1xjQ+8rQBNQmChujnxZ1K7BYBC9yiiLi2LoaAtrtiSbcAEczwMWp
         xQ+zrvAdESGVMCWT7ccFDRAlOMkgo2Jhz1W+upWpa17VgodpA9Boi2sJMmycQGhZSNg4
         cBjqzsvcD8lqTt13i1e+SmhHHlbZF4X2R6BlRgiQ1YAHhZe5LzVZlDlpTo2lh15aI2Ai
         Wl5+J8U0BM+g4bCCNGDnyGay1IOpU7PnbRTu3VgYi+R+KPGppNFiVlekBICSXTG0ZK+u
         SFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786511082; x=1787115882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akYJB0CEk2MxEJH5GxMyOVOGBdGEdJyU/dJjTH4kJ/Q=;
        b=K/fEqZR3lcCYGaiqPtrG/M70gE9ZWjLVcnM7Xc1nvApgWgG58lj0Yvt+CfgKaowi50
         4tkNJ9pPNqLrA5WmWi4ZjmAqOC84tuRM2RP/0bnm7MaliJFCVqupaVPmmqx39tQJFT0y
         1aUdifL5tnJ4AEaMrTV1gIE9VRuFTicTQFYFXEdNBEgCLX23bTrH1sze2uNpszPnmxI9
         YAm0F2Tuh9nCcbjoasmyhXd1KCufNj6g7bDg/mC+EI9j/tRQzSw/x/KqF+eexu7YOfVR
         rw/4LioqHmxnhgkF4IqWwUbRCvv6j4vnJSp9jF7ZM3ILEIV1BFni1mn54fU8sYBv1+dH
         sngg==
X-Gm-Message-State: AOJu0YytfhkXzLUXq3ArrLHb3W8z+JC+gno2c+UyQXChktcj4Xrjca+V
	3yPcUCOCPKu1qLcQ+ljgblaOiWXTKP2UYmk1vQLpEF/ZYDT09wSQxOHiZQgmXsGz5S9cb8LjbAP
	fXqF+EmvXA4Rco0BzVo5dLFnLIvLsVi7qwKkGyPLERdtjxlraSEpkKjPjM6KefqcLkd1Y
X-Gm-Gg: AR+sD10thZkPhW1/IswktBwSOX44dUWhGIy5nPJnaYZ7uisoTLdeoHr177BUPtcjjjZ
	Eknhu2WW0xoS4SsXMJoA91aiozOGmWPxI/QerJAvlW9gfwvPwXrW7V5/bI+A9LpmG3DNQblo/lg
	/YQuo6pOk+mRArfb2cNtZsBExZKrQrF16y2nwDpnd/ec7aX//mQOiZYx2Qkl0MNCuWmYo/OdBtE
	/hzsFQMaLpRZF8uVzN+lOL+j1G+DnwzW3opporaE6bp8CsgSHLy4tZH5YQe5zXRb4+0bSb1ynKS
	C9MeKdzKvgJ9aX2g7KSkF7kUMPsRq6Vd77YOR9SAhHsfFU8lSp8/qdvuITZtrdSZmsVmuIWQrzl
	lcV9ks6bGYx10E1GqlwRIyajCDpjYP+iMeLsGiYGn9D1a4oS6
X-Received: by 2002:a17:90a:d64f:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-393011eea08mr2778192a91.7.1786511082352;
        Tue, 11 Aug 2026 22:04:42 -0700 (PDT)
X-Received: by 2002:a17:90a:d64f:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-393011eea08mr2778145a91.7.1786511081918;
        Tue, 11 Aug 2026 22:04:41 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-392fe485255sm474391a91.2.2026.08.11.22.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 22:04:41 -0700 (PDT)
Date: Wed, 12 Aug 2026 14:04:30 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Md Sadre Alam <md.alam@oss.qualcomm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daisuke Mizobuchi <mizo@atmark-techno.com>
Subject: Re: [PATCH RFC v2] mtd: spinand: winbond: add support for W25N04LW
Message-ID: <anv-3hSRMVgJAsOt@atmark-techno.com>
References: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_220510_439596_471FDA84 
X-CRM114-Status: UNSURE (   9.82  )
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

Dominique Martinet wrote on Wed, Aug 12, 2026 at 04:14:02AM +0000:
> +	// the W25N04LW chip actually has two free ranges per section:
> +	// "User Data I" at (16 * section) + 4, length 12
> +	// "User Data II" at (16 * section) + 2, length 2
> +	// The later is not ECC protected so this only returns User Data I

(will fix to use block comment like the rest of the file + latter typo
as per Sashiko comment in v3, after we've reached an agreement on what
to do here -- there were no other Sashiko comment)

-- 
Dominique



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
