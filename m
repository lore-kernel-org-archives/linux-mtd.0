Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ED2C4363D
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 10:43:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DA523772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 10:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dCplDXyD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIKKM9UQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25DA523772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fil4ESNQ74vGI7hGgWNiqAuxvxEHZTvJMuDq0pN3oQM=; b=dCplDXyDMXmTEX6vw1WCyZjH5
	Y5tLVq0EhQkSEl2rGMQfuX3eqpKG2Rbf1mCuRfbc/wkMKVYyMwlZXC2K+fTI6bnUGStifR1LTBnC0
	H4/gI/8t3ZHiQwlBcc9LduF9laALkxm2hdy9WnG+Plaje3CyI8RtoZDPuo7NCiOs6jep9sSJRRvmU
	61QHYZUpKd6M9L/GuD1Y+3xijf1eTtxzGH/IN+gPJ1bpBPdLPgQ3tP//KsaEKNxluD6RuRkV4oBvV
	xvcT4djE28WxXLDsasT5E7qdXtFjzwn7V+TpY/p4kysQ21xyrlEK/S+EWMVeHFVP7xDpCUX7jLHwM
	e96w/tE3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLOiM-0006sH-7J; Thu, 24 Sep 2020 10:43:02 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLOiJ-0006rx-Q6
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 10:43:00 +0000
Received: by mail-qt1-x844.google.com with SMTP id b2so2510464qtp.8
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2020 03:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0r+whtU8ucyf4JAvEE5qyBvfUPcNYmssx6XxXhm5czw=;
 b=bIKKM9UQGSrIlW1SI4WP5W/AlRZbtHOf3jogFrgqK/NE8Oqe1FDM97lfXvRXwz8E9i
 ggZkIIxxHtdhSMOeepphV8eHeKT48h0qmP4MD6OcwJHfgDMxcVJgukwncsgo3ENS4Zqc
 r1jdZBT8dFug9xHAsmisqzNQnXqKBaL1JgljvkElR9qUvn2CWC3yWAhe9QU2IuMIfqXL
 NOrYIf7xuP60R5dF+izTutAbvhcHrwewkZmdJVoeiadDORLja0WZI1iH32LDEawZNi5c
 M7zRsusWH6g6R9Asez5tObPYRN5iFzLA/RwfxACciTUgGwT5q/yO7WcWd25gai/yb5Ug
 oZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0r+whtU8ucyf4JAvEE5qyBvfUPcNYmssx6XxXhm5czw=;
 b=avFaoXAB4rAUsfEQVu7JDZnhooxB93zWMcH1zSk34EeM+zD6CKuJgDxX6P5ZdPWY8G
 QNIgF0NmtYSVasPDV3jF50gD7IUTJf2CCe/Pzt9KLEDPPqJAU6HivnUIYtU5MQcuazrD
 YD5o7IB+Tz7SvGWdTyx2S+EH0pmkmlq1Pb89MPf8uB941/y+OAjAofljGdPDMx9phF93
 /qs+6lKa/Ldi85TktS67SAeY58kBnvDNDjPEc8b9frHKu9MuPX4XNnuigX7R+r9dmMoT
 i1lhWD++T7OEZhSefXXOHIroTMRM5Erxkn4TjNrI9r1/6nC8kVIjS3Tn4Z/rFBRuk2hm
 NEoA==
X-Gm-Message-State: AOAM531//TWf5j+wD7h7oOvkx2ZYkSX16D/39i1fUKQ++iF3ad06akz9
 yOESqDpPl8sgM/ZG5ZLZovlfHAV3/hW9zwPs5Ij73LHK
X-Google-Smtp-Source: ABdhPJwMDPyO8h0UMbdhrz7MGwC8CADhfBTSIxgoQ0bs6IT3lI5mYvGoPtyWkBm6nVKmscgjcLMXA4MVTzX8H03S/6s=
X-Received: by 2002:ac8:8eb:: with SMTP id y40mr4704223qth.1.1600944177964;
 Thu, 24 Sep 2020 03:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113518.7c6dda33@sergmir>
In-Reply-To: <20200924113518.7c6dda33@sergmir>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 24 Sep 2020 12:42:46 +0200
Message-ID: <CAFLxGvyp9C6BuM3V3DDxCrs3LCuWc0dJgACZShB5qU01SHwh2Q@mail.gmail.com>
Subject: Re: Help with UBI failure analysis
To: Sergei Poselenov <sposelenov@emcraft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_064300_019743_A6120274 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 24, 2020 at 10:41 AM Sergei Poselenov
<sposelenov@emcraft.com> wrote:
> Freeing unused kernel memory: 280K (80898000 - 808de000)
> UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (0 but expected 9)
> UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB 12:100352, LEB mapping status 1
> Not a node, first 24 bytes:
> 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 02 00 00 08 00 00 00 10 00                          UBI#....................

So, UBIFS reads from a node and finds a UBI EC header, this must not happen.
UBI headers are invisible to UBIFS. If UBIFS reads from a LEB and a
given offset, the offset is translated
to read data after the page(s) where EC/VID headers reside.

*unless* LEB 12 offset 100352 contains an UBIFS data node for a
nanddump you did before
and the index tree is corrupted. But I don't think so.

Looks more like a problem on the mtd side.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
