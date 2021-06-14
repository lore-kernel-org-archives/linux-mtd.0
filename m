Return-Path: <SRS0=wcjI=LI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB27C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jun 2021 10:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA3B61421
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jun 2021 10:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA3B61421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3c/gGYRP7MFev/N1Q24PaIEtAOqw9XHAKA9Bnwq2FYA=; b=z7v
	vMSTEBfrE9WJhloDuXAE4si5onkpb9ni8ruG2V1zvUJIyQebeWb8uXbWneIp2s+2ItFr6RF+EejC9
	LsXnV1e6p8dv6HKIMCG5xfOvBxRVsArwt6u8a9bkfGdajMzhww0jyV1qbae8RNtzQ2fZjo7j8m/dr
	Y9EWLmDz31XROZnsZHEkRFOMk1dtvtrbPamjO812r6B9vUF0X4f/dJGmBVVt/wEF9hWnK1e6IllYM
	6zlu6e2eZruVpZD1vWeGJGQinuer44mCqEbQH89siSO5b23GOWISe2FDRCJjc6HPhxKwvL5Q0Ko9t
	nHMgw8zRboawvzaPEM7u4/K3L1boqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsk0U-00DcOz-IX; Mon, 14 Jun 2021 10:39:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsk09-00DcI0-6o
 for linux-mtd@lists.infradead.org; Mon, 14 Jun 2021 10:39:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id f5so40839604eds.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jun 2021 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=O8WpJQZenICGzTZvriCS7Y4CfqGQZ2ql9+HdnGk6G6s=;
 b=bdcKxFXvOkmDTtQXzP7mf2LQcxv/EPW1OQtkL6J73K5mTitWzIfYRVzdiSvpiQeJoX
 huhkHtgWgEfWZKxgGWl3xWgNoP/IMwIs7Ok+MlGlYCXMe0o+eAsLK/WqfJkOmq7XkieW
 M6B4qYXVOGsBidnAlv0Lep/L9Q8+s6P7zsXGKC5NWzRSgUa2Pco2QT3xSRoi5y7MekDK
 /+k/KrhWaCFunhe6AA/aXWMytJp83lMd6utSGelUW8/dhx8qLCUQ+SRpOIx2NgBnUef6
 1Ka10/2H2cqsmvrCKBX8vIxmL5Zdhf7DSuac+57lYLvIDALS9bzCmlgBL9lerpOx0Omp
 f/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=O8WpJQZenICGzTZvriCS7Y4CfqGQZ2ql9+HdnGk6G6s=;
 b=srcHKZ1xc7dHQa+gq3y7wrO4ICOKLe4KSnneMfob7zOLhUcaQrDY4GycXc77MP+fKp
 wKYiOrOX/3KZ+DeYW5XHuLAUNEPEIBV4w3IukK6pzWkVW89NQf9UsyxxlL1NSTZ+D4I5
 G1nnKEpQmfeJ0se9tuXkJd3ZsshoXOnNVx9/EBboxiLRQJpSFAa+t26OSU37dLFFlcJ9
 nJKmvITDg/MdDKyIE1+nXRddbGE1QWqaOQ9nWuebydSzAEJpg5spaMpM74jQKRKYIoSp
 4ht0YjFsKqkWM5tOZQKES5ru+2Vz91E+GBMJjyrmXgluzLTIbzimX4Cc2m94cGWk4oJx
 BkmQ==
X-Gm-Message-State: AOAM530z6I8K0e/3eGZhHvR/M0adcBPG4m53xkifG2f4IuQgRpjux9o3
 TBDF1OkTNf+coPZR85bQp6csFKsilsjqGRN4aj8=
X-Google-Smtp-Source: ABdhPJx7C6nm+tkdulhI7l2WHPhprlheB7uxotFwwYu2SNFXV928N8PWHkKv/cQvPNSUr2lsYZh2o7+yJcAdiC/yKI4=
X-Received: by 2002:a05:6402:3134:: with SMTP id
 dd20mr16058384edb.59.1623667166346; 
 Mon, 14 Jun 2021 03:39:26 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 14 Jun 2021 16:09:15 +0530
Message-ID: <CAOuPNLi8_PDyxtt+=j8AsX9pwLWcT4LmVWKj+UcyFOnj4RDBzg@mail.gmail.com>
Subject: Kernel 4.14: SQUASHFS error: xz decompression failed,
 data probably corrupt
To: open list <linux-kernel@vger.kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel@kvack.org, Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_033929_271629_AF21B432 
X-CRM114-Status: UNSURE (   9.98  )
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

Hi All,

With Kernel 4.14 we are getting squashfs error during bootup resulting
in kernel panic.
The details are below:
Device: ARM-32 board with Cortex-A7 (Single Core)
Storage: NAND Flash 512MiB
Kernel Version: 4.14.170 (maybe with some Linaro updates)
File system: Simple busybox with systemd (without Android)
File system type: UBIFS + SQUASHFS
UBI Volumes supported: rootfs (ro), others (rw)
-------------------

When we try to flash the UBI images and then try to boot the device,
we observe the below errors:
{{{
[    5.608810] SQUASHFS error: xz decompression failed, data probably corrupt
[    5.608846] SQUASHFS error: squashfs_read_data failed to read block 0x4d7ffe
[    5.614745] SQUASHFS error: Unable to read data cache entry [4d7ffe]
[    5.621939] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
[    5.628274] SQUASHFS error: Unable to read data cache entry [4d7ffe]
[    5.634934] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
[    5.641309] SQUASHFS error: Unable to read data cache entry [4d7ffe]
[    5.647954] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
[    5.654304] SQUASHFS error: Unable to read data cache entry [4d7ffe]
[    5.660977] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
[    5.667309] SQUASHFS error: Unable to read data cache entry [4d7ffe]
[    5.673997] SQUASHFS error: Unable to read page, block 4d7ffe, size 7a3c
[    5.680497] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00007f00
[....]
}}}
We also observed that some of our Yocto build images will work and
boots fine, while sometimes the build images cause this issue.

So we wanted to know:
a) What could be the root cause of this issue ?
b) Is it related to squashfs ?
c) If yes, are there any fixes available already in the latest mainline ?
    Please share some references.

Please let us know if anybody encountered this similar issue with
squashfs and how did you handle it ?

Note:
Our current commit in fs/squashfs is pointing at:
Squashfs: Compute expected length from inode size rather than block length


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
