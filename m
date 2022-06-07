Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D653FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZ1sg1oU18e5V/Bku8gL7KwuJH6uX91je1xOgYAkM74=; b=FZm+IiI53Bi34B
	YD65MdyfGRcnAHpGCSNMss/kURyPdMleEPCh1p2zVejaz8pWoJjkqaRyNRmNN23l+CVSBJr2wKj0V
	Zne9CqAhFbhOmYUFXsu0l22PBEQA/JYWIG6z0GEOB++7EwqYlW69djLpA73w+32uBXELbY+6vLzW4
	apRciZmOLEv7kf6Vc4xTqHguJwGbPUOerw0jIMfaZlYS2VYX633SNltQfhpW2qyT109tjBZhpu9xT
	5uVd+TvalCQshZhbKZ32pQwkx4qF7DX0MOwBMc8ZdCNI6Be2UxOCVSQ1ZJ/QS9DfBJtBNQJEq/ci7
	hGRMCIHuMEXpwdMBc+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyajU-008DUS-8K; Tue, 07 Jun 2022 15:03:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyajS-008DTu-46
	for linux-mtd@bombadil.infradead.org; Tue, 07 Jun 2022 15:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4jzHTv5Sc0MldAT+k988WZMZ/PcoJBlwM2totgWZy1o=; b=kAmWthY2O8UluBnxjle5Z4b8CR
	wMBrQhwOGev5bLR4SD2g4KFCVqn0rNm7UKcacjYNHOp4Zi9DN4hFNNpg/rdYnkQ2Bitnt2jS/8yep
	J4RQx8E76Apo84LVth+zXy/EGiNNhGntaPmOyPt7MAf32pEy9j0ya4oCKAyveSeAvj+/Bahjw/WS5
	PkxrMT8th9jzoXK8Ozl9TZiDmysXQUNCSiVKvMvkBzEn1CjwgpXgRMlrbmn3RA54WDQPV+9+5Dfdw
	DH8s3QnSLteEcLhDUV0m22q0hL+gDPGr4PGZVl9no1Krcd/RbUTmqDuxBUlxLXzpM46q69eZL4xIc
	YyTs3kwg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyajP-00Bj6v-LJ; Tue, 07 Jun 2022 15:02:55 +0000
Date: Tue, 7 Jun 2022 16:02:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-fsdevel@vger.kernel.org, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 14/20] hugetlb: Convert to migrate_folio
Message-ID: <Yp9on0GvbGbdN+cv@casper.infradead.org>
References: <20220606204050.2625949-15-willy@infradead.org>
 <202206071414.41wGG8fp-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202206071414.41wGG8fp-lkp@intel.com>
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

On Tue, Jun 07, 2022 at 02:13:26PM +0800, kernel test robot wrote:
>    fs/hugetlbfs/inode.c: In function 'hugetlbfs_migrate_folio':
> >> fs/hugetlbfs/inode.c:990:17: error: implicit declaration of function 'folio_migrate_copy' [-Werror=implicit-function-declaration]
>      990 |                 folio_migrate_copy(dst, src);
>          |                 ^~~~~~~~~~~~~~~~~~
> >> fs/hugetlbfs/inode.c:992:17: error: implicit declaration of function 'folio_migrate_flags'; did you mean 'folio_mapping_flags'? [-Werror=implicit-function-declaration]
>      992 |                 folio_migrate_flags(dst, src);
>          |                 ^~~~~~~~~~~~~~~~~~~
>          |                 folio_mapping_flags
>    cc1: some warnings being treated as errors

Thanks, fixed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
