Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C6CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E19G6v0Tnxb+AZS/spGhmMGLnmK+fauoU2ZDP6pO7wE=; b=TobRPHl1FBStm6
	1vbRdcZD7HqxLPTP6uOLr4HZfli4n2fFllg/55N1OXeEqYwzSnAxMvj5pzKUva6/+vCgN6ktugEY2
	WOTZ7PnH07W8yygUbaCT6OSCBzNO4MVB3Wr2Wevu52iP+AnGPF5DyP2lN5G48gQmwb2uMOQwzIvOF
	v1pYQEsWt/uzfHx5dlNXwTPEFJxQXjjjixo4y1JB3dSyFh8bFiAARG3HvdKvE6Yr4XI3ER78YS0qz
	RgeDHIxDSRJbo58Pm5sHaMy3hrYtfg84R1H6CTAeN3LXO2DgCYJngusMOcbPg5sMxJ4X303ZvsdwH
	FFjqczi90RwGNyWxuxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6Xx-00Ayb1-5e; Mon, 07 Feb 2022 16:07:21 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH670-00Amym-Na
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:39:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 94A3360006;
 Mon,  7 Feb 2022 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644248368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/OgcE1CGSDCTddTLbMaUdKelV/zV5JOdnKtgbw1aYHo=;
 b=gXgEbJIJoQjnzq/hYYAA5NcEzaVufzKzM6l302t8hknPnZVhJ8eg14GjsOVpdsjaOrcFo+
 jeO7GQ+STieGxGqlOMyGGu1aNH1lnd6PjWB8QUuWhn/pzS8TEVD+DbIr+dfh4+e0pjI320
 nsARIBpUb2n0QUEJ7dMs2wTUU177G2n183ec8p1zuWvWnRUjc/wliKFmLW2WpwvOSH23wU
 caSp8HUJ+9oGEuQH7tR6tZ8nkHxMoFtXQvyzSZIZds/D63lAtSMOSyBbwXktI1q2xNr/EH
 d1rxOVcfT7EzlyaBBjEWKVSb7WCEIunUJ+Dn1q9MKTTPPo5Ao4gb0c6fbqaWXg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] mtd: Replace the expert mode symbols with a single
 helper
Date: Mon,  7 Feb 2022 16:39:27 +0100
Message-Id: <20220207153927.710267-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128113414.1121924-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ad5e35f58384179bbd3cdb349904e150f364c4f3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073931_007339_D05B1B9A 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, 2022-01-28 at 11:34:14 UTC, Miquel Raynal wrote:
> Reduce the number of exported symbols by replacing:
> - mtd_expert_analysis_warning (the error string)
> - mtd_expert_analysis_mode (the boolean)
> with a single helper:
> - mtd_check_expert_analysis_mode
> 
> Calling this helper will both check/return the content of the internal
> boolean -which is not exported anymore- and as well conditionally
> WARN_ONCE() the user, like it was done before.
> 
> While on this function, make the error string local to the helper and
> set it const. Only export this helper when CONFIG_DEBUG_FS is defined to
> limit the growth of the Linux kernel size only for a debug feature on
> production kernels.
> 
> Mechanically update all the consumers.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
