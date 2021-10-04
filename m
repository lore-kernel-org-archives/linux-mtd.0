Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFFDC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDE16103D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEDE16103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	References:Subject:In-reply-to:CC:To:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+nnf/CgzgEMfAfnpC7OX0jmXKBWcayxtqvIOnlyy80=; b=xxBWjsUPttufX2
	+hTjZf+I933wCxGeArtWAXkwPxt7cs+2xjefuKJAkwGeoGHU/RoHGsiWnIfAzjGH186uqZ7SO2tu0
	xjsHdPWuWVTit16oa1W7FIKA1z3a9vZyOZkwbEju066Qul683OKrlpyQAWZea6CJ6bsIYbIFK5S3g
	8R75dkOprgwM/Xh/5t7Xf2/r1piyEj/DGzpRWkybYyQMSi7RuAHi1EDcDwAHcdrqlYvpmNku1iTgf
	MTH9T8Bn1clZ+cKuH1UTapKBoI4KBg+cdNPzjROoEJtnELhaV6PnY6C6o59tjL2zzFW8VKKWF1hon
	RDeywZiuCQPeP5m9D6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXGza-005C64-0d; Mon, 04 Oct 2021 05:58:26 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXGzW-005C29-Tf
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 05:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633327086;
 bh=3yQaFDx3HteINXfvXksHTXMue8daiL/SfDc07itzYXc=;
 h=X-UI-Sender-Class:From:To:CC:In-reply-to:Subject:Reply-to:
 References:Date;
 b=C34tpHZ63vLX2lWlplKZFtVaP6QSvYENnT6CFy2STHzNlqVz6XIbbCVYNpsVDRDFW
 BvUgClE9pCVUUxYhMc1YPkYEkWqZf2PTkH9pwOmCoR9ymLNJywMEsPuMdMeYeZNjwq
 N49SJynqauYZwpzibAWPNzLet2y4i1eho40ozId8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.131]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M3lYB-1mWzjq2m5T-000wlv; Mon, 04 Oct 2021 07:58:06 +0200
Received: by corona.crabdance.com (Postfix, from userid 1000)
 id C52AD899CC4; Sun,  3 Oct 2021 22:57:58 -0700 (PDT)
From: Stefan Schaeckeler <schaecsn@gmx.net>
To: richard@nod.at
CC: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sschaeck@cisco.com
In-reply-to: <1815586081.32955.1633291105033.JavaMail.zimbra@nod.at> (message
 from Richard Weinberger on Sun, 3 Oct 2021 21:58:25 +0200 (CEST))
Subject: Re: [PATCH 1/1] ubifs: ubifs to export filesystem error counters
References: <20210907214034.11676-1-schaecsn@gmx.net>
 <20210907214034.11676-2-schaecsn@gmx.net>
 <1815586081.32955.1633291105033.JavaMail.zimbra@nod.at>
Message-Id: <20211004055758.C52AD899CC4@corona.crabdance.com>
Date: Sun,  3 Oct 2021 22:57:58 -0700 (PDT)
X-Provags-ID: V03:K1:Zg0mDQu0TezbLoYA8pDQR0+RMH3KAnGSWTLtVxSkc71qesyBOPr
 JBAf+vDG++ICxoeTj8f3iQe3YwwWUAK9o9I2YEP0s9tsLe4jckW0gqoysT8GPpP31/HaS2y
 c4dWeRxMxRVkqy+5NQEhJX/4pSLhLYFcGX35nT709N4wJxjXWKjPlOPlaapuoKzNcn+O2mx
 WNnJxPshu06YrrT1JY4gQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mhArpKz+4UI=:iUQjTCYBLI/S7wj60DELtH
 cFRnjvOicAMHcSqcHAjqmlh1flfDRg/Q7Y9EPM+bXDGJfgSiXeydoJ9VcRxi6EBQP03FYY/UC
 RcUaNGJJXW21XPyjlrsHuHx4vGuHFXWegwYSuf7YchEWxq5QPwPXSFvs+HjasRwOnlyCzAjBn
 5UBKL21UnGjmQL/CowHbBfaIujmh3viWS393J1V7ng0MpXIu4MfZg7tp/t0Jy947x4wC+gDYU
 o9FUCcgYbuG1xW60Bwcoj5rDsTPQQquoXG6nS3HiFlhn6iQmJSbBp+dLCQ9A4kEg9EhS6yXXf
 Unhzo8KaIfp9yj+7dkkjTxVt/8HfawXXFVHv9coDRNWHX7RXqpOfgqTTnV47qxB45q5mmOlVR
 wIiUKhLqP4Rf3mGfHhWh3wFFoiTj0JNxMlPJankhQDV/UhHag2A5GzUAvO/527s2zIK4GrJDc
 nKZdImbMDQR21zU1yzYEsnzLefIZBLYvtPHrG8R2TDwBVkwGeG9FQ+iEwgkQHhSNxCwC6WDup
 +eTh8y3h6qrPd0p53CeQ/VYTqmCvbE5UoxrY9WxqdN8hnB2DKYPiJp/pFwzAE8WhSyp4GIhZ9
 WXXD1H/X07ugFbE5J+6OEgB1Ko4Oui2vjGKyDg+go9LF5xzripN8UqOa3INpXspyub/7TO7Ha
 EsXVbsAU2glLfjXt6M1oKCsGl6ecsxX5FMUBE6S121+2yaz9y/AqGY7/0l/lnUYdsGwfDREhE
 r7LE9vMsxk6xdY931+w/mOPs+6EnPG1sZSvPlY1fRvht89qiEkaCCRnEr91hdnwmcd/FBszEd
 rznQuT1vQ88k683h8mjS/xNu7iGc0Y330c1pmbPt9IxCQ0Ea7yYoQ3Nt18foCxEOgQ79vPy6/
 vD9NmCzaSdN/8zzaC3Rsn/SImmCLX3KMgbgXou61OyOWxFEz/W93Uuhsayn0ELAAablDcaOmm
 4uG168dmiSg7swjlleuEKcZH/Nz2FsIaJE10CKoZS+SiaP96a6uj+nwLi3ljhsnK56fwx2+0I
 l68YVuMYw/95VPz4dnDlmoeKp7v0+4uThgCM6eY/Uw+w/o3cyRMzULmfBHkClzy65dwj2GhS0
 VB5OrH7zIvP6cs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_225823_341412_F7441110 
