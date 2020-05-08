Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB37C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 07:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9123A21582
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 07:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLChIHYe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m2YIKgPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9123A21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0uIYvN0bAYUCn41oD5WpPt5XJMfq3OqyCyMrROiLrY=; b=bLChIHYeQWnFlB
	6h3ImoQXhXPWELDPpizZkaDqFM5Cui+qbWttiqK3iszIYijm/uCMggp2V7gDuxlfGiWhsU6uv1rPO
	OQQNRKBhWWTlaZaxcbv2yAwcZlCk3BbXZ2hXTiOPvxWPPxVmGXTcaBSEggeh8DyFZfkRZZqLISjpl
	Iv7OzB+eqKV1Qgm4z1vz86qcwn9qmCSXWoUYLwJsFWLF/pUSrUNebXfdgMt9oP4+SVlG0vqacdyQW
	caSKi0A6vJPAtZ9e8pbAT2RYGSWEQJA1qzVahDPQmvDH92tZ4nIoLDQKGaryM7R3IgpvgcgZEyMt3
	kwFS8imiWK7EWvfKMEdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWxQG-0000t6-Vy; Fri, 08 May 2020 07:27:52 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWxQD-0000sn-Jy
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 07:27:51 +0000
Received: by mail-pg1-x544.google.com with SMTP id a4so497165pgc.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 May 2020 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0eDRJhDdXEyJ4k8o9rxXKO4qTxW18novqGE2BWki1LE=;
 b=m2YIKgPM0b2WmcYJPsYM2wGs0xjLHunZK0VunuEeSoQune0sz1ruZb22SQNpjPcpWK
 U+GQrn7cbNuuFYowJ8Ky4I3qVEMfhvzDlohxmO1O6yucgZHCqSOKBnYainUr7MhEv3xO
 z1G8FK6AMWz1Uz7ISpHL/KL2FbaBmVFLDg5LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0eDRJhDdXEyJ4k8o9rxXKO4qTxW18novqGE2BWki1LE=;
 b=e+4cHc82AMv4RTRHFaeV1PDob9GFCJpsGqKUhnVVLbxusOeaO1pybcr62zBs7t31aF
 zo7OQRMW1ixaDVv5At8AZQb1tOeE2t4m/h8skgyVIlCwaYg0bKpdBAkTwtiN3rHtne6h
 AkwmobsHLZQAIIbKsI5coEqGOKIREicN+6E0UujH/ViM2u2XhLKEGRG4ft8T1Eeg7H0M
 q+08j1WKIHKQ1Kqmi/W0DS6bdXSaCQ8nuR2AfS8+pjmHFYLyKtf7jC5gAvOba2liHLrq
 CE/ri8IGeuT2thriDXmdjIcUrlh0SpCGfoAmCfvieJnoUXuvZin2sEHDHTYUYtHBj9aN
 U26w==
X-Gm-Message-State: AGi0PuZ4bXsuTyKQu35jFjhMQQpi3bQPOcDoyAVePCwj9WlwL8iVrWg4
 ngLh74WVZMCM2km+RplwqxD7og==
X-Google-Smtp-Source: APiQypK9+XDNQjZa9i5WiAs7yehEj+1TLNclficOKaL6MtjPkOpW00BQpAPrSOWcWyipV1AhdWYbhg==
X-Received: by 2002:a62:14a:: with SMTP id 71mr1372603pfb.33.1588922868472;
 Fri, 08 May 2020 00:27:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c15sm841519pfo.188.2020.05.08.00.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 00:27:47 -0700 (PDT)
Date: Fri, 8 May 2020 00:27:46 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v4 00/12] pstore: mtd: support crash log to block and mtd
 device
Message-ID: <202005080020.41C33738@keescook>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_002749_678299_5BAA0002 
X-CRM114-Status: GOOD (  14.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 linux-doc@vger.kernel.org, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 07, 2020 at 11:39:52PM -0700, Kees Cook wrote:
> So far, I've identified the following stuff left to do:
> [...]
>         - implement ramoops-like probe feature for pstore/blk

With the following hack, I'm able to start testing the series:

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index a736555e1ed3..7145da079267 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -373,12 +373,14 @@ int psblk_register_blkdev(unsigned int major, unsigned int flags,
 	if (IS_ERR(binfo))
 		return PTR_ERR(binfo);
 
+#if 0
 	/* only allow driver matching the @blkdev */
 	if (!binfo->devt || MAJOR(binfo->devt) != major) {
 		pr_debug("invalid major %u (expect %u)\n",
 				major, MAJOR(binfo->devt));
 		return -ENODEV;
 	}
+#endif
 
 	/* hold bdev exclusively */
 	bdev = psblk_get_bdev(holder);
@@ -423,7 +425,7 @@ void psblk_unregister_blkdev(unsigned int major)
 	struct psblk_device dev = {.read = psblk_generic_blk_read};
 	void *holder = blkdev;
 
-	if (psblk_bdev && MAJOR(psblk_bdev->bd_dev) == major) {
+	if (psblk_bdev/* && MAJOR(psblk_bdev->bd_dev) == major*/) {
 		psblk_unregister_device(&dev);
 		psblk_put_bdev(psblk_bdev, holder);
 		blkdev_panic_write = NULL;
@@ -476,6 +478,24 @@ int pstore_blk_usr_info(struct pstore_blk_info *info)
 }
 EXPORT_SYMBOL_GPL(pstore_blk_usr_info);
 
+static int __init pstore_blk_init(void)
+{
+	int ret = 0;
+
+	if (blkdev[0])
+		ret = psblk_register_blkdev(0, 0, NULL);
+
+	return ret;
+}
+postcore_initcall(pstore_blk_init);
+
+static void __exit pstore_blk_exit(void)
+{
+	psblk_unregister_blkdev(0);
+}
+module_exit(pstore_blk_exit);
+
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
 MODULE_DESCRIPTION("pstore backend for block devices");


Then I can get things up and running with:

# insmod pstore.ko compress=off
# insmod pstore_zone.ko
# truncate pstore-blk.raw --size 100M
# losetup -f --show pstore-blk.raw
/dev/loop0
# insmod pstore_blk.ko blkdev=/dev/loop0 kmsg_size=16 console_size=64

So far, I've hit a few bugs. The most obvious is that "rmmod" causes a
fault, so I think locking and other things need to be fixed up further.
After that, it looked like all the compressed files were failing to
decompress, which implies some kind of buffer offset problem. When I
loaded with pstore.compress=off I got readable logs, but there is a span
of garbage between the header and the body in
/sys/fs/pstore/dmesg-pstore-zone-1 etc.

Cool so far! It just needs a bit more testing a polish. :)

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
