Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8578FC05027
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XuTuy51RLER5etPBtEQtnubD357dggqUsJjiP7lFaA=; b=nw2IkvNlenF/Xi
	rigIKh1pNKqCJVdgGQkGbSl1gz47T0QkEfHHFBuRp8XueidGc+6WISaa0O9iy2GJrWtH+Yv48tdG+
	EHjw/Nqd0bdwlNt+fSPlCLiaIc0P8iOrNshbCAv29uZYMswpcG4VYbWSR18ADI0n0pkdz9Ol5W4hc
	MPR7e/eUA8iSJ43vNjAISsH8Ac/LzasVp20c624e/VsCUjUH1AHU4dy98F1cupxROHhFQObSiZlG5
	BJ4msNDjCUpgCiaKQajncTAavD/4U3kLyNCTOmSH1tKqYXIl3AoRMOsoD51txZQYbdOJIeks5/2aC
	HhxKHvpNOHaw09gog1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwY3-002BZA-BQ; Fri, 03 Feb 2023 13:56:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwRm-0029F6-VT
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 13:49:55 +0000
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CCD6890;
	Fri,  3 Feb 2023 14:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1675432177;
	bh=twmuq3q7Al8t0dG5XXte9ZDuYRAzK64pORvKsi5dZtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsORpL0Uj9JY/PCmdctSdYjH8WIxXKO/aZb04ghWAK+rrFLld+EHf3mQOdDASKs2O
	 E/t/SxPHoRRVXzLbXtGYYK630y/NTwjRZgUtemJ8Qt6dSjM/n5bAa5HzrAyPw+lu2K
	 RhP1lSURZKaxzqZBrqJWn0+5vNmsfXyGPFKyTbb0=
Date: Fri, 3 Feb 2023 15:49:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
Message-ID: <Y90Q73ykVEHRNII4@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
 <20230203071506.GB24833@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203071506.GB24833@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_054947_197140_DDAB0067 
X-CRM114-Status: UNSURE (   9.24  )
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

On Fri, Feb 03, 2023 at 08:15:06AM +0100, Christoph Hellwig wrote:
> So given that the big series doesn't go in, can we get this removal
> picked up through the drm tree?

Geert has a board with an ARM-based SoC compatible with this driver, and
he expressed interest in taking over maintainership. Geert, could you
share your plans ? Should the shmobile_drm driver be dropped now, or
will you revive it in a relatively near future ?

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
