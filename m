Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E91C001DE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIMRGxbMvSp9ikofd7+jtotNbhOoILAF9t/JFX6lANE=; b=WRkQkYZKzw+UgZ
	fob1Cd0iTRzncBS+QpsMn5fquVWSSPaiaueJkhqnrtzaokLPDzg8MU41nBHYxJCMJexaeo0TFLbq4
	arKzhmBqhqk+zprhdJuT7DVz7kOgrPP9qhvG/+ohqg+1VH1nLRn41Lix/nE3JTzhnlXzI78EfrkIR
	csmuCq5qO50EgbUJYzLmwUTEgnGwbtAMSB0OWi1hNDIBvv/cuMoSOpNmvOhupDSHdA4yEBESLZQPj
	uXkY/SBRn51wCgbX72N/0PqB84utptzkXPyCsw8Wp3NsboM4ZNnjpiGeZqImi3aAFlw+dGBVmCgqd
	M2H8Tpnun+POT0t9sVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVprO-001ALV-2d;
	Tue, 15 Aug 2023 08:57:06 +0000
Received: from out-30.mta1.migadu.com ([2001:41d0:203:375::1e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVprL-001AJg-2e
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 08:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692089813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6bHve1nYg/bJoXU/AFGmk5Zl6IycrFBw1mdd3eghAw=;
	b=ZboKTnDNrg6vIJPIGhqfQcqeDe/jt4ERjlf13Tk6VPjXBVQvvsAtANiKpbjOjVSgRfY40A
	qV1OgTNlJhRtArT95ncotHyqj7m2j8VDwj2zwa0fIqDGhtCIIoQOUE7bkXfa+YKA3QuuoE
	8EIeURUh5iYzv41wHSUftY3Kgi5uKPM=
MIME-Version: 1.0
Subject: Re: [PATCH v4 12/48] gfs2: dynamically allocate the gfs2-qd shrinker
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230807110936.21819-13-zhengqi.arch@bytedance.com>
Date: Tue, 15 Aug 2023 16:56:06 +0800
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
 senozhatsky@chromium.org,
 yujie.liu@intel.com,
 gregkh@linuxfoundation.org,
 simon.horman@corigine.com,
 dlemoal@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev@vger.kernel.org,
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
Message-Id: <D38951C4-3BC6-409C-90C4-C72E772ECFF0@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-13-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_015704_000085_B530AD72 
X-CRM114-Status: UNSURE (   5.37  )
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



> On Aug 7, 2023, at 19:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the gfs2-qd shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
