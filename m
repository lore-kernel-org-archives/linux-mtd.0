Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8712AC3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 14:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F85F207E0
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 14:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kD5kVfkW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=are-b.org header.i=@are-b.org header.b="S+RcDyci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F85F207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=are-b.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bVBoTt2I9kMrLxLj/Ny7gxC12dg+QOt9sEhaz6xgZ4w=; b=kD5kVfkWH0n7Ylnuz2dhDliYx
	5BZkMyGiebvVRFc/vy1S6e4jvOKQ7UzHUDzu1nOm9kH13TyJUVk0U/r4cwkwRzbi1FBeQ74F9TqE0
	giLyNA1lCCK2oheJ2gwnZziKE9X3SnHy4h4Fc9QKJKKPjpTCMMV3rQu1yDq4mbfemwNrQiU9LbhWT
	ntVA05aKSLW6F2HlhMrFV167ZBZd0Z2XoBgIyw7/LTJKbhmpHP4XKFhaWowAcJkSZLiQ5x8fLNT/F
	UuyRZ+k3M5NEsa9obGPwkAXcURngXPVyEDLKAYEc6m6Y/UkZPMo6tUOkwPro+GvVIBFuNgG5RSnUY
	jL5NkZGCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBKGc-0007Rk-32; Fri, 20 Sep 2019 14:52:14 +0000
Received: from 7of9.schinagl.nl ([62.251.20.244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBKGZ-0007QY-96
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 14:52:12 +0000
Received: from [10.87.3.229] (unknown [145.15.244.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by 7of9.schinagl.nl (Postfix) with ESMTPSA id 4DB3E12508B6
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2019 16:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=are-b.org; s=7of9;
 t=1568991123; bh=RxO/XFI9f0TpihejqrqXW4f8LEGMXi0kDiqL7M0CUrE=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=S+RcDyciVX8yhpCGLkrrURGCggAOxdQRs6ym3gavzyqszk79sAzSlL+2HDLYBAFy/
 dY1SKHmmdj3YQoXhN+wYcXNhk80naMvfL3ZqYQceNG9WsXnK7d5/8IHYUMltCJQlO5
 ID35gsh1JlTrrV8OXlxaVcpxkuNrmB20yGma4IEk=
Subject: Re: Missing all ubi commands in mtd-utils
To: linux-mtd@lists.infradead.org
References: <CAA=hcWRK-ChXxovKqSLpDF+JO7DtjginYXY33O-xtEAq25MiuQ@mail.gmail.com>
 <20190920111010.AF800240014@gemini.denx.de>
 <CAFLxGvwN1_BJ+3iB8fdKH9cJ_XEr_JvkToFAhxTzmK=FsixCbA@mail.gmail.com>
From: Oliver <oliver@are-b.org>
Message-ID: <4c95dadc-164d-ca0a-a1a8-1b4cac76ece9@are-b.org>
Date: Fri, 20 Sep 2019 16:51:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwN1_BJ+3iB8fdKH9cJ_XEr_JvkToFAhxTzmK=FsixCbA@mail.gmail.com>
Content-Language: nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_075211_556162_555D1F7D 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20-09-2019 16:33, Richard Weinberger wrote:
> On Fri, Sep 20, 2019 at 1:10 PM Wolfgang Denk <wd@denx.de> wrote:
>> Probably "ubifs" is not set in your DISTRO_FEATURES ?
> Yocto splits mtd-utils into many sub-packages, ubi stuff is in mtd-utils-ubifs.
>
alpine also splits them since a few months into smaller packages.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
