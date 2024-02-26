Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFA0C54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t05/4OuZv1BLi4Ynb+gDg0U85I0JJS6JfaVp5ILavEg=; b=Un1wo9EvPdT0cn
	+9b8jDe2yXPYmjNyYSaeN6pRd+9C2WWvOfpcjENkJE3XB7ohE/WMtF/W2otyMxfjZV6YiLS6dT1xR
	xNX61k+ejEtVmvpfX6frB8SnlP3MRv9AUocO+oR+uTsOwvC+S81AK038TdIwTAIsMi625Adi9Vusv
	DjW0tsWh/ChaxtasztSSLeE6+bFl/Y4WbXVOCba9S0j6UuFavq4+jez2pIBhn2fOx0CbFf6t40rsB
	FNw4l/m89uZYhpBdjO5/wZaOHMl09GIh8dLinqLMhkKbkbzhLT89hPfV2J4oLWED9q9b1IXE5VsoN
	95QjUfN5qHd1rsscTDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSG-000000008VN-2RWw;
	Mon, 26 Feb 2024 10:43:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYS6-000000008Qf-0PIv
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:43:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDC16FF824;
	Mon, 26 Feb 2024 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=21jxhojpGuLyAIprsmsZyKfJVscT4QidpkL5l1YrKGk=;
	b=W0KmmBG5feEiVPtqgBp5uHiLTZEoe5HmuoblznMIabvdxsixyTRNUXFKaD5PvQkoZGGuPO
	JqJ9/2E3PvyCq0Qx4bSdWOCQ9tbJibgvAdirLuvt80zOGIZixx5xDjkFDDF4UUTHvsgUxA
	FUemVTgay0icE9nMnMasLZ4Uc5d1He/RbThLQf7XMx2Mc9K3r1Z8VW9Zs21y+eY2g/Oftq
	VHPUZ7RtooOvjAvgVJDDuxXfFO5DM8xnT85haWDtIeE9c7VzaqSKFJPTmkyHD37NU9sxy7
	E74XPFs8o4e7KlJ5RLG9Z74EimKbgHihWLE+FXA/GbuvjYHBkZwjSwq6ISPFgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fbdev@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Lee Jones <lee@kernel.org>,
	Andy Lowe <alowe@mvista.com>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: [PATCH 2/2] mtd: Remove support for Carillo Ranch driver
Date: Mon, 26 Feb 2024 11:43:12 +0100
Message-Id: <20240226104312.488935-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208224703.1603264-2-willy@infradead.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'77bf032528393d2dc9430b3cea1fee8d0762a86f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024318_359733_30DF9A93 
X-CRM114-Status: UNSURE (   7.77  )
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

On Fri, 2023-12-08 at 22:47:03 UTC, "Matthew Wilcox (Oracle)" wrote:
> As far as anybody can tell, this product never shipped.  If it did,
> it shipped in 2007 and nobody has access to one any more.  Remove the
> mtd NOR driver.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
