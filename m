Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1CCEB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvUeCd3DLMR1fVoSuVKQiJZW9S9G1KqFVMyruo4RV0w=; b=PxLNSRJPVZr/HS
	RPe9D5Uz6loHlQB+82ZYGCWIkeDyXWEhWSzVqzmh9ylOWgit+YOKyfy38MxrIyENDyhvFWAk+vagy
	b5U9RV3R+GbZbVuUH5DZI6ur6KDuILCzlKeuiLqUPbggLAT+lDvltNLk6rAbnwQ9zM02QaZ7EdqlZ
	odEblwciSCMFrcKW89XRD9EUjTBBzf47v78ZiOF+KY3Kh9eZzaZ+uxVUCUIkXNUwOGvshybVxV7vo
	4YPxGvGJ2ho2R3kGF3qID+JoWxBgbm3DKpKwyitWF/fcL/9kIklxmmYI/zWu0WK1vBehpv7/Qh8/L
	jABkbIQNQ9VVKOKnsW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDh2X-009b47-32;
	Mon, 26 Jun 2023 07:53:37 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDh2U-009b2J-0l
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 07:53:36 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 72B8C67373; Mon, 26 Jun 2023 09:53:25 +0200 (CEST)
Date: Mon, 26 Jun 2023 09:53:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 08/24] init: pass root_device_name explicitly
Message-ID: <20230626075325.GA26851@lst.de>
References: <20230531125535.676098-1-hch@lst.de> <20230531125535.676098-9-hch@lst.de> <c1391658-d785-4b2f-ba7e-01e4668685d7@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1391658-d785-4b2f-ba7e-01e4668685d7@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_005334_440429_BE3B1025 
X-CRM114-Status: GOOD (  18.17  )
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

On Fri, Jun 23, 2023 at 05:08:59PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Wed, May 31, 2023 at 02:55:19PM +0200, Christoph Hellwig wrote:
> > Instead of declaring root_device_name as a global variable pass it as an
> > argument to the functions using it.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> This patch results in the following build error when trying to build
> xtensa:tinyconfig.
> 
> WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
> ERROR: modpost: Section mismatches detected.

I can reproduce these with gcc 13.1 on xtensa, but the report makes
no sense to me.  If I disable CONFIG_CC_OPTIMIZE_FOR_SIZE it now reports
a similar warning for put_page intead of strcpy which seems just as
arcance. 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
