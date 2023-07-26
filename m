Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3D3C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpXgvfpC8FISO5TmCI3PjfgBNjDaBV2hfQGcsmir9iE=; b=o7SdTSyr43STaE
	QusfbiJypQQxtqxpiNxecGuQ0l3Brgd6V69z9eWtH5599YAn2Kfo0FSj+YP1NvMGDekS5pQJAzfcJ
	VlaAI5UzN7mAG6au/B8gT3c5IhV25YMK4KK8gvxqv/wcUzLkkYBmdl6WuvNjisGKuPjOgWI6SiEIY
	kN+Oq5vHSjH3xo+vfuiCmedxTntwZLNCupzu6qGBZv3q3BtbTNwzEJ4dteeqOMk2gDIWHcpgUsSfT
	Ev7JDemPHrGFsS04tC+70glvsK6JRoT+XyhxN4+eSTjead6xlaAgIAa8miBHOaCXf71Mp6HoLaaeV
	GyeAckeGjeNIXdsGOh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYTT-009KNc-2W;
	Wed, 26 Jul 2023 06:58:19 +0000
Received: from out-47.mta1.migadu.com ([2001:41d0:203:375::2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYTQ-009KM8-2z
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 06:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690354693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJECzEbg6AvUr2F/gs+Gdm9ozTbMv8VDjSGrHUhWzDY=;
	b=h66bJdZfshf2g1RLUpKqwxN7lHNgmJn36kolmPZUX2Aqc09HU6VbZ+x+Z0DjP9YGQTMTaE
	Bmqs9Mr+MJHT0UpOpBW+6O4BcvF6xaU81Xxo7qywI9w5gMUx1fYGe1bTsluzGucfJTYdAa
	elPkOC38C2T6cXpSojcQr4ueQ4x5eAU=
MIME-Version: 1.0
Subject: Re: [PATCH v2 13/47] nfs: dynamically allocate the nfs-acl shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-14-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 14:57:20 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 david@fromorbit.com,
 tkhai@ya.ru,
 Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 tytso@mit.edu,
 steven.price@arm.com,
 cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 yujie.liu@intel.com,
 Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev <netdev@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com,
 linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Message-Id: <344A2B0E-8A25-494A-A8E1-5C75441B965D@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-14-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_235817_105842_23810181 
X-CRM114-Status: UNSURE (   6.04  )
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



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the nfs-acl shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
