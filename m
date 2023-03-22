Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A75C6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 23:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8uKlT92TTz4mNYWq/LUH2G2+M/o4EB8+qur65NYAfI=; b=Rj3BhJK7Rxyh5a
	mEPNFtRwe3tseA5LWRq65bocVkd4dczRc8RjL1X8VIYrhi0/VmqEqWfyjPkK0XgGkS/cKQC1HlD9H
	jYUBOcpkkope3l66tyVcV6mVmoHqvXQuPW6plZp6WVqTCfQmblUOAle4NUcy7kBMCYzEko+5msvbX
	SSdYRTy7y8hetjl+IE9YZo/PO0yWPM9hwJQqUtC20x0Ql1zenwpO0aJ0eCwKfdIqs6Al2LgJoujov
	W08VJqx592pCZiPGKrPDqLmdqIUbU1oXIvy90g8HaWDYXiH4uH+xeQJtuxT9zQaj/QrJHoA6be+4z
	iUc/M9ypz412JcOwtZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7vl-0009Df-0Q;
	Wed, 22 Mar 2023 23:31:45 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7vh-0009Cg-0r
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 23:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679527901; x=1711063901;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q9SHaaGc/iP3oUCDDkuobziv3fI8u5euiS4kcHH3kx8=;
  b=fGhRed7WUoBjrjIdo4SbgQTMXCrstuKgASuBx7XNAXQN0YaV+AMAN1yG
   j55E2Nu/B9SeI6f3KJA+T85/IiyJa4CKYthtznw0L8zl4SSlERw09AYsT
   r1M3pubMRYC80SnXkacb8ErZ8vQCQ83laKkGI26ht6qrhA0iOpKeh+n51
   5UJXuFZg3S8bUYmSeCCX3LnjKTvW3RavK7qHeP2bFthwfbOIRsRX18G9T
   VuiwQ4ozDq2Xy2n7CnlxMCdiztNRTVZufAifXJXe3o+OtLOdygtmlzDjF
   GKnVgaW4571LNr9qj5vTeNXAuqc5aXIlignCRvVFKgeO/37xhQ+yt2F7t
   w==;
X-IronPort-AV: E=Sophos;i="5.98,282,1673884800"; 
   d="scan'208";a="338330689"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:31:40 +0800
IronPort-SDR: SmsE2y3fXi7geW5xWC6X2EuYUnVxYaDgw9HI0r/cRQvuTtlum68vBhPDLdlXbhaf0xB9L7j/nx
 3VyrzvFR9LanIJvL35JoEhIv0V2I5Zazha2ZsP8S4AqhNObK0davyCWe9t2eNXUf7C8+id88Xv
 IfaevbrSFanyF8vj+RpG37XnPHTq3PpBXnO6IPvEopjur3Iq9tcERDUDmJ78KZOoEJ54Oj67PB
 EXJhBBvnV6o7QXNQjGYDZr7SxvFckcbnlMt4KsYMNfaQu30Ct+NFIqR5jIaJQ882nzJEVyzyrj
 0+E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 15:42:17 -0700
IronPort-SDR: 0MuPbwGWTn32sQPJDD8ytuSrRUF20oCGDG1XxqhmPYOfWJWgbDaKMNd4glyV1CISfx5lIdTfUX
 1wHI3qr7SFYR1UBVfV29+SK28KlG41wP7kwlj/2UIe9tlFl7I+MGu5xIVzOhejBmZ0v7kZb4WO
 dJPxofjiiCvGUgn21HfAW/txy3e/S4C6tu1Rs3giIJhkc43zbhu1oMBQ71WtbR6xITeCfkg7OX
 Sxfx5lTMOmJwOqBxB9Xl4rkX0byhkOf7qhxstwqw1qOzZatEIFLrWwazxKj9HMOvwIlagvoRgm
 dJA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 16:31:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Phl9R5997z1RtW2
	for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2023 16:31:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679527898; x=1682119899; bh=q9SHaaGc/iP3oUCDDkuobziv3fI8u5euiS4
	kcHH3kx8=; b=jXOcAHSjzQp3Y8DRAhI7Eqaykde0th0S9alUrID1c2LCC3wfAb9
	gKLpCqhNvhXIVpoACyCWdORhWPyVwcLyv+I3A4HyVbq47iykpBBgezzTIryrgP44
	YEKzud94Zk+Y8HC/UY2RnSvJBZedTJ3OfzPeXnPWHU3PAOtYg4P8hX2IvtQ6yBhi
	j4r/QQvfwmqbzwmimzdJGIuPI0o0MfJdBhX8DuQYGVDi4A2JABTEyXrQamz1e+uF
	+gUlyjlv0VsY1s6/lX1w99QOTvab/kA98gC8MKGuF5bkUAv65So0qyJzKTEypPY0
	ciNq+kgkTDjVCQlQD4ZfSdBBlYkyJL09/6w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hPrggCbMzO7O for <linux-mtd@lists.infradead.org>;
	Wed, 22 Mar 2023 16:31:38 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Phl9H74fjz1RtVm;
	Wed, 22 Mar 2023 16:31:31 -0700 (PDT)
Message-ID: <5e7e8187-f514-c65e-2615-26762a329590@opensource.wdc.com>
Date: Thu, 23 Mar 2023 08:31:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 01/10] kobject: introduce kobject_del_and_put()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 trond.myklebust@hammerspace.com, anna@kernel.org, konishi.ryusuke@gmail.com,
 mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
 richard@nod.at, djwong@kernel.org, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20230322165830.55071-1-frank.li@vivo.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230322165830.55071-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_163141_335675_FF609797 
X-CRM114-Status: GOOD (  23.26  )
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

On 3/23/23 01:58, Yangtao Li wrote:
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

Unlink kobject from hierarchy and decrement its refcount.

> + * If refcount is 0, call kobject_cleanup().

That is done by kobject_put() and not explicitly done directly in this helper.
So I would not mention this to avoid confusion as you otherwise have a
description that does not match the code we can see here.

With that fixed, this looks OK to me, so feel free to add:

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> + */
> +static inline void kobject_del_and_put(struct kobject *kobj)
> +{
> +	kobject_del(kobj);
> +	kobject_put(kobj);
> +}
> +
>  extern const void *kobject_namespace(const struct kobject *kobj);
>  extern void kobject_get_ownership(const struct kobject *kobj,
>  				  kuid_t *uid, kgid_t *gid);
> diff --git a/lib/kobject.c b/lib/kobject.c
> index f79a434e1231..e6c5a3ff1c53 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -876,8 +876,7 @@ void kset_unregister(struct kset *k)
>  {
>  	if (!k)
>  		return;
> -	kobject_del(&k->kobj);
> -	kobject_put(&k->kobj);
> +	kobject_del_and_put(&k->kobj);

Nit: You could simplify this one to be:

	if (k)
		kobject_del_and_put(&k->kobj);

and drop the return line.

>  }
>  EXPORT_SYMBOL(kset_unregister);
>  

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