X-CRM114-Status: GOOD (  27.24  )
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
Reply-To: schaecsn@gmx.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Richard,

> > Not all ubifs filesystem errors are propagated to userspace.
> >
> > Export bad magic, bad node and crc errors via sysfs. This allows userspace
> > to notice filesystem errors:
> >
> > /sys/fs/ubifs/ubiX_Y/errors_magic
> > /sys/fs/ubifs/ubiX_Y/errors_node
> > /sys/fs/ubifs/ubiX_Y/errors_crc
> >
> > The counters are reset to 0 with a remount. Writing anything into the
> > counters also clears them.
>
> I think this is a nice feature. Thanks for implementing it.
> Please see some minor nits below.
>
> Is there a specific reason why you didn't implement it via UBIFS's debugfs interface?

These error counters are not meant for aiding debugging but for userspace to
monitor the sanity of the filesystem. Also ext4 exports error counters via
sysfs - it's probably a good idea to be consistent with them.

$ dir /sys/fs/ext4/sdb2/*error*
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/errors_count
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/first_error_block
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/first_error_errcode
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/first_error_func
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/first_error_ino
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/first_error_line
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/first_error_time
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/last_error_block
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/last_error_errcode
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/last_error_func
-r--r--r-- 1 root root 4096 Oct  3 13:47 /sys/fs/ext4/sdb2/last_error_ino
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/last_error_line
-r--r--r-- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/last_error_time
--w------- 1 root root 4096 Oct  3 13:46 /sys/fs/ext4/sdb2/trigger_fs_error


> sysfs is ABI, so we cannot change much anymore.

Judging by the filesystem permissions above, ext4 does not seem to allow
resetting error counters. If you worry about unchangable ABIs then we could
play it safe and don't support write callbacks for resetting the error counters
in an initial version of the ubifs sysfs. What do you think?

When we are at it, in the current code, writing anything into a sysfs node
resets the corresponding counter. One could fine-tune that to set the counter
to whatever non-negative integer is passed.


> > +		if (c->stats)
> > +			c->stats->magic_errors++;
>
> Please wrap this into a helper function.

Ack.


> > +		if (c->stats)
> > +			c->stats->node_errors++;
>
> Same.

Ack.


> > +		if (c->stats)
> > +			c->stats->crc_errors++;
>
> Same.

Ack.


> > +#define UBIFS_ATTR_FUNC(_name, _mode) UBIFS_ATTR(_name, _mode, _name)
> > +
> > +UBIFS_ATTR_FUNC(errors_magic, 0644);
> > +UBIFS_ATTR_FUNC(errors_crc, 0644);
> > +UBIFS_ATTR_FUNC(errors_node, 0644);
>
> I'm not sure whether everyone should be allowed to read these stats.
> dmesg is also restricted these days. An unprivileged user should not see the
> errors he can indirectly trigger.

I don't mind 600, but having error counters world-readable is consistent with
ext4 (see dir above) and so I suggest to keep 644.


> > +	case attr_errors_crc:
> > +		return snprintf(buf, PAGE_SIZE, "%u\n",
> > +				sbi->stats->crc_errors);
>
> Please use sysfs_emit().

Ack.


> > +	if (n == UBIFS_DFS_DIR_LEN) {
> > +		/* The array size is too small */
> > +		ret = -EINVAL;
> > +		goto out_last;
>
> Where is c->stats released in case of an error?

My fault. Will be fixed.


> > diff --git a/fs/ubifs/sysfs.h b/fs/ubifs/sysfs.h
> > new file mode 100644
> > index 000000000000..a10a82585af8
> > --- /dev/null
> > +++ b/fs/ubifs/sysfs.h
>
> Do we really need a new header file?
> Usually most run-time stuff of UBIFS is part of ubifs.h.

I wanted to be consistent with debugfs where fs/ubifs/debug.c comes with its
own header fs/ubifs/debug.h.


I'll send out a new patch once we agree on all changes. To recap:

- write callbacks: do we remove them? If not, do we keep them as is or do we
  fine-tine them by letting a non-negative integer set the counter?

- 644 (world-readable) counters to be consistent with ext4?

- keep sysfs.h to be consistent with debugfs?

 Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
