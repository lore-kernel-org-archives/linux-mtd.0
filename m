Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BA3CA9EB9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 06:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 995872053B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 06:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxTS+0Jj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJJ0Q9/X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 995872053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/smPwEMzL9V22zUrfXFplU2CqT4rsdsdncW310n17WQ=; b=oxTS+0JjojPu+W
	3MEjYAJwD1X4sDn6mOyx1GwLDZvZVbsICMde8FEHAzOhxdPGUboEbGIJodE0tc4AIdjTIsCcO++PH
	IE+pvU8hL50/seAteI+v6ZjkxCyqkHcrFzuqMBmV3gJk2mGjlUm+n4kEulmlI2xljUceCfqDxLH37
	Il88G8TIoCu+j7AMHzz+nreb+jL6fdnbSzvGBkbqId3/aWiXtrctj86EW5QVRidh+t33Sih2J+Fh+
	7qeB2pjMhcN6zxCz2a7/iI+1LhjOkOtevyXO+0veF4ovoYzO3oFkjCYYi1xix4xbKF37U1M5kzmEF
	Ip1DN5aR4zw95nOIRvDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPKYT-0002Lm-8b; Tue, 29 Oct 2019 06:00:33 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPKYQ-0002L7-GX
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 06:00:31 +0000
Received: by mail-io1-xd41.google.com with SMTP id c16so13489610ioc.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2019 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=w3hPq2oyLOX9HAdAs0XCaQ8BLpj3Wdj47JMCaxYTCJM=;
 b=IJJ0Q9/Xu02ROsnfzg5S7nJwf6vYhnY5JJyp5QhkLWQaC7zZ/ixj6rWVgvfA18+pBV
 ARZrYQEmFDsuAioWmjokZIkaG4hNKiG5yWsbOYdsQaODNVm8jALxsdYtxjrAGDnVZx5Q
 ZWLwx0zS8xAijBqmmGpcsPQydCWHVdyDDj6g3Wryk1RE9lX2VMqXsYY1D+kKcMTxjJY4
 /N/OWKD/nbSr/9asW/rAi5mJNopcBVEXz5jHQ5HkMYWbVG3qZKBE/BJ2UrSS7CxNzikY
 7wb2lyA5u6Oe34hEx5W7EGUp1Y+ehAHsZYHN5ovqC2vDX7XbGp+CObC/B3OBK0TDjbFo
 jEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=w3hPq2oyLOX9HAdAs0XCaQ8BLpj3Wdj47JMCaxYTCJM=;
 b=Zi5sMLWvNepvh3uRKwBOtBEVQVjaTLhxUnazmdjlg5uheA+PKwR5Uiu+rgLCksQRoa
 62B3lRgDIBKJjQeoKdv32Spufaw40XM2IOYlMcE9iJkCM5GDAJDFl0Z/5elBNBjhL3CP
 d5fqZRIoiQ9kqRXpqIYOigZSrj7gJvB3ttQcwLxaRdUCExkmVfjkyNGN6aSXL3phhspy
 Nc12ZnHJLcVqE2gzyNvtHqRsup1h/Xyxdu9xil4/KQLU0nmYANwGXGJurgHUIHga4yiv
 pQYXJRD5enyDLTB/H6shuJGAzJLgruDzCplcgBx78LkiI8guXKPQD/o0zhOfmGIzbUZS
 L6rg==
X-Gm-Message-State: APjAAAWtRbeaUc9W/v0rifDL+9p1GCAkHNRN4tRDS7X+fgheKvk++jNT
 VORzq4FlxoI6XONMmQybwfB+lzjDPy5BZnohx5w=
X-Google-Smtp-Source: APXvYqwBlFV9kgIDW22vJq5XuRVVESY2ZLESeOwZMllT0E6YUX9SDqZgg91Ci7hYZ+yfKBQ9HNpDXUoOYyBjJgaD8m8=
X-Received: by 2002:a5d:8d13:: with SMTP id p19mr1777851ioj.306.1572328826516; 
 Mon, 28 Oct 2019 23:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Mon, 28 Oct 2019 23:00:24
 -0700 (PDT)
