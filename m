Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955DEC6FD1D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyyEVU4hakommRHYSKCO57f95Hz38h/QWUIHtZkqbtg=; b=iUDTkHfBhbKxkI
	uXRp6lMGuQit/23Xk7SJWpd3UQ8rUFLw6u5HlnkMM2PpN4IQhei7frqwYdXS7VTefXAnABSat1ZQB
	9c5nSyJX0IPbjwF7JCWD6RTwPfCM0/5mUfVgd8mFVDTF8QaS4Z2krlZLL+uGmz50sXsp+dxy2ScVZ
	EuVMqutGnu6WgW9f6PcL7Iv1yRAAvAHH+gcIJTlEL0ZlE1iJU8f+RRQzul8LnnaOqUd/kIk2LG7mH
	txbyy60hn+bgfNX7mSLu9HIjYqLGYujq3UQEVkFttMWihEKFuoOZCRv70HS6uDRefMzE2w8mRQUJ3
	nyuDXhDJizbQEjGAzT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpLP-00Befa-0X;
	Mon, 27 Mar 2023 16:05:15 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpLM-00Beeh-0e;
	Mon, 27 Mar 2023 16:05:12 +0000
Date: Mon, 27 Mar 2023 09:05:12 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Minchan Kim <minchan@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steve French <sfrench@samba.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-cifs@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Subject: Re: [PATCH] driver core: class: mark the struct class for sysfs
 callbacks as constant
Message-ID: <ZCG+uH4Dh16Gwonj@bombadil.infradead.org>
References: <20230325084537.3622280-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230325084537.3622280-1-gregkh@linuxfoundation.org>
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

On Sat, Mar 25, 2023 at 09:45:37AM +0100, Greg Kroah-Hartman wrote:
> struct class should never be modified in a sysfs callback as there is
> nothing in the structure to modify, and frankly, the structure is almost
> never used in a sysfs callback, so mark it as constant to allow struct
> class to be moved to read-only memory.
> 
> While we are touching all class sysfs callbacks also mark the attribute
> as constant as it can not be modified.  The bonding code still uses this
> structure so it can not be removed from the function callbacks.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
