Return-Path: <SRS0=VCdk=4S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D541BC3F2D1
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2020 20:46:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5888246C2
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Mar 2020 20:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bdLvEXZ8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inPbh0kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5888246C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLowOQiW/83bgvYMIWpOuMvdHUAuX/Q05FMB3QoZPj0=; b=bdLvEXZ83gOlJB
	sOsKSR5IrRWPRK+QnAnSHpndRM+VfqYHSTeJ3yg4RXlCOkDkcQU5OGRg8O7qxXdMLL2/C9gX+vTVo
	rfYqhfmCCRtaIGgt/qKS3MSQTqtanWPUPuEcFNazsILc5ymt9iQlbd4BD4yNoH4kBDswFIgvahUS8
	O1SKfTXPu9LcINOZP0X4X/Z32nxPSiq1IxxX2l3IuLcNSatb69Rbem2fsp0gDWjZBTq3YXgk/k0th
	TkpjLhFYSTdmwyuaPmQ6VjZOLUyn5cHMwBDglxnCxt+c4uQaWLc1bKOdxx6NWG2tekLgJd03b3Zhs
	061QpGnqiWY7VuGjXO8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8VTz-0004lB-P6; Sun, 01 Mar 2020 20:46:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8VTu-0004kg-Ic
 for linux-mtd@lists.infradead.org; Sun, 01 Mar 2020 20:46:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id x7so9986187wrr.0
 for <linux-mtd@lists.infradead.org>; Sun, 01 Mar 2020 12:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R8Cp9xrpFC9LnRTFPg+iYo0rybRv3U6fl7Gsce1rPn4=;
 b=inPbh0kCxpta0P7iizPVlvgiRVuYW173A2/muoyK/hgn8gnPgDqxQ4jJf4Acim+kpH
 ZkWEH4pz8U285bztZ4H6Gwjm/dXaboc4GFUiHeZZavhdaM7sLlfv6sfj7AUAiXoV3nkt
 KH2Dc5LcfWgzT/VhSFPnxw74lYROuDf8QAxbE5HWXpLjVMIuXe+LgWCNWHYNaqRd5VfH
 hYQPveufyu+snTY0gWvAXP1nNX/Ge+3u0yLChtQQvjiTnVYvMrOPu4vJ1oa5y6D8jjFV
 3Ba8i02LDtkqyF7dC06gIgdkSMIdJPoThGv6kqit6GSSQZGJJ7mwxNYU8AJfY47Dh1oH
 A05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R8Cp9xrpFC9LnRTFPg+iYo0rybRv3U6fl7Gsce1rPn4=;
 b=OUZWZatYe+9r16FFZfABYXp6t12o7AjLvf6SV+paHjDOqU8Envs9Qns5LVIjUVS93B
 sxD37VUvF9syQlzzoQhlRmLQlrHQjddJpyi/aBRDkWZOCBTTzTNKd2mRLGon6Jqs/anh
 OeY6VNDH+S+r6SVOMBzx0Bzrr8bNvkSZbGkxEhrYD+v0WoXBGF/+3/f0a1hnZqSVF6kN
 kMsiSWEBfaVV8lmeRzLfO6A9XUjrd4YnGNrsDuoZqj2W894sNBgT3/nEf2ifELGLFUJ4
 SWNA5bBEHveC+H1UM+/NC6Wz5GLzcRugreZFJmHkOQANFXFeETFnpREOsaBmobifw232
 JVwA==
X-Gm-Message-State: APjAAAXrJMheymu9LnUFeq/087NYwA5GAtMat1NrIGhaM9/gNtXJC0ot
 c+s4bpNxqwKS83Z5uua13gHgUW5oC/i0mVhQ0fg=
X-Google-Smtp-Source: APXvYqyws8Bwqoi8nGAxIprcQ5NwNup7jSWTqHrVs2J4Gnxg7/74CCPZd9CuXAfRsqDTlS4A5z/6wcm5OKbeAzjBveg=
X-Received: by 2002:adf:df8f:: with SMTP id z15mr17541906wrl.184.1583095592473; 
 Sun, 01 Mar 2020 12:46:32 -0800 (PST)
MIME-Version: 1.0
References: <1582293853-136727-1-git-send-email-chengzhihao1@huawei.com>
In-Reply-To: <1582293853-136727-1-git-send-email-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 1 Mar 2020 21:46:21 +0100
Message-ID: <CAFLxGvyJdWcXQt3H2aknTuGhCJpV5YvAbW_wuHfs3m+KcNSjtw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Don't discard nodes in recovery when ecc err
 detected
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_124634_614487_4A635824 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Zhihao Cheng,

On Fri, Feb 21, 2020 at 2:57 PM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> The following process will lead TNC to find no corresponding inode node
> (Reproduce method see Link):

Please help me to understand what exactly is going on.

>   1. Garbage collection.
>      1) move valid inode nodes from leb A to leb B
>         (The leb number of B has been written as GC type bud node in log)
>      2) unmap leb A, and corresponding peb is erased
>         (GCed inode nodes exist only on leb B)

At this point all valid nodes are written to LEB B, right?

>   2. Poweroff. A node near the end of the LEB is corrupted before power
>      on, which is uncorrectable error of ECC.

If writing nodes to B has finished, these pages should be stable.
How can a power-cut affect the pages where these valid nodes sit?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
