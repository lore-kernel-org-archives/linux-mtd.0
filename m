Return-Path: <SRS0=7oHA=YE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C190C47404
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 09:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA3C21D71
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 09:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EW2A4Mkh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tru1dtUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA3C21D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkmheZiuuGpR5GNNoGqFtudTZVlV70Kw1FSn7rxjaKE=; b=EW2A4MkhrUTwai
	ph45nPNDeoFhiO/rnjdavTDjlXgB7LaQU5TBhsHfYvXjf4aH5qYHIO4Mb8J8GVzZW+EkqKzGCuX76
	pxSVEvgzs5LYCScvtDpZKnfom/22NNvR5QOdQ8NKbB4yPUqtFpi4CRAvNYNuGui55i9M/wYIG8FbO
	EO76JcLsuHJqj63/Brkjc58KxlO3ZFaU8cGbNJxW6rQrPhoXL/1hLCLqgFjhYQuXOgdBxYTRTnWzO
	LDM+UlM+146jDrp9ijxRzMMM4iOQpCv/aoBsgOznBGps9ZDfhP0wI3FpnOStsuSwKzdNXUL9SeTaT
	3pTQR5OkAXe8XL44mDMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIrNC-0004D2-5a; Fri, 11 Oct 2019 09:38:10 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIrN9-0004CX-5R
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2019 09:38:08 +0000
Received: by mail-io1-xd41.google.com with SMTP id q10so20225972iop.2
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2019 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tZSRocoCsLRO0f9HyJHZcSOACRd9xPDxC6Yf/xd/Rpo=;
 b=tru1dtUEL0CaRVu49dsT4k25Vdl6FTp54hBr92V6c0inuKusGlKz/yXK3GXtlhDulw
 CKdmSydoWPd6eWgstonmURfZI62910UqyePhr59pnsg/qk4judC+BPT6OFg2NRNAAzy0
 xHX+N2oluEj7UxenJz3UIxZX+AdeVGtTQA8s8yHNE6rQtWOnAZaA+U5JZ8EQRGExC5Xn
 3Jr2+SNjObeeIQpLKeuGQA5VstvykW2tgny/PhGxPKOezMO3D6AoMCE69lkDnuI7wYpW
 quJZvqzdAadBQB2DqWp44W7PGmcd5cBuGWn+O9qlIRvJB4zqMDVEhfozSCUwCNEy0ZqF
 SXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tZSRocoCsLRO0f9HyJHZcSOACRd9xPDxC6Yf/xd/Rpo=;
 b=Y0WeQFIsqV7jblsRZmcPLq+UxDJbP3gLpaES2re3KMH3UqTOLymTeiuQ3XWylbz6P3
 9Rjn4nm2WALrdREOnSp+vNuzsdM0WOd4dUF9XBfZ7UxLRw8JQn6yIOl248nRVSHQg5ri
 Lj4J6BWYNWnwlujugP2ubT1bHkVSiV/67dY7s5BswQfFpJFLUdZtX4CE/FwDFhq10aOa
 phI7iZ5Na2eckRHBqq/vbSRwEpdsRXaukjvurjtVwl1vIF5dObDjM7SjG4AplQ7wiUhS
 KR+tX6bb5PNiYmUftBOFQ+fanvfXoo+CSoooMwte7d4F6OUe3UZqO4RzD2QuYtj+iIlj
 59IA==
X-Gm-Message-State: APjAAAWmqCh9c8SvjdL9mswSgHndd9hAZuzOZUF8H7ELteu5CzaRXi99
 zSUAf57Becv5VzGox/VdTsJR1cBk9VOKHjFq8GmOCo8g
X-Google-Smtp-Source: APXvYqyOtILK6/gJLeitm+B24DsO7cKyhzqYnKsn3f9L+a9Mhtt9jmt3A+dRzXcsrSnlsVQjVA2zjkD1pYmS8nfYtw8=
X-Received: by 2002:a5d:8886:: with SMTP id d6mr6050163ioo.301.1570786682333; 
 Fri, 11 Oct 2019 02:38:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Fri, 11 Oct 2019 02:38:01
 -0700 (PDT)
In-Reply-To: <CAFLxGvybooDyV_D55A1rCh_jfSjBdp4SDaHHua2F-eMYomZpLg@mail.gmail.com>
References: <CAA=hcWRsrE73HPc0qzcUY7AEHha3NUYQCXj7tTK8o-KN0xLbzw@mail.gmail.com>
 <CAFLxGvybooDyV_D55A1rCh_jfSjBdp4SDaHHua2F-eMYomZpLg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Fri, 11 Oct 2019 20:38:01 +1100
Message-ID: <CAA=hcWRj_dhRPqRez97hHDVQ55tXbRV9VGs-okF-eKSg=6x=4g@mail.gmail.com>
Subject: Re: Where to define multiple volumes sizes in one MTD rootfs
 partition?
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_023807_233276_D86AD41B 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/5/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> On Sat, Oct 5, 2019 at 2:51 AM JH <jupiter.hce@gmail.com> wrote:
>> Recently, one of my device is broken failed to boot up, I still don't
>> know what was the cause by hardware problem or software, to be
>> precaution in the future meltdown, I am going to separate all writing
>> data from ubi0 to to another ubi volume ubi1, to keep the rootfs in
>> ubi0 read only. How can I define the ubi0 volume size to 160 MB and
>> the ubi1 volume size to 30 MB?
>
> Don't setup multiple UBI instances on the same chip.
> The wear leveling domain should be as large as possible.
>
> If you want to have multiple UBIFS filesystems, just create more UBI
> volumes.

Hmm, wandering for several days how to do it, reading lots of
documents, still not clear how could I make that work, let's say I
have following a volume configure file:

$ cat volume.conf

[kernel-volume]
mode=ubi
image=zImage
vol_id=1
vol_size=10MiB
vol_type=static
vol_name=kernel

[rootfs-volume]
mode=ubi
image=rootfs_data
vol_id=2
vol_size=110MiB
vol_type=static
vol_name=rootfs

[data-volume]
mode=ubi
image=rootfs_data
vol_id=3
vol_size=10MiB
vol_type=dynamic
vol_name=data
vol_flags=autoresize

$ ubinize -o rootfs.img -p 130MiB -m 512 -s 256 volume.conf

$ ubidetach -p /dev/mtd5
$ ubiformat /dev/mtd5 -y
$ ubiattach -m 5
$ ubimkvol /dev/ubi0 -s 130MiB -N rootfs_data

$ mount -t ubifs ubi0:rootfs_data /mnt

If I have a single ubi0 rootfs in /dev/mtd5, I can set
"root=ubi0:rootfs_data rw ubi.mtd=5,2048  noinitrd rootfstype=ubifs
mem=256M rootwait=1"

$ tar zxvf yocto-image-rootfs.tar.gz -C /mnt

It can boot from the a single rootfs volume.

But for multiple volumes in ubi0, I lost completely, how can it boot
from volume configure file with multiple volumes? Where the
volume.conf should be placed in Linux rootfs, in "/"? If it is correct
to copy volume.conf to /mnt (the "/"), how will it boot from NAND with
multiple volumes? That is most confusing parts, I could not see any
clear examples and statements in documents, appreciate kindly advice.

Thank you very much Richard.

Kind regards,

- jh



it works, but how it can boot from volume configure file?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
