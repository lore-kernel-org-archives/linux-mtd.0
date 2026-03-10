Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF25FD2D92
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+8JgPLpS4OztyqxvfFq3w7kxaI0J54bhp5TEiqJiYI=; b=mDZGAjFI6xof4g
	xvVdbkP3YG5L2liZZu+l2Ngj5Pruz4jOEM0UiA4nrdJbMObD10YRenU8KwuiSShN5iCwJSsrGvB7z
	1ZgFl3a3LkZhkz45mIB+t4yGqc/2EKI9mLRcmup3xZBrXmz8Ihg3Es0SyoWbPiKVOyxIt4Pj5ilJO
	dOk+aYq7j4av8JG8vmTxSlEyMPesqRbyckjjsiTAVzv3ntS/wRuAl8gfsrUPz8v17xYrS6grCyCXL
	7vC7HsDGcVhSt6Z1u0Fta/njkW0LHLkoAo/f17gLpDeGVbYX8yHsdzesfwe0v5Bb5APKSqdRo0/DR
	rNyN6xRyJYsxiIYN0RQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxOs-00000009cra-2DIC;
	Tue, 10 Mar 2026 13:45:30 +0000
Received: from kylie.crudebyte.com ([5.189.157.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxOp-00000009cq3-2hQ4;
	Tue, 10 Mar 2026 13:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=tqNoaL94Dj4pObM+6pGSr4RMsIJmELh6Cj7p3cxJGxE=; b=BSv+5VTSyPyrhpKWnMZVCjZEvG
	yrk6LWxlGwnUUZjquKMol+ljVUIUp9jBraubgLqBi4cKz4hniKCf9rIQTsThme1FexxEN+zxKvsgC
	uvMYbDhkYi+shFX+PLCD/IMwmjSpYMDJbZGsateoQvss1ByMiB7n5CokueqpdePTp7697ajozqLcL
	QNNNvSzTIj5kMR2wUJSupi5THJtiu7VhPmFy8ePRrdnRpYFSOebiyO3IlTbeTGO/MmRM5PEIBBHLD
	zejwvm6ItsldfqTIXTc6O0Z/soDk0el6lSZ+MrXBoszSWB5pdQE71J71rNLjrXAAIRkB6hWfEOV6d
	5s2EICAGfy5rFvZnPzPqZQFNMJmMF1OtxV9pY8V9U1rZXYRb0+cWjl6X1xLcFCZOiZcoHLob301cc
	kRokX7oWqU/2ExVyAy+qxf6eKje0uvqaOqv9hMGZ5ryaSKPC2aKAIJfnAVSBvJS/v1i4KIjPZc3rm
	OWRlN9QVYisM4o3VWUWhQE9QLOSHJzH7XsIe7kcAxjAHPZYtil03PpuGESYai0z/ycOzdMPXNnK8s
	RUYQ5R4xdnnK/uIBRJ5tLN+fwlf+9zGkqtXzZ7Db2ibQTV2JC6OBFoQ9ds8aqQ/KGsNN9Qx1u7AAn
	wqTFHtO0j/nTwkXDvMBIt3or3MQXIgQCujiNGxQ00=;
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
 Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [PATCH 06/61] 9p: Prefer IS_ERR_OR_NULL over manual NULL check
Date: Tue, 10 Mar 2026 14:45:07 +0100
Message-ID: <2401874.ElGaqSPkdT@weasel>
In-Reply-To: <20260310-b4-is_err_or_null-v1-6-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-6-bd63b656022d@avm.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_064527_711602_341CA905 
X-CRM114-Status: GOOD (  11.23  )
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

On Tuesday, 10 March 2026 12:48:32 CET Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Eric Van Hensbergen <ericvh@kernel.org>
> To: Latchesar Ionkov <lucho@ionkov.net>
> To: Dominique Martinet <asmadeus@codewreck.org>
> To: Christian Schoenebeck <linux_oss@crudebyte.com>
> Cc: v9fs@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  fs/9p/fid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

"fs/9p" in the subject on this one, please, not just "9p".

Except of that:

Reviewed-by: Christian Schoenebeck <linux_oss@crudebyte.com>

> diff --git a/fs/9p/fid.h b/fs/9p/fid.h
> index
> 0d6138bee2a3d1ab565ab2d210c0a3f3bf97e4e3..3bb7ef4380e972a2d9ab67eb4aab6cc5b
> fe2eea7 100644 --- a/fs/9p/fid.h
> +++ b/fs/9p/fid.h
> @@ -27,7 +27,7 @@ static inline struct p9_fid *v9fs_fid_clone(struct dentry
> *dentry) struct p9_fid *fid, *nfid;
> 
>  	fid = v9fs_fid_lookup(dentry);
> -	if (!fid || IS_ERR(fid))
> +	if (IS_ERR_OR_NULL(fid))
>  		return fid;
> 
>  	nfid = clone_fid(fid);



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