In-Reply-To: <CAFLxGvxC3wHY2Jciv0OOJCdtObSq-1vqJyAMJ=X=_j3cJr49LA@mail.gmail.com>
References: <CAA=hcWRsrE73HPc0qzcUY7AEHha3NUYQCXj7tTK8o-KN0xLbzw@mail.gmail.com>
 <CAFLxGvybooDyV_D55A1rCh_jfSjBdp4SDaHHua2F-eMYomZpLg@mail.gmail.com>
 <CAA=hcWRj_dhRPqRez97hHDVQ55tXbRV9VGs-okF-eKSg=6x=4g@mail.gmail.com>
 <CAA=hcWTx7Zpd-PNCp+oFp3+CXzOR=Py6H_0vonbBSUU4ArLU7Q@mail.gmail.com>
 <CAFLxGvxC3wHY2Jciv0OOJCdtObSq-1vqJyAMJ=X=_j3cJr49LA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Tue, 29 Oct 2019 17:00:24 +1100
Message-ID: <CAA=hcWSovagee+Kecuby5hhtRwhBThBQpn1wVBbwosuXfK1MHQ@mail.gmail.com>
Subject: Re: Where to define multiple volumes sizes in one MTD rootfs
 partition?
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_230030_580638_0F023D78 
X-CRM114-Status: GOOD (  16.17  )
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

Hi Richard,

On 10/16/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> On Mon, Oct 14, 2019 at 6:57 AM JH <jupiter.hce@gmail.com> wrote:
>>
>> Hi,
>>
>> Sorry, if it is not right the mailing list to ask helps for multiple
>> volumes in a single ubi0 instance, any advice please?
>
> I'm a little lost in your questions.
>
> If you have more than one volume on UBI, you get an /dev/ubiX_Y for each
> volume. Where X is the UBI number, usually 0 and Y the volume number.
> You can have an UBIFS on both volumes.

Sorry for not being clear about the question, I double checked the
document, it is better not to set kernel in MTD partition, but to UBI
volume partition, let me rephrase it.

Let's say I have following MTD partitions:

MFG_NAND_PARTITION
"mtdparts=gpmi-nand:4m(boot),2m(ubootenv),2m(dtb),-(ubi)"

So the volume partitions will be in mtd3 and ubi0.

/dev/ubi0_0 kernel
/dev/ubi0_1 rootfs
/dev/ubi0_2 data

It seems to me there are two ways to create UBI volumes, one is to
directly use MTD tools (correct me if it is wrong):

ubimkvol /dev/ubi0_0 -s 10MiB -N kernel_data
ubimkvol /dev/ubi0_1 -s 130MiB -N rootfs_data
ubimkvol /dev/ubi0_2 -s 10MiB -N storage_data

Another way as many document also suggested to use volume configure
file and ubinize to create and to read volume configure file, which I
don't know how to do it. Appreciate if anyone used kernel in UBI
volume partition and show the tips of how to use ubinize to create and
to read the volume configure file.

If the kernel is in one MTD partition and a single volume in rootfs of
another MTD partition, I can define following boot command to boot the
rootfs from the NAND.

bootargs "root=ubi0:rootfs_data rw ubi.mtd=5,2048 noinitrd
rootfstype=ubifs mem=256M rootwait=1"

For multiple UBIFS volume partitions in ubi0, especially when one ubi
volume is for kernel, how can I boot the kernel volume partition
first, then to rootfs volume partition? I am sure the following setup
boot args is wrong,could anyone correct it please?

bootargs "kernel=ubi0:kernel_data root=ubi0:rootfs_data rw
ubi.mtd=5,2048 noinitrd rootfstype=ubifs mem=256M rootwait=1"

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
