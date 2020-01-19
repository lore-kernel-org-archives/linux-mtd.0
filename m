Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D836BC33CAF
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 19:57:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB30620678
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 19:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e8ICnwr0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="civbAnkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB30620678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDKc6YXSZiSuaFcioZDHrqNOBByzx7hZm4JzGBfcFfU=; b=e8ICnwr0Cr5dsy
	XozKCW6JyAIot3LxeHQOHtn7Flo1XU/ISJobEhxEIFBflX7TaRJKSVqXNAQXwbZAfu1ItEzAYXlF3
	goDhirEuD0iBhe2R9I42qsObUcVG+a5m8FYEK9SBv+ARyVEe4ck3Hi5Bsaqfa7X67P+9WFCflSk2E
	VejlchX+6DTBaoDiQnx95PxhsVQ96UUdQZmadE0WGLXBw99Bpyo40ILbAqk/GlPChHPMZTy3yNaOU
	blsXfkhJBiP8zTN8xCLTecM2eAOpndZCUvWZOzyspyyyvfCHHeFJWLlyJzRQwX4Pmsh165WY/wd24
	iOViIb5mgNAijcG9kdew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itGgr-0003wx-Ei; Sun, 19 Jan 2020 19:56:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itGgp-0003wg-4i
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 19:56:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id p17so12653494wmb.0
 for <linux-mtd@lists.infradead.org>; Sun, 19 Jan 2020 11:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+bqI+HXZLDy3/2zlOr8wqNolH3lkOymLNufyRKitZ8E=;
 b=civbAnkTNBldqP9wmccocUPWAcEg58tjX0np4qCeuC2xhLDm5y89dqcQlJpPzjo0j3
 Yj8L9GHC1vkZQOnVexpSlHg7/b+yklYGWn0WSmOh819AIEDeWXVpVXUGawPpXcej6tS9
 WTw+SFWp2GBBdMrIDRYQZ0IYLySsMpFiubHs9t76c2ap1PnpqcvaCy5kaPuXT4JGwRh2
 ZisVtg+BiDoFSQ09qs/FaRtRCdNshOw6XHZOgtX1yTBKC5zn/dODezB4TZ76LuQRGAOx
 +prnNqSmYqP7X7qOaCtecpR3LyIy7nKGy58V/6owtRbMu2WYKZNtb7iiVkX3R5jFLEVN
 OwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bqI+HXZLDy3/2zlOr8wqNolH3lkOymLNufyRKitZ8E=;
 b=R7VljvvpF24fYrDo/A7W30VvqvEAsy9CfT6SgfpEPtgWxqlvRT2BHMYrvil+xn5rTf
 ae1bHHL+EZD7bqv5MWbtevC97kLU9OjbMB5Pj4Wrj6wI2qB//8HHYqlJxmhCn+N3np+2
 gCc8Tobza8Bcu3YEy2x5xWkD8akHrnBhclKwJagyONMe6JjHfmka4BXz/WogtuS96veF
 LUUgERUYhl4qEL3EYeuOYfgWuDDIwFHKAslueYaW22ZL2Sv0873fC7SZk10wV3BKRZzQ
 LBssMnFBAVPNsERICVqcmOW0vMQO0ov0aqkswDw4rJJ1UqggOR8Os+5slycf+/rnAsnM
 yS6w==
X-Gm-Message-State: APjAAAUwubehopQMOk3KljpYc+QihP5zoCpgY1jEMepIO8uwBfOjCpQq
 FVk3HaRpgdciHHKSFxneHM5LZWxfJZQeKU2XYo8=
X-Google-Smtp-Source: APXvYqxhRLsE9iQ7PiuoE9YMecEvRVyFkeib7qlPPoXHS5if87dXpmVsbuDyohiDQ3awnPjrmCIuttfCbF3a9WwcB8U=
X-Received: by 2002:a1c:6389:: with SMTP id
 x131mr15827684wmb.155.1579463813949; 
 Sun, 19 Jan 2020 11:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-3-s.hauer@pengutronix.de>
In-Reply-To: <20191106091537.32480-3-s.hauer@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 19 Jan 2020 20:56:42 +0100
Message-ID: <CAFLxGvwv=j0C5ZGUGDns5nfxsjFcHifkqJuu2E+HXupyNcq55Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] ubifs: move checks and preparation into setflags()
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_115655_440196_1638564F 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 6, 2019 at 10:17 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> setflags() can be reused for upcoming FS_IOC_FS[SG]ETXATTR ioctl support.
> In preparation for that move the checks and preparation into that
> function so we can reuse them as well.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  fs/ubifs/ioctl.c | 46 +++++++++++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 19 deletions(-)

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
