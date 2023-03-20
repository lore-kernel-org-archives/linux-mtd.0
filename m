Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A5C6FD1C
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 21:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEzlmlW9i3QPdOnwhwklBupoBmFQY86yrv38yHc71L8=; b=hgyLYBhJJzy8za
	glNMdHy/kYwufRo6HY8rawO1bzxPfU7QBOlSXtQ0iba+4rDtu3AB9j4v2qramYHv38g/6xZcokx9d
	dJrrENRh7fCT/ItE09XTgiw4xTe3Jgt6T25Ii1peBb3+t02lurU1NSLVdI7fiTaYSTEXsaDcl4OeM
	6xTn4fWbLRVTAt0BPTPd6O/oxV8BWjdjPTTf7DCRtItp4+FQwdI4aIbPEI4QO1n9j4oNUAekahgUQ
	ktrCZos3dktlNJffHXg5vVmGqwzMgaYnSD2YhR3JfNvtBTktdExdrBsPJosaLA1aG2C0IGMnUS26v
	mXpX/FMx9m0NxCK6uugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peNDn-00AYjl-0I;
	Mon, 20 Mar 2023 21:39:15 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peNDj-00AYiY-0c
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 21:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679348351; x=1710884351;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bxVzq8suDNih9SH1Ok62kaz7FvxQWlE5bz197aYsbjU=;
  b=qFkcbbF/NjLFjY/V9DWy5CU1BTq50SQ1An5emUpwOZx0BHhtLt4DNMGL
   GdTNi772tv6eghPPeX/rSZr8G3GTtxPMMlZPj+GOXD/yaoI4Ja4T3GFvB
   ELeUeouDY287WvHFzVqCq2/XsqcJqQg6ko812GZAmBjpc4GDeE2cdMerG
   4N9uHAyAE+vkrWxiSsehpG7UKdy92dxC1lu+D8odmAqBKOA+Fu9klTsHK
   94ZC1z6GRr0RxpBD7Bc55ivcHG6hkdYJmIPmDBfKcqgceieHDb3AA1k0W
   X1rpNb44OpCRzhmJTuKPThBAZ1fob2xZOkKsH6R/YqVkGQi2+Bm04R6RX
   g==;
X-IronPort-AV: E=Sophos;i="5.98,276,1673884800"; 
   d="scan'208";a="338129580"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2023 05:39:07 +0800
IronPort-SDR: oFvrpk/9lh4DevZ/YEtaZwGIWc6F9uj5IOBJZGLQR3lm8lrrw4naFIj7stxGYAbehdjZGQJSAX
 FLPusugGLO2FUSGtuS8JBAGGlVpFtk8tV/dWARbxHC4DRfobHV3tHBj8iItdcUTv7y0ODJ/A54
 S7E13A0P/w0Wyl9SfsYoflURa9/QHuI0O9HCVHTLpV/KcbV7Kz/j8qBcoPqASMlJMdngZWA7ZS
 WDwatPFt3ldC3x6xTQ1GdkHmQjuootrQCSg6EDjlvqeXPaZnVJ+yQtI8uFXo4Lt64m8HO+/3Mr
 1iI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Mar 2023 13:55:27 -0700
