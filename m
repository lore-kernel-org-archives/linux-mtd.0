Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5305C76188
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNwpN0nStp3TPXmuO2MZRdKGRKoUADELyFrIb8sPh3g=; b=p76kh3pC39FXeQ
	pSzaE6Q9j/YmZ7VuTn2Eyuph1kKwnRNP5NzufjwiF8E/pKfzy6RLWmzNlIaQ8moHj/scYH/RHnVzD
	U1ANJpyLpHnFDMA3JRhEjC/z8X2a4nbCcsvGiuuDYMUwaw7Y74IxOBRcq4eMPALCCeUnxXK+gOnon
	9kPKszyJ6U9PvDUxThVNpCpkyrP8mnnL4+TZozDK1BcC0vFRH15WIvFaiCcf3p1pa/cf7lywNunlJ
	QWTQ5bZK9yAj/Ws7GcGZjgcLeBZgp0MUfWfHW+2LFYw+dACk6PgWBp1cVDFNlX1NZpBNHMsyC2fyf
	Kfk80ydfGnhkA8mLgdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMc0-00Fu9S-2p;
	Mon, 03 Apr 2023 16:00:52 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMbz-00Fu8z-11
	for linux-mtd@bombadil.infradead.org;
	Mon, 03 Apr 2023 16:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5awF1RFpMHZWDaLIMt0lSfQ4rxtozrqLH4YEjfHnBJE=; b=Qf7gjUCpWEJ031d0g0s9mqdhin
	1+kbdD7+81Pzpg+FLtw5N8g+NuiFJPIkTj38iaYIFsmPZS1BBuxGS/Ev+l4DOCT0pjS51pwiSa4Iz
	EMkH/WVCYV3eGLtUT9zp6/M0Nfr5i0uwVLfaWrTF3e29+lqbfwKGfDL9eXtS0GedX4qU0fpUodMes
	obrxCgLJoiC3TvbfgNiTrdStg57UNcgR+cx7jUu84sJdEBNncwWn9SuAIk9z1AOSCtfMdVoWGS5Nw
	BGTrK2FKsYhaO+wYxgAFU4A4xShM+1hvWKHcuveNCQCTXp9jpE453G5zrz2sr+SqY/eW5GQiPlvaZ
	h7dcQxFw==;
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMbu-008vSN-1q
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 16:00:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EAAAF60005;
	Mon,  3 Apr 2023 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680537642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5awF1RFpMHZWDaLIMt0lSfQ4rxtozrqLH4YEjfHnBJE=;
	b=bQZaqeVOcY6cRrjX4mEaZ/ofaVrTXuj2j8gFm+gs0+PymUy9VbKEYhKo0va1jh3caNXv77
	Txi33VuJF5l4fz6OYN2+qqHsqptFOO4tPeijLV9T67gh1g8r/XwIsPVdM9WbUYS6yOBVdB
	OKbcpqKBaRl5T+EIG+n8jITprCm1x6SCan0WJS3++PUqSQkxZpuh9LopwxnUJbW1XllPFW
	DVzweHOl5Xb3VW9EkeYwfiKFVRSHGEpuqqq3hLg9jveCZp7AFYNOIXoUKMX/7AuDs2xTsb
	iM9UvAngaE55Ov+71vXFipOEYvm9+4ygW+N98Ud9eUh/D37B589mHcWAa5O/6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Chuanhong Guo <gch981213@gmail.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Felix Matouschek <felix@matouschek.org>,
	kernel@kempniu.pl
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v4] mtd: spinand: add support for ESMT F50x1G41LB
Date: Mon,  3 Apr 2023 18:00:38 +0200
Message-Id: <20230403160039.144916-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329114240.378722-1-mmkurbanov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd74c36480a679b27ce8a70c2e88fed31b86323d9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_170046_708017_5621D135 
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

On Wed, 2023-03-29 at 11:42:40 UTC, Martin Kurbanov wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
> 
> This patch adds support for ESMT F50L1G41LB and F50D1G41LB.
> It seems that ESMT likes to use random JEDEC ID from other vendors.
> Their 1G chips uses 0xc8 from GigaDevice and 2G/4G chips uses 0x2c from
> Micron. For this reason, the ESMT entry is named esmt_c8 with explicit
> JEDEC ID in variable name.
> 
> Datasheets:
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F50L1G41LB(2M).pdf
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F50D1G41LB(2M).pdf
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> Tested-by: Martin Kurbanov <mmkurbanov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
