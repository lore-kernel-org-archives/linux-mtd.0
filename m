Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FB7FD2D92
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaKRTiZ6iTHLA0y0H7uwje0O+fiFLxJLYUJ960ioiAc=; b=MGpRTgmzVMC8qJ
	uNGMa2rq0ixnT2WdX7p07P9LI0u8UmzlvnhMN7uj/sBSR2e+O1C8ZM6fZpQ4OV1UoMriVKbCk9Zby
	QfmvT3poFoWuT1qPCPJ6+2T8vhJa791DufsBzbpfO6oKTYoeFoQM7oCol0tIb1mTn/GQbHOPktbeu
	32FYC1x85lVnZqc8HPQ5xbDEiSOAL18kT4C09fdvFVMe5ptyT/P3CAptFvq8tCPMMCF8QYhifA1/W
	agq6Lh+5ZXy3Xke4pvF1tZLxnkQZIBLh5kArpGcQYFT/FOMZ2+od4KNGmMgHUmNjOevgikcLPMWBk
	X/AD4SpvmGDqfX/L7g1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxQg-00000009d2k-0NYR;
	Tue, 10 Mar 2026 13:47:22 +0000
Received: from kylie.crudebyte.com ([5.189.157.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxQd-00000009d2B-3wWD;
	Tue, 10 Mar 2026 13:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=aVv/PSZT5NGeZjfHxwg8OpWgNHlsgZDJ/5CMzeiUbdo=; b=dTpIUmFyfV+bP6Hy0ueZpN32tu
	piiOrm2xYxIB724JO1nPYEvLrwNppM7ldi2VsLNiB9a22ZPzaNJQ0YaGHJwVuraOF2yk5SpAHZold
	s8t7GSMCpZMXoj2MN+HCYF9oJcPgVF+TLl3oulmGF4t7YrhkwJ3IfsTmzXldUh96w/myd3pDSVX1g
	/e8bzPXWMBYBNoEloTPI5IYSewDyrYj60Js0etFfclp4hEgkn7HaHPBIdN5mmqp8OC3Z4JyMZY1In
	us3k02cy2EDC8Yr2DD9TZj2Bfv2JCzi8o1CBU/q/X+4deOd5/tymAnt0Bem3HGOfb0TZNQXc+sRV/
	1upKIM10UX7QbQ98BeJxn1cHAUt80a13aLlrns2kgX3r4ZD43IvQ3qOgYizweNeHFZvB+bpwBSNFD
	hlDW1qIdKmIN+wC7qSL6cU7m+YgH+eIF1AeR8pLLvTFBNqmI6qti9D+O96RBcbYAwE/olpfjlTGn5
	mdLSL9FFfI7mx4Sepl5WAdeD1XVerb2KTcAMA8AXYimzng7DssEnPDbX6u+t3yAcQjc1BrWIujZyx
	Gao2D20IgKGUx784nxNUpYJ2ZiCkXzoDKyugnEIdTC+VrOwC2OEJanP1Uq3/BrGj0qOrmxYFeI51c
	48zjYWWU3v40e6itkF189TkI8Acs6/RLaheNlL7MM=;
From: Christian Schoenebeck <linux_oss@crudebyte.com>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
 Philipp Hahn <phahn-oss@avm.de>, Philipp Hahn <phahn-oss@avm.de>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Subject: Re: [PATCH 24/61] net/9p: Prefer IS_ERR_OR_NULL over manual NULL check
Date: Tue, 10 Mar 2026 14:47:03 +0100
Message-ID: <1948861.tdWV9SEqCh@weasel>
In-Reply-To: <20260310-b4-is_err_or_null-v1-24-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-24-bd63b656022d@avm.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_064719_990321_365F03C0 
X-CRM114-Status: GOOD (  12.85  )
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

On Tuesday, 10 March 2026 12:48:50 CET Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Eric Van Hensbergen <ericvh@kernel.org>
> To: Latchesar Ionkov <lucho@ionkov.net>
> To: Dominique Martinet <asmadeus@codewreck.org>
> To: Christian Schoenebeck <linux_oss@crudebyte.com>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> Cc: v9fs@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  include/net/9p/client.h | 2 +-
>  net/9p/trans_rdma.c     | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>
 
> diff --git a/include/net/9p/client.h b/include/net/9p/client.h
> index
> 838a94218b593f3fb19e6827c472753380193461..4bde6bd716f323c819745e64c7aac0dea
> 7beb72f 100644 --- a/include/net/9p/client.h
> +++ b/include/net/9p/client.h
> @@ -364,7 +364,7 @@ static inline struct p9_fid *p9_fid_get(struct p9_fid
> *fid)
> 
>  static inline int p9_fid_put(struct p9_fid *fid)
>  {
> -	if (!fid || IS_ERR(fid))
> +	if (IS_ERR_OR_NULL(fid))
>  		return 0;
> 
>  	if (tracepoint_enabled(9p_fid_ref))
> diff --git a/net/9p/trans_rdma.c b/net/9p/trans_rdma.c
> index
> aa5bd74d333f3b5e6fd1e4344d26bc0201ff7f7f..60461344b536bcb6e94112aace75a88b6
> a99ad86 100644 --- a/net/9p/trans_rdma.c
> +++ b/net/9p/trans_rdma.c
> @@ -252,16 +252,16 @@ static void rdma_destroy_trans(struct p9_trans_rdma
> *rdma) if (!rdma)
>  		return;
> 
> -	if (rdma->qp && !IS_ERR(rdma->qp))
> +	if (!IS_ERR_OR_NULL(rdma->qp))
>  		ib_destroy_qp(rdma->qp);
> 
> -	if (rdma->pd && !IS_ERR(rdma->pd))
> +	if (!IS_ERR_OR_NULL(rdma->pd))
>  		ib_dealloc_pd(rdma->pd);
> 
> -	if (rdma->cq && !IS_ERR(rdma->cq))
> +	if (!IS_ERR_OR_NULL(rdma->cq))
>  		ib_free_cq(rdma->cq);
> 
> -	if (rdma->cm_id && !IS_ERR(rdma->cm_id))
> +	if (!IS_ERR_OR_NULL(rdma->cm_id))
>  		rdma_destroy_id(rdma->cm_id);
> 
>  	kfree(rdma);



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