IronPort-SDR: qiZN0H3pKA16F5m4UytAS8/DzqxTlzW8DtFLpF/EMH7enTPCH5oghUAGAGZQPDE9LSloxwn6l4
 uID7Ui+qGHm6VcUt41NUsr3JNarJ+jm1oqFsnF4ZOnG9wYN6rIWHGNWDnRSlxOl/u0R8mEb29n
 KqtqOdVzjC6UivESz3M8GjrDnINXVPXcpx4d57gbpGDILetoNgyiZEU0tusD4Nk5DJCAKo/6+u
 gUAaW6luXeopG9aaANG5ONIgzDsvdenLRClq1QABctd2hi4/3JdiCv+CpvyNk/+GpAcVLUlTiA
 yto=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Mar 2023 14:39:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PgSmW1NR0z1RtW2
	for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2023 14:39:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679348345; x=1681940346; bh=bxVzq8suDNih9SH1Ok62kaz7FvxQWlE5bz1
	97aYsbjU=; b=EKxs8rpUot/qFRHAvND09IIAv6cqU/2Lev47PpifnoY6Vn42PvZ
	bLqMSLk5W+AyQuqTGKwodJfY4iDfhinl9cyIK7N2mtXEWEbGsMTiKxFf0DCuYwfv
	U7tD4WDxe1pbv3HNUfmVAdcHrTAMKvexZTU0GM1jYO4oNPGmPiD77lxKs2Zw8Hzb
	PwIdTneUr52J5sAiu9A7XMDGoEBHZesZf8Ek4BS/umk2gVFaA1nuC+gmt+D5Qto6
	f5pqaIAayhxw2wlTZV+cAvKH6KJ3w/adruI7wi3ZwobRCy9apzq/Jd2TLBhGAwdK
	dxo6IBbJ/jukaj9W89Dx0kqPLMgyapwzAcw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6pbCgMiKCaTl for <linux-mtd@lists.infradead.org>;
	Mon, 20 Mar 2023 14:39:05 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PgSmM4CNrz1RtVm;
	Mon, 20 Mar 2023 14:38:59 -0700 (PDT)
Message-ID: <2229e074-d78e-3bd5-bf06-a53e9ad57d02@opensource.wdc.com>
Date: Tue, 21 Mar 2023 06:38:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND,PATCH v2 01/10] kobject: introduce kobject_del_and_put()
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
References: <20230320184657.56198-1-frank.li@vivo.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230320184657.56198-1-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_143911_286615_7A5F3243 
X-CRM114-Status: GOOD (  21.73  )
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

On 3/21/23 03:46, Yangtao Li wrote:
> There are plenty of using kobject_del() and kobject_put() together
> in the kernel tree. This patch wraps these two calls in a single helper.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -add kobject_del_and_put() users
> resend patchset to gregkh, Rafael and Damien
>  include/linux/kobject.h |  1 +
>  lib/kobject.c           | 17 +++++++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index bdab370a24f4..782d4bd119f8 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -111,6 +111,7 @@ extern struct kobject *kobject_get(struct kobject *kobj);
>  extern struct kobject * __must_check kobject_get_unless_zero(
>  						struct kobject *kobj);
>  extern void kobject_put(struct kobject *kobj);
> +extern void kobject_del_and_put(struct kobject *kobj);
>  
>  extern const void *kobject_namespace(const struct kobject *kobj);
>  extern void kobject_get_ownership(const struct kobject *kobj,
> diff --git a/lib/kobject.c b/lib/kobject.c
> index 6e2f0bee3560..8c0293e37214 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -731,6 +731,20 @@ void kobject_put(struct kobject *kobj)
>  }
>  EXPORT_SYMBOL(kobject_put);
>  
> +/**
> + * kobject_del_and_put() - Delete kobject.
> + * @kobj: object.
> + *
> + * Unlink kobject from hierarchy and decrement the refcount.
> + * If refcount is 0, call kobject_cleanup().
> + */
> +void kobject_del_and_put(struct kobject *kobj)
> +{
> +	kobject_del(kobj);
> +	kobject_put(kobj);
> +}
> +EXPORT_SYMBOL_GPL(kobject_del_and_put);

Why not make this an inline helper defined in include/linux/kobject.h instead of
a new symbol ?

> +
>  static void dynamic_kobj_release(struct kobject *kobj)
>  {
>  	pr_debug("kobject: (%p): %s\n", kobj, __func__);
> @@ -874,8 +888,7 @@ void kset_unregister(struct kset *k)
>  {
>  	if (!k)
>  		return;
> -	kobject_del(&k->kobj);
> -	kobject_put(&k->kobj);
> +	kobject_del_and_put(&k->kobj);
>  }
>  EXPORT_SYMBOL(kset_unregister);
>  

-- 
Damien Le Moal
Western Digital Research


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
