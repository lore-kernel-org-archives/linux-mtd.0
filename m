Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72418C6FD1C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 05:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJs1oK6TIIYwVCyrghOOEXCG/aLaerc/9glQId1Pt98=; b=kL3UUDRCTY9m0R
	Hh4XqFZ3c0jg9rVFOYjcZbLrSrrW10u6GJLNUkPmFzqmNmnLOwgFqL0vBRnliDBnnnskQEEy3ysSH
	NS+jcgCXcF1zMyniazhhKYkdn1YU4Ca00uv8qH6Cfrufh6HZfsND0nupYn77jpTskOEJ6qRhxx5iG
	FaMyKpIQy4lvFgZWrT07BZmTI7azIaz0rPxYyndFhmgvORBYW5AFn1yVxqhDIB88ymeMYREpfD5cL
	01YfbiDW37Si/m1BiZKAc0K0OInPlxyYGCyATpQDUBLqA3IXMmCWjk9+Z/MSd218uKDV+SZ5v3bnx
	l5VB8oaIWP6vc469vnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDJr-000p4k-1Z;
	Thu, 23 Mar 2023 05:16:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfDJo-000p3p-2p
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 05:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679548612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoUzTMO8R5MhPq7S8OoMssryl9/6eR6zluDti49MEro=;
	b=eDNhgma4RHwHo38UjyW4mFPa+ytR2DlR2DQhp7HfmCF63ds7b2521j6UMry4gpKdrYGsw1
	SlsDJDZFruvM7qvS6B8FN3jcC/qtU5Q7V2gFWDfBZbHbwsCZVRfCOIxUIGLEseQpGVCLv1
	THLYBYqEBQa0Q9tXhdictkx96Sdkv+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-KY9zo7YzPqyCZhglvOgcqw-1; Thu, 23 Mar 2023 01:16:43 -0400
X-MC-Unique: KY9zo7YzPqyCZhglvOgcqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 362258828C2;
	Thu, 23 Mar 2023 05:16:41 +0000 (UTC)
Received: from ovpn-8-16.pek2.redhat.com (ovpn-8-16.pek2.redhat.com [10.72.8.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3854021B1;
	Thu, 23 Mar 2023 05:16:24 +0000 (UTC)
Date: Thu, 23 Mar 2023 13:16:20 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, xiang@kernel.org,
	chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com,
	jaegeuk@kernel.org, trond.myklebust@hammerspace.com,
	anna@kernel.org, konishi.ryusuke@gmail.com, mark@fasheh.com,
	jlbec@evilplan.org, joseph.qi@linux.alibaba.com, richard@nod.at,
	djwong@kernel.org, damien.lemoal@opensource.wdc.com,
	naohiro.aota@wdc.com, jth@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ming.lei@redhat.com
Subject: Re: [PATCH v3 01/10] kobject: introduce kobject_del_and_put()
Message-ID: <ZBvgpBzEuFuyOD/c@ovpn-8-16.pek2.redhat.com>
References: <20230322165830.55071-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322165830.55071-1-frank.li@vivo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_221657_006991_488F3902 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu, Mar 23, 2023 at 12:58:30AM +0800, Yangtao Li wrote:
> There are plenty of using kobject_del() and kobject_put() together
> in the kernel tree. This patch wraps these two calls in a single helper.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -convert to inline helper
> v2:
> -add kobject_del_and_put() users
>  include/linux/kobject.h | 13 +++++++++++++
>  lib/kobject.c           |  3 +--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index bdab370a24f4..e21b7c22e355 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -112,6 +112,19 @@ extern struct kobject * __must_check kobject_get_unless_zero(
>  						struct kobject *kobj);
>  extern void kobject_put(struct kobject *kobj);
>  
> +/**
> + * kobject_del_and_put() - Delete kobject.
> + * @kobj: object.
> + *
> + * Unlink kobject from hierarchy and decrement the refcount.
> + * If refcount is 0, call kobject_cleanup().
> + */
> +static inline void kobject_del_and_put(struct kobject *kobj)
> +{
> +	kobject_del(kobj);
> +	kobject_put(kobj);
> +}

kobject_put() actually covers kobject removal automatically, which is
single stage removal. So if you see the two called together, it is
safe to kill kobject_del() directly.


thanks,
Ming


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
