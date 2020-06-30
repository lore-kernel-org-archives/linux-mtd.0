Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EA8C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 13:37:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1445F206B6
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 13:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hCxqV6HY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhdzBlZ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1445F206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aMBpo1sOmUEyBEWEb7dOQdvP9XF7zpDNoithLwaRPZU=; b=hCxqV6HY9x1SfSwcCTyKsIDFA
	hKU64fY5Ehg3xTKqnAcHURS9FNZj3aPpHDwFk4odqLFa+cjwEvmoOUdkwWDxCv21IfNfQvtBnEcme
	jihy885k7m8j6TN8Alzk/v1sIGmVbEk+VPOCVIKMcQ2RFsNi3MelEKQkKeiKXK7oEWTQ9abnmNESg
	GS5bYr6kgkBNpG661VG/Uc27K8OZ05Qexgl3xGbAfUz9VY2D1eWXqJrlnJuvnObXoHMVhyCbqo//l
	N5WijLz4/LIEvhSbPEYvKF4Fp+bvkCy44vqCt2N895O56SSdPsD8n5oNUjClB7G0/JDFvXDXHPmZT
	r0Kz7CSCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGRK-0005i3-Uw; Tue, 30 Jun 2020 13:36:47 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGRI-0005gx-3r
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 13:36:44 +0000
Received: by mail-qt1-x842.google.com with SMTP id d27so15544892qtg.4
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2020 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WZwfFBcdn/AW+RHOga1zKdQuhiHcIA0nGBKV12t1omk=;
 b=dhdzBlZ0rMA1W0nSB1uyqRjsRjIO0QMY3vX3ZbYTxCm7cXyn/yeCNeL9kY1YQfxLKl
 hetsyKIAcC1PfkpRuegtvfJo1etwMSHCgd7m+760PITOyI+9o++PV6IQvJawWayJHBNN
 38nqKsrbU7vqN5+Y/vwZFjwUttqrnWK+vPNjNUazqT6Jn49uYFa8CK2Ro2G2ThOPMSgc
 xDJ+j4cgWhaDt2RhaeTHZ76Ypf8ebyXJUr5hQh9/azIlW2qu07O+Sreu43uqegtZm8Xb
 NnHcbsCi1277suZZkDTQGJpMQOC+HNGgqXW9BbOgGVnNQ06aGqTYBEQKgAcYpQY3BQZx
 sBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZwfFBcdn/AW+RHOga1zKdQuhiHcIA0nGBKV12t1omk=;
 b=LB3rUqfNMH5/0NmSUrLxw5/k7UDMhjYiTnixQmhP4JHW5AApHKEmIz3aJ5mpKwLEYa
 nqHzw1K7yf3y7kDAw1x40K4qLT87U+b/qtmzHBS/jGCpns4Ei2xTKQbVSFSpZu7uuAgP
 m5O+APdXQZF7R+xwYnSi5OZN0jD5nZyZnrPjengw1ugEO+LX7ozeBWwYaAns+aqnmZHi
 yafsH2c4GSw0Ct7DMszYhghQo8AA3p9sXNfFlCQOpCfdKSjgfoq6ExHSpJZkTTIgPItO
 UgQ6MlgnpMJbyCiw1Qb0Jb/cDXigMhFcOFXcifU+Uc5s8mEY5gVnMs+gEF/42rwnTyqg
 dlxQ==
X-Gm-Message-State: AOAM5301bMUlkjRyk4gKK+2kc0l1WTz9W+9KuKE9IqJBzL+DIwXBPR/E
 Gd1dtyC8IjkWZkagvT+0m9NwVS0HAbEyShwrIAk=
X-Google-Smtp-Source: ABdhPJyWXgwnJwg5WCpMEiqDJbS4ghgygkUrBK3EUp+OOVA9huQcPhrw6TWDnxPeiEnMgvcYEnKvY5MM1v0LBJTvsec=
X-Received: by 2002:ac8:1305:: with SMTP id e5mr21003584qtj.78.1593524200204; 
 Tue, 30 Jun 2020 06:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
 <2117676.Cu8v49ySxQ@ada>
 <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
In-Reply-To: <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 30 Jun 2020 15:36:28 +0200
Message-ID: <CAFLxGvyqPB45hJ+_kejzs1-1m8XZ8QW-WyXyH+Jnvj9USZ+cEQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
To: Richard Weinberger <richard@nod.at>
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
Cc: Alexander Dahl <ada@thorsis.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Alex,

On Mon, Jun 29, 2020 at 9:11 AM Richard Weinberger <richard@nod.at> wrote:

> U-Boot choose the UBIFS way AFAICT.
>
> But if you have your own minimal loader you can read from an UBI static volume with
> a few lines of C (~200 LoC). This is what I see/use most of the time.
> Using static volumes in U-Boot is also possible, IIRC just use "ubi read".
>
> From http://www.linux-mtd.infradead.org/doc/ubi.html#L_overview:
> """
> There are 2 types of UBI volumes: dynamic volumes and static volumes. Static volumes are read-only and their contents are protected by CRC-32 checksums, while dynamic volumes are read-write and the upper layers (e.g., a file-system) are responsible for ensuring data integrity.
>
> Static volumes are typically used for the kernel, initramfs, and dtb. Larger static volumes may incur a significant penalty when opening, as the CRC-32 needs to be calculated at this time. If you are looking to use static volumes for anything besides the kernel, initramfs, or dtb you are likely doing something wrong and would be better off using a dynamic volume instead.
> """

Did this and Wolfgang's input help?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
