Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92895C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 23:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60AEE2089F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 23:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fr5F4aZo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+WemA1p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60AEE2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJMdnoHahZ47prj50IuNAkryxS7gzkK2TZRRlWrFsr4=; b=fr5F4aZo+DqzEj
	HemAAzXxxD4RA/TOfWGwECgG8aS1Q5ueqFynvLw1yoFztCjiTK2cxUHvQXb4UwD8/sdHBc412J2xR
	9tradJj9Q0WPwavyYAgkYCqfmOPBQU5vM9NCvaF44Nc5e73QXuJF9FrKBEuVcWp3wSu3uOVUqtkgO
	cm7T5rpoWYFMr7qNqrHEcIhzWUHgcH2Rp9GiIN1pg6PO3Hh0t42h4lYrzTMPNoQMN7b/HkeACaOOg
	OsodhVHsrlm065KpCgMUvyUP7qjwW9f8ZAmIdo3oMFAr4Zkpp+NNenPPg0A+0RIldvEELt8WFC8Te
	4pwjvSZ/kEUngz4NHnCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwbfb-0002AR-Ue; Wed, 20 Feb 2019 23:52:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwbfY-0002A0-S7
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 23:52:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id o17so28002596wrw.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2019 15:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXn1MSg7nGUrGBUXSV79vPQ0bHNvPC/jWxEr1whYJIs=;
 b=O+WemA1p/1S4wt+Bl/K+tRjwAaenEexY0TidU+ZySmuVEuWJ7Ug/g6CTWhZvcD/UHf
 1dRQmnPQu8M+Uaymmi6dRQdsr8/Dm9qr7Uky31tP7dm2xMDrYPHkxTam/WksamB/SH5M
 HpLBRWozs8cq1wKmRFwdIamzN9bucI7lxc0Y3HHrfrG2jjZbBBl6cfzO1Hwd6Ymu7P6B
 kEms4BiioT0GJHc+2z0ZhHxcw1mryWujl6MkUhvg5wJFZaPY+O256jxsse1Qqtuyq4Lg
 yBZWzCJuSS26NM18me+nv1Fzw88tjdJYHpGJq+Oellj92UDoxdaffvAHCvbAbDQnDrfM
 FC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXn1MSg7nGUrGBUXSV79vPQ0bHNvPC/jWxEr1whYJIs=;
 b=b8BsKt/iqAJVicsmly+vaTDmaNE5Hps8/ZUv8OUJv0igU6APabPnYJH3HkJD/IumHh
 PiG8qvGVTn0yVO/O6LTyyT3zXCb624sh2UVLZ0OtAGl6gtbSo1zaWO4S14PFeatbbBvO
 Mp0HDh8N4OjL7uaFeyrESq6Q36w1Eck5ztxB6kNOI9EDNBocm731OscVLQ0ds6O7tmm0
 IROKtnQBgp1ttiaQQldqgi4yZinSKNDZe0vg0liwWVyAINPnzqtOn/bVEfHJVn5EfKhW
 FOGcElWa4QTjC5/fc0jejQUEYq4j/EP9GdTEMt+E4g7KK8bRsXZM9rByPW4xnnDjaTlF
 jqxw==
X-Gm-Message-State: AHQUAuYvza7lWHI0oEAeS7iPPPDTeUUdTCWiLRYSUi1tf7Zaj2Kp9CR6
 MHlQxFMWSZ7hqjLgcs1UyFSsFYAZKWVzXK1VA58=
X-Google-Smtp-Source: AHgI3IbReHJ6iG0+/2cT3ZekujlLxbX9fjFlHwEFbbEk9mOhZMCLku8d86VZGQ19dSNqN+r4b6rFJmhSn03z+qZn6GI=
X-Received: by 2002:adf:b646:: with SMTP id i6mr27184136wre.262.1550706770166; 
 Wed, 20 Feb 2019 15:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <20190220065249.32099-8-ebiggers@kernel.org>
In-Reply-To: <20190220065249.32099-8-ebiggers@kernel.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 21 Feb 2019 00:52:38 +0100
Message-ID: <CAFLxGvy7WsV7Qo42yTbsZf9YnW563a0k6Yx2-NmASNtoektu_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 07/18] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_155252_939995_66DCA676 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-ext4@vger.kernel.org, "open list:ABI/API" <linux-api@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 20, 2019 at 7:55 AM Eric Biggers <ebiggers@kernel.org> wrote:
> +#define FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE    \
> +       (CONST_STRLEN("fscrypt-") + FIELD_SIZEOF(struct super_block, s_id))
> +
> +#define FSCRYPT_MK_DESCRIPTION_SIZE    (2 * FSCRYPT_KEY_DESCRIPTOR_SIZE + 1)
> +
> +static void format_fs_keyring_description(
> +                       char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
> +                       const struct super_block *sb)
> +{
> +       sprintf(description, "fscrypt-%s", sb->s_id);
> +}

I fear ->s_id is not the right thing.
For filesystems such as ext4 ->s_id is the name of the backing block device,
so it is per filesysem instance unique.
But this is not guaranteed. For UBIFS ->s_id is just "ubifs", always.
So the names will clash.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
