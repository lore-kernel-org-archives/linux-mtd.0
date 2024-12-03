Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3AE74AC2
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Cc:To:
	From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=o7CH4nsk1n2JkAELxeh+SHMWNnfLBoVzydnEOO7LMTM=; b=csDiGba5o7/LLr
	ixYwHTNG4texNEPpasjlKCIb85BfWnYmx0qYck1rNUKXxomDwSB1sa/fJAla0CYlVEqa4zr4BOE2w
	yEn3sE3Yy4oodXLgdAnKweOD6NYysC8WTuHkrJ6Ns+usQCHAS3OzeQjuw/dCVR+EnbEoqMVCMjpqv
	EukEt4xLarh5GZw04cltf+AlepZQDGJK4FHhB96ooufKCOA4RhvhWKZZxTGZy+CLqrJWVHQCGWq6K
	D6kDgYDwgfhkutmAYwF/DdgZ0CUVOcrVEBjpPOG28MkBGP95Pss7wiaZxZ2/vDb8CUHv/rM+nRKz3
	l/9ZDFePhytVdYL/GzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVPt-0000000A2jC-2yj4;
	Tue, 03 Dec 2024 16:06:25 +0000
Received: from [2607:fcd0:100:8a00::2] (helo=bedivere.hansenpartnership.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVPr-0000000A2i9-0zjB
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 16:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733241982;
	bh=VBBfv3eA4AsVsLgBF8VnP+EajJe1ALpu2GW7YHfiN/w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:From;
	b=lHnQZbqTPw8lccD9LZoQTnjENuqFmq3M4qdXn9YwdcXuh8kaYOH60UbGnuArtEJoE
	 Px4kL7hmZa2/uxmjqmqHUiq2gnIFhqP/9JNM4Zxjm340Kjh3IenF17vJPycyc5doEz
	 9qzMTvJH2/Dq+wqAj7McqxgXVZICR0uf3Mza6cXQ=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id A277A128793E;
	Tue, 03 Dec 2024 11:06:22 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Kttl9qoRVbVg; Tue,  3 Dec 2024 11:06:22 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733241982;
	bh=VBBfv3eA4AsVsLgBF8VnP+EajJe1ALpu2GW7YHfiN/w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:From;
	b=lHnQZbqTPw8lccD9LZoQTnjENuqFmq3M4qdXn9YwdcXuh8kaYOH60UbGnuArtEJoE
	 Px4kL7hmZa2/uxmjqmqHUiq2gnIFhqP/9JNM4Zxjm340Kjh3IenF17vJPycyc5doEz
	 9qzMTvJH2/Dq+wqAj7McqxgXVZICR0uf3Mza6cXQ=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 1133D128718C;
	Tue, 03 Dec 2024 11:06:17 -0500 (EST)
Message-ID: <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
Subject: Re: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux@weissschuh.net
Cc: James.Bottomley@HansenPartnership.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, ajd@linux.ibm.com, alexander.deucher@amd.com, 
 alison.schofield@intel.com, amd-gfx@lists.freedesktop.org, arnd@arndb.de, 
 bhelgaas@google.com, carlos.bilbao.osdev@gmail.com,
 christian.koenig@amd.com,  dan.j.williams@intel.com, dave.jiang@intel.com,
 dave@stgolabs.net,  david.e.box@linux.intel.com, decui@microsoft.com, 
 dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org, 
 fbarrat@linux.ibm.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, ira.weiny@intel.com, 
 jgg@ziepe.ca, jonathan.cameron@huawei.com, kys@microsoft.com,
 leon@kernel.org,  linux-alpha@vger.kernel.org, linux-cxl@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 logang@deltatee.com,  martin.petersen@oracle.com, mattst88@gmail.com,
 miquel.raynal@bootlin.com,  mwalle@kernel.org,
 naveenkrishna.chatradhi@amd.com,  platform-driver-x86@vger.kernel.org,
 pratyush@kernel.org, rafael@kernel.org,  richard.henderson@linaro.org,
 richard@nod.at, simona@ffwll.ch,  srinivas.kandagatla@linaro.org,
 tudor.ambarus@linaro.org, vigneshr@ti.com,  vishal.l.verma@intel.com,
 wei.liu@kernel.org
Date: Tue, 03 Dec 2024 11:06:16 -0500
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_080623_290474_C0FAF1BA 
X-CRM114-Status: GOOD (  13.61  )
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

> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index
> d17c473c1ef292875475bf3bdf62d07241c13882..d713a6445a6267145a7014f308d
> f3bb25b8c3287 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -305,8 +305,12 @@ struct bin_attribute {
>  	struct address_space *(*f_mapping)(void);
>  	ssize_t (*read)(struct file *, struct kobject *, struct
> bin_attribute *,
>  			char *, loff_t, size_t);
> +	ssize_t (*read_new)(struct file *, struct kobject *, const
> struct bin_attribute *,
> +			    char *, loff_t, size_t);
>  	ssize_t (*write)(struct file *, struct kobject *, struct
> bin_attribute *,
>  			 char *, loff_t, size_t);
> +	ssize_t (*write_new)(struct file *, struct kobject *,
> +			     const struct bin_attribute *, char *,
> loff_t, size_t);
>  	loff_t (*llseek)(struct file *, struct kobject *, const
> struct bin_attribute *,
>  			 loff_t, int);
>  	int (*mmap)(struct file *, struct kobject *, const struct
> bin_attribute *attr,
> @@ -325,11 +329,28 @@ struct bin_attribute {
>   */
>  #define sysfs_bin_attr_init(bin_attr) sysfs_attr_init(&(bin_attr)-
> >attr)
>  
> +typedef ssize_t __sysfs_bin_rw_handler_new(struct file *, struct
> kobject *,
> +					   const struct
> bin_attribute *, char *, loff_t, size_t);
> +
>  /* macros to create static binary attributes easier */
>  #define __BIN_ATTR(_name, _mode, _read, _write, _size)
> {		\
>  	.attr = { .name = __stringify(_name), .mode = _mode
> },		\
> -	.read	=
> _read,						\
> -	.write	=
> _write,						\
> +	.read =
> _Generic(_read,						\
> +		__sysfs_bin_rw_handler_new * :
> NULL,			\
> +		default :
> _read						\
> +	),							
> 	\
> +	.read_new =
> _Generic(_read,					\
> +		__sysfs_bin_rw_handler_new * :
> _read,			\
> +		default :
> NULL						\
> +	),							
> 	\
> +	.write =
> _Generic(_write,					\
> +		__sysfs_bin_rw_handler_new * :
> NULL,			\
> +		default :
> _write					\
> +	),							
> 	\
> +	.write_new =
> _Generic(_write,					\
> +		__sysfs_bin_rw_handler_new * :
> _write,			\
> +		default :
> NULL						\
> +	),							
> 	\
>  	.size	=
> _size,						\
>  }

It's probably a bit late now, but you've done this the wrong way
around.  What you should have done is added the const to .read/.write
then added a .read_old/.write_old with the original function prototype
and used _Generic() to switch between them.  Then when there are no
more non const left, you can simply remove .read_old and .write_old
without getting Linus annoyed by having to do something like this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e70140ba0d2b1a30467d4af6bcfe761327b9ec95

Regards,

James


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
