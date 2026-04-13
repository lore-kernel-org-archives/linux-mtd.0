Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0188F34C49
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwH8BTCjx+z+++HTR/4CCkhk5NZn7eJmiR8bOwbGMhU=; b=hrVxnyZPeZjVw9
	dwDHsP+AOQfvtwfB0uZkLkEZLpf4MA8YhERFJXRcJSIzjm2bWPg4KJro6dQv02YHrOrMoRGCgZVa8
	IPHjWaiEALc3vb/IL3TJjlsMwQPOjIW9YHaNxupIoSjLYHuzEccCHN+9eqzIAFvhcQSNPZ/E7jBst
	riYk0iBk21tAnLUqdo6R031rBdnq15J2NTx+T4AGViFJepiDAPfmrIsLSPJ0/+7r0FfqjBWBdJnv0
	jRy3ZYfadLQnhHh2KqEmry/ZbsAmIlj8AarO7w1CwNK2wdUGuY8lNBj7B/r2OW3aUMM2JGjjjd9pn
	gIv7G2b+j+hzv6vTj1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHHa-0000000FjW5-2no9;
	Mon, 13 Apr 2026 13:24:54 +0000
Received: from forward502d.mail.yandex.net ([178.154.239.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHHW-0000000FjVJ-2RP8
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 13:24:53 +0000
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id D2A68C0DBC;
	Mon, 13 Apr 2026 16:24:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id gOKVHa5S70U0-jnxRXkyF;
	Mon, 13 Apr 2026 16:24:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1776086683; bh=U5cdrwKeRRFnCtjOxyHDbAeQIXV9eBWRAaYQDsFm6kY=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=R1NuQ4w8kl3Qcx7Nyxu9ZSkSYS/TSn0kLYrg56sryuIDLQ/Lf8KmnH+rLeZ/dFKDH
	 JxEpyfTKWyDadbkaOK6BHfHgdlcw0lOiDL94Nb1P7HLlrHMsVyMYXF3ns8y3SAO/55
	 bcsr/vHken0TVrGhFkvL5+vn49TSXLdBC860rSSc=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <1272521ed33b17b51d32bd5ad9466b1439c092e9.camel@yandex.ru>
Subject: Re: [PATCH v4 2/2] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Richard Weinberger <richard@nod.at>, chengzhihao1
 <chengzhihao1@huawei.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Date: Mon, 13 Apr 2026 16:24:42 +0300
In-Reply-To: <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
References: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com>
	 <20260409045629.527019-1-dmantipov@yandex.ru>
	 <20260409045629.527019-2-dmantipov@yandex.ru>
	 <a8d991e7-7c66-2049-41e1-0a3f07114333@huawei.com>
	 <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_062451_195124_7298431E 
X-CRM114-Status: UNSURE (   4.85  )
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

# modprobe nandsim second_id_byte=0xdc third_id_byte=0x80 fourth_id_byte=0x1d
# modprobe ubi mtd=0
# ubimkvol /dev/ubi0 -N test -m
Set volume size to 517644288
Volume ID 0, size 4012 LEBs (517644288 bytes, 493.6 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "test", alignment 1
# mount -t ubifs ubi0:test /mnt/ubifs
# cp -a [~390M source tree] /mnt/ubifs
# diff -ur [tree] /mnt/ubifs/[tree]
# umount /mnt/ubifs
# sync
# mount /mnt/ubifs
# diff -ur [tree] /mnt/ubifs/[tree]

etc, etc. And yes, I'm aware of fsck.ubifs since 2.3.0 of mtd-utils.

Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
