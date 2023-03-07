Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427FC678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8yGA1J9XbJ3otdxLezKr8I95oaBasXAKqUDIsXBPac=; b=f/q/Hc+iT+Vrom
	XYSC/fnc4blEfurHsi5H9oczvcarkJ4hfAwASTz5B566ee7ZqVNnx5nAVy9SpWp1oX2Pup3lS52sr
	d633ioxDuqnsaD9b64/uYufcqPeknMABDDCj1BW+maQPDQA9S/YRiTu0ncSn3a6TKrNnGrNXEc8nR
	bC8NmrX+eCMOtG3gjUp46IiCfxM/u/qLrqNKdjkqPysdFiRsSj5ufK6VJhaz2v82YohuHzXjuE3HV
	7xOMcIBOfnl8zUgTC0/c7WhokQN+uPJdtfF6VCOMxwyQEzFNtgsvnnDauLziYH2x9gcy0vmNi6FVh
	ZE6VSENwlhEyKWlsJwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcu1-002Dey-JS; Tue, 07 Mar 2023 19:23:13 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcty-002DcW-6W
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:23:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 410FD240003;
	Tue,  7 Mar 2023 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678216984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5P9AcKH+YezSJtK9lbnU6QQK7ZoiMZqMhUgw4Rvj/2o=;
	b=cHoo1ImK0XY8bwtiihM1e2oVZPfFgcF3OA7p5nE/bUeybkFQKAqO4d+x0Fc696mzDdxHnN
	Ppd0L2D0je9SWF/vAf/wkCzvqT5wNOqWfDGc8SkmSUC9Ijtu1+j4a4tQzbK//Khy7ByCNr
	Ysz3PEVZlz0vp/0p+epfAC1pplv6N/XMPRCE+XU1QwEZLTqvERByRL2b4MTk+F/xkQqrQ4
	/9M1u9bWDS2HkPPf7D7c3W+kOEtbDnjgSCxhhzGtWQsGQ5qqTatAqvy7OeA5PGY7Nhvz0V
	8oZnNz997DsBxluk/TYfqz8M2OCzi+iI5XrOSIlrDhPdb+lo8OMXI3qojBEY8g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nick Alcock <nick.alcock@oracle.com>,
	mcgrof@kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 18/27] mtd: bcm63xxpart: remove MODULE_LICENSE in non-modules
Date: Tue,  7 Mar 2023 20:23:02 +0100
Message-Id: <20230307192302.353514-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224150811.80316-19-nick.alcock@oracle.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9116000828de4f9973e65a11fd7530dc03d1bdda'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112310_419786_B6435FD2 
X-CRM114-Status: GOOD (  10.36  )
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

On Fri, 2023-02-24 at 15:08:02 UTC, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
> 
> So remove it in the files in this commit, none of which can be built as
> modules.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
