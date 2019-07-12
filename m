Return-Path: <SRS0=Ms8K=VJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D6BC742D7
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2019 21:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0F420989
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2019 21:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjCYh1tu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7yvs9oi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0F420989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCdmcXzIFjLw+jSNk7GA/T8f81GTM9t81KJ2yl96gcU=; b=XjCYh1tukFciVQ
	sURxaGlu5wPuMdJAZrBnX52/fZEcpJ0H33HtTH8J73UMXqWnjhtTSqtr2h2LKwm5jwt7vyTHi2Af1
	5V9PzzgILS4BJe1YIq6QJ+Ip8nbRG7ioRKY2DRSggz6wb1sIVOk7p4cEcuChYHKdWCBzdunj0pR8P
	guNMjw+z7zrv75aKKl7lT2mecF7amn/t1X5ISfOBqlOcx/R8iaBVoVUP1emLsxAdVdgaTb+0vqkji
	R+UPYmnv2tSEqo2eT/4688JCDNUtAqNJDMpWmTcMZM1l9vMTMKC6bPn1+dc2NWVZB+2ltCaqP8zzt
	3KHpCzLzYZ41qWrdT/OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hm3V8-0002mT-Oc; Fri, 12 Jul 2019 21:54:46 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hm3V3-0002ly-OX
 for linux-mtd@lists.infradead.org; Fri, 12 Jul 2019 21:54:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id p17so11305792wrf.11
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2019 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ezp/81M7BENZPKnx1WnKUk8Kc7XjQxmW1Vz+hS9hBlE=;
 b=F7yvs9oixj5hjp+eiYH1qU6SjFYkhjw1IgWZ9aV9FAWKtP24t50TNH6Yw2OMljAvMe
 lvMW757gJjSPxz46QZmWKzUNzppvtSbOZLFFHHcbguFxJct/eFeaU4bS+tMFgdRNBl5y
 zJWM6qgOyiAayFFES4VqF9nRmO7lhAa8yhapem7E8R46LdOr/dwHj7TGeIMhonBMB3QR
 omWT3uJimoFtlANRpHj4TFgmLp9RQYQQR0NeOG38IXKsd+nv0pr98yMCmcAzOtDzxSr9
 XrTIMJxUWsHA8MaarZ0USitUPkbFYsRDGXykK2KO3KFBImSIatA+hwPIewHX3rGWmVYL
 HCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ezp/81M7BENZPKnx1WnKUk8Kc7XjQxmW1Vz+hS9hBlE=;
 b=TP/6EQ+tJ3SKCji/D+6HWE/ba7dwiK4qTwhW+bZAvDz/CbFYjHp786EWpkLTx3DEB+
 g+XRW2KZ/ISUEWVAezv85+QZq28a/itjaO5AMR3E94qH7IkTY3rHB+iWH+N2uicgNG8Z
 jB2ZQ9+cvhqAgeK4A6RPJNLXye9AQ3qn1RcqtiyhF7rNJL1x+XqQ4p1fM+C8rpOQvMyj
 yr6+03SaWXfXo5PcJfO/pnvuwHd+BBA+kUbuUoWvNHPG07DVMOoqRBwkeFkQm2WZbbrB
 iGnBpBB5680pnRrb384OEGhcwF8ddoOb24V5FH6I8exiIe+YIhwugCqZymEVvcDKFBKO
 jGPA==
X-Gm-Message-State: APjAAAX3+k8Y+EV72NtqLs/hqjbk5/zQYztepIcxGmXtHQiwVLdi6V1o
 aGckmCt9CVsrQiiJLhHjqBL7H4Tb9fPTyAcyPF0=
X-Google-Smtp-Source: APXvYqxQeEczSKIZ7O8yTeAs+UoffMtTZQCaI4aZsUiXrcx4Aq6lM4Lvjh+nPFm7F1X3KdvocvBcg3UAN80c3hr/Erk=
X-Received: by 2002:a5d:498a:: with SMTP id r10mr13585194wrq.28.1562968479204; 
 Fri, 12 Jul 2019 14:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <1561723581-70340-1-git-send-email-chengzhihao1@huawei.com>
In-Reply-To: <1561723581-70340-1-git-send-email-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 12 Jul 2019 23:54:27 +0200
Message-ID: <CAFLxGvwHO9nSLiMEpqtEr1Y-5TSjs_M4+_pbwUG6_Fojk+CUvA@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mtd: ubi: Add fastmap sysfs attribute
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190712_145441_826369_07133ACB 
X-CRM114-Status: GOOD (  16.72  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Gstir <david@sigma-star.at>, yi.zhang@huawei.com,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 28, 2019 at 2:01 PM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> The UBI device can be attached to a MTD device via fastmap by setting
> CONFIG_MTD_UBI_FASTMAP to 'y' (If there already exists a fastmap on the
> UBI device). To support some debugging scenarios, attaching process by
> fastmap can be confirmed in dmesg. If the UBI device is attached by
> fastmap, logs like following will appear in dmesg:
>
>   ubi0: attached by fastmap
>
> If multiple UBI devices are attached to multiple MTD devices at the same
> time, how to distinguish which UBI devices are successfully attached by
> fastmap? Extracting attaching information for each UBI device one by one
> from dmesg is a way. A better method is to record fastmap existence in
> sysfs, so it can be obtained by userspace tools.
>
> This patch exposes fastmap on sysfs. Suppose you attach an UBI device to a
> MTD device by fastmap: if fastmap equals to '1', that is, the fastmap
> generated before last detaching operation is confirmed valid. Else, there
> may be some problems with old fastmap. Besides, userspace tool can also
> check whether the fastmap updating triggered by other operations (such as
> resize volume) is successful by reading this sysfs attribute.
>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Sorry for the delay.

[...]

No locks in sysfs, please. :-)

> +               ret = sprintf(buf, "%d\n", ubi->fm ? 1 : 0);
> +               up_write(&ubi->fm_protect);
> +       } else

So, I like the idea to expose that information and I gave it
a second thought.

Basically you want to export two distinct infos.
1. Did we attach using fastmap?
2. Is *currently* a fastmap on the flash?

For 1, just expose ubi->fast_attach via sysfs.
To expose 2, you need to create a shadow variable of ubi->fm.
The problem is ubi->fm is internal and can be NULL while an
update happens.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
