Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37FCECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASAtkfG8/pmVtpsbNMgmHZ++pPljuhHWsJfCFZiWlyQ=; b=BsPCQxVKM8Mf2m
	MzeL6yLknTj1CPE+OKuhYs6dQnZOVfuUG/T2nESXdo/lvNm5ofBwIIcGPuXW3wN2FRquleN+Ko6qQ
	WkOjTH54AHhX92NzDpk/dmqseOZKbbxfZTUK89497H1PxGHt5tK8zWOXKwRMhzVB92mrMboG+OTTs
	FxJuypOA5EXWsj/ZpC6JMawnp5k+ew7T6xAWL66myeD6jVh2WoGU1/fK0owG76Se5/SnJYvIKB3p0
	LrtlxMECu0ElEetAB/NHZTjOxO3Tl4sLBRHcOSMfqNRU18jt9OzvrdNYCpf94KO67zFh1kR6U/shM
	fd+xt6ohLKID0YBFeUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb8P-00000001PON-32di;
	Mon, 09 Sep 2024 09:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb8O-00000001PNp-1uKt
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 09:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7Y5Q5NHxCQLDcTvXiEXz2NAloD4ZixOFnxmmJTc6rbw=; b=DefJbJnOKaFNQ7cPwFrVu4yYbz
	pc1/jO+lNoc3ikgsbDx7GJPg4YzvD7e7/6DFdqG1XHrabjr2AshcWc8Lvn5VIforZif+LhEi8O8cD
	fAh+UFQlCVpNuSXH5ODF5uhlxv4hUHIcCTlAK5R0bWk698g98SHLZqA9MNy7DKTHMZExw2+UZtFwY
	32QB379lcABAHZ+Z3Yw9c/BgXLazTuLga1st0OxynYQpL/wUtj/L2NAgjyjGnknqvN2tn3oWmaPhr
	/6DxFEGDLzlYMknfMvIMr1/KVXdFwlpFWViMCeSWAkPCjA5qWtjGLk5EnQMvrocNyjzTP3eR6zFR6
	gHRQ0/Xg==;
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snb8L-00000000NsV-1ITX
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:56:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B66251C0009;
	Mon,  9 Sep 2024 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725875790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Y5Q5NHxCQLDcTvXiEXz2NAloD4ZixOFnxmmJTc6rbw=;
	b=aZ7k+wmBWAn+JPADO4pTvstmnXuh9rXIN1tptlwO3FXWCLlrHPpwwiZ0ZXYbSye/GW0EOA
	LZ9etEjSzpxKAN861m8BJSkwnKfPqV0u6y1wW/8sbqgCB6jzWQCmRb5Kqd85DzdIDeixG1
	S6ZJNQWBW9FoDfVzJmdzCgs6qph+OeYByS/DSqq6MeKLv+Ift9sEJAgd+TftAEosFDwbZ9
	LBJFltBV4rNKtg3x9MvFNFFaRn22c7ktXGaT+fxHPPwUtbzaZEM3c68q4NbhshRzn+QlM1
	CTfpwh1Hc0CN84UjvfFDKDbCvY4nrX0zgWbonPwJwduzWy03hspsSf53hLQw6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v7 1/2] mtd: spinand: Add support for setting plane select bits
Date: Mon,  9 Sep 2024 11:56:28 +0200
Message-ID: <20240909095629.20698-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909092643.2434479-2-linchengming884@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ca229bdbef29be207c8666f106acc3bf50736c05'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_105633_433185_E81E8816 
X-CRM114-Status: UNSURE (   7.01  )
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

On Mon, 2024-09-09 at 09:26:42 UTC, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Add two flags for inserting the Plane Select bit into the column
> address during the write_to_cache and the read_from_cache operation.
> 
> Add the SPINAND_HAS_PROG_PLANE_SELECT_BIT flag for serial NAND flash
> that require inserting the Plane Select bit into the column address
> during the write_to_cache operation.
> 
> Add the SPINAND_HAS_READ_PLANE_SELECT_BIT flag for serial NAND flash
> that require inserting the Plane Select bit into the column address
> during the read_from_cache operation.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
