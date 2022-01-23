Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C558C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLoU7bLNXm2HQb6ZWKXpbsEA/O6JUIY8QGlwk+/912Y=; b=ys+lMLyXsNw5AC
	BrwIyHxWkQzVkFIQYlK9htWZHlf/4i4CKBvHSRDqAOS+syWC1pT+U1jQ6cveypP/haT+Oz2i3y3gW
	mtx1fKA4P0TUPqNIqn48kdnc21RA7qTTHjG07G1slrIAbNeShATUKOZibzpBQqrOeBgZQGjjQ7uPG
	Vkoqq8j/b3/epZo1rtGE89q7r71yk5J2mOvn6O+yA7oZah0c6TFdrw3f/XIabpFbCERJmKhcHeux3
	g7vaI+rhOxD/jff2nXlP17GvfE83TNTWuPByh7ffmNyl1KC2HZM7kNjhwI7emPA409lrtt5+OGzk9
	rAn++6uylxnP52N/XIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBej6-0013YE-BA; Sun, 23 Jan 2022 15:24:20 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBeiF-0013Ju-3d
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E2106200006;
 Sun, 23 Jan 2022 15:23:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il
Subject: Re: [PATCH v2 2/2] mtd: parsers: qcom: Don't print error message on
 -EPROBE_DEFER
Date: Sun, 23 Jan 2022 16:23:21 +0100
Message-Id: <20220123152321.529628-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220103030316.58301-3-bryan.odonoghue@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5d671dcf4f851c314f0d6a6d2e54167b7ae9f379'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072327_348029_FB938928 
X-CRM114-Status: UNSURE (   8.06  )
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

On Mon, 2022-01-03 at 03:03:16 UTC, Bryan O'Donoghue wrote:
> Its possible for the main smem driver to not be loaded by the time we come
> along to parse the smem partition description but, this is a perfectly
> normal thing.
> 
> No need to print out an error message in this case.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
