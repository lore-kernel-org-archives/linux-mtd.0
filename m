Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4313EBFD12
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G1OVG7Xq82Mpe0PkE2z+heycEc2l99usElGz6wDnPmA=; b=GmaCrBTfh6oH5x6bWfbuw7Zxzn
	bUYGRH1OD8QS8Uinnalt02Ylr2tAfP9WKD0WS32QSFHsRaW+E9Rn8X0KP90jjWAqMCnp/rFx3E/Pf
	9jSj/qjR7dhRtnpmjmPo7QUFcSBnCowZ2SnjYsBx0LCyzrJ05E37i+KwLkcLTlRJc0r+eEqdnuXej
	Dh3xNISsvi1+3kbo1EktVR8J6283P24h0X8LqUvq9JY2t37Riir6QirFCRQjL+0otsuh7TmAvrV3b
	SzIKyFw57P278xRjyEluMYiCQjqjQZeP19b/cJTiU4KGnkEjwf50Ig76YJrLKNMtD4NiESlL+H7Xk
	pQqei76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBww-0000000FAbG-07RE;
	Mon, 13 Apr 2026 07:43:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBwu-0000000FAat-3cTq
	for linux-mtd@bombadil.infradead.org;
	Mon, 13 Apr 2026 07:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LNnItVaYd6S0rWE1LpiXG6tl4JJQ1PYdtKzZuJYRToc=; b=QXtqgkWNxzrqlsB17NFMaDQ6kU
	1FvwLWc3nEORMn5XLIakyHeaC92PY2TLWm2dH2CVMNxvMmReOwwsJzjlKBp/0/q3ErHuKcqpA8H71
	4ozkHUPtdk9EJ3ioq17zZuWV/QD5ySYqOSZhQrup8arRhE5m1auCmiU2lAEfJ0pJejDCVza/HdGGj
	ZUJ7J5X1poB1VaWE6/QbbNC6+RDU+RGDcLcIpUyigrovx5+dIuHJKbVMpyA5FZw5R8gXs1v+jeSaX
	wehU3ykM8tXVZ1Eni++3AXnOr91EQW3eqRF7JpaCLUN1Ndmkxcx5LDAtOsfsiOXD8x8s4whO+Nl20
	QTFG7Nug==;
Received: from forward500b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d500])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBwq-0000000GIfr-1TIe
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 07:43:11 +0000
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1e:489c:0:640:8d6b:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id 39B1DC02F0;
	Mon, 13 Apr 2026 10:43:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vgEJLL0Q6eA0-OAJiqaSp;
	Mon, 13 Apr 2026 10:42:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776066179; bh=LNnItVaYd6S0rWE1LpiXG6tl4JJQ1PYdtKzZuJYRToc=;
	h=References:Date:Cc:In-Reply-To:To:From:Subject:Message-ID;
	b=hHuwSYNCAUJAizvEou+qeU0fTEtnxJEZeiLnWTTTlgUubuaY0OvEYKVJfdksVSXn5
	 R3Uu/T4z+dw6984o5PdiDtXwZqVY4ud84BGThvZ9lRXDVpAaW21bATUqY28uG0pGVW
	 Nf/g5fm7n9er0B95S3agRYqctyid4Z3INvOooaQE=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <2cf9ec17854da2ff4bc7c53d3dc12558b9089bf7.camel@yandex.ru>
Subject: Re: [PATCH v4 2/2] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Richard Weinberger <richard@nod.at>, chengzhihao1
 <chengzhihao1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
References: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
	 <20260409045629.527019-1-dmantipov@yandex.ru>
	 <20260409045629.527019-2-dmantipov@yandex.ru>
	 <a8d991e7-7c66-2049-41e1-0a3f07114333@huawei.com>
	 <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Date: Fri, 10 Apr 2026 15:00:59 +0300
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_084310_076436_FF5D5FBF 
X-CRM114-Status: UNSURE (   4.53  )
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

On Fri, 2026-04-10 at 07:57 +0200, Richard Weinberger wrote:

> Dmitry, how are you testing these changes?

Build with:

CONFIG_KASAN=y

CONFIG_MTD_NAND_NANDSIM=m

CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_UBIFS_FS=m
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
CONFIG_UBIFS_FS_LZO=y
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_FS_ZSTD=y
CONFIG_UBIFS_ATIME_SUPPORT=y
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_SECURITY=y
CONFIG_UBIFS_FS_AUTHENTICATION=y

and boot (QEMU VM). Then use nandsim to create ~512M ubifs volume:

# modprobe nandsim second_id_byte=0xdc third_id_byte=0x80 fourth_id_byte=0x1d
# modprobe ubi mtd=0
# ubimkvol /dev/ubi0 -N test -m
Set volume size to 517644288
Volume ID 0, size 4012 LEBs (517644288 bytes, 493.6 MiB), LEB size 129024 bytes (126.0 KiB), dynamic, name "test", alignment 1
# mount -t ubifs ubi0:test /mnt/ubifs

And do basic consistency check with something like:

# cp -a [~390M source tree] /mnt/ubifs
# diff -ur [tree] /mnt/ubifs/[copy of that tree] ; no output hopefully means OK
# umount /mnt/ubifs
# mount -t ubifs ubi0:test /mnt/ubifs
# diff -ur [tree] /mnt/ubifs/[copy of that tree] ; likewise

etc.

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
