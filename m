Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB3CC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 09:55:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF96323B31
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF96323B31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDi1edZQ1ugPVeyuN5UJHt/EYQXShyEW+eV0Bto5+o8=; b=rlgGLRKMUaZZalV3xypuuqr22
	TGNAm+9CGiptTXnckjJ5qV23n1F7lvUaMsY8nK/kaHwePMNFBALNuSkjod3UVEdiiQjCtGbYAC70D
	MnMXqNeLhTtYEjvQf3ju5EbEj+M82IE/oxJN67rrhhoT1cqzYA0tW+3ZV1uN2DdqYd7g+VHNOrAKB
	1oX7usL3++vVt7c7FI3NgBXfDgx8JsqoZdWOHbNVCeCxksOA1LG5r5Kh3DdIzzee9gmiqMo/CQC7b
	AbIJetTsfIPDPbRn++fAsbaD5C4+twmYD3pGjWFxEOaq2U3qhOLX+P+hMuHu61ndeLY0PK6lbF/l0
	LMHUVzKNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knIeg-00028N-0Q; Thu, 10 Dec 2020 09:54:34 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knIed-00027v-N4
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 09:54:32 +0000
Received: by mail-lf1-x143.google.com with SMTP id o17so4406712lfg.4
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2020 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmdytSZMbGdwxrr87YAKpuLCyZnh5hvnPMoAXgsWIWM=;
 b=WqLMqdtLJvHfeF/7Rc7uyh2pF4DtimWlA4c/YyQyT+Y3QQ3WvQFQKHGg2aqnNVT4Ey
 FSEOUVPQPnLHiUf+vip5ImFjnO755enhTtA1dBetfA08n6Yfy5r4X8x7vfZXAksN9UFY
 V9chGglyvXMy73GKqF+RMT/uVR23Mwg46+9Kyn6Uug7IrzfhAkKS4Y3gU9kD7FFoV08I
 iAnQBwCgzgZK1VKvPNQ/X3QTxhBSKNG44IAOgaRgr1MSplAVSsvcMAwjLUrhN4hKhKBb
 swPdUVouer+D5h0pfoRVX9YnZEZtSI9h9TM5hFYxVd8hRlQBgJwQqwVJrsoomIdQyeuw
 eXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmdytSZMbGdwxrr87YAKpuLCyZnh5hvnPMoAXgsWIWM=;
 b=GWTC14LG+rEjm0DpRF9JKlf3JzVb7lFvAl9Xf9tn+g8PfE3e/3WusTBevfet09WJuS
 ZCEMRexuKiBGdL+BJRZyDUq1Bi78Ug1FvsE7TALm8dsveKlSqETWackv0Pf0BWvZb2Oc
 TGSTIh1t9FkurM4N7mMmzVjtvj03OzcgKgP58oGI2q5XfB8zsTsmv5EAxX5AEp9GIDZ4
 +jC+RCM9XuNygUNUP6YMyANVsCky7zXbvZtCy1UJMXEGlO1/iYMY3rVIuAJS1mSUMxT5
 zIuHHCQwrZSD8NhIDTJKSpAdjscJUyZCEMVnSQrAF8dYhHMUFrkFfyHsVKkWQ7oQi+VX
 Exsg==
X-Gm-Message-State: AOAM531XIS/5W4j7wSEVuxRDLSgnmxuOodQwGb6iDk/Ux0k/4hh7PPbn
 IZiIiez7SNO6LdG+Y5gyqh9AmpqI0UN1TkYNOok=
X-Google-Smtp-Source: ABdhPJz10M23UAVlSyv2rf6zh9oiNdMf4L02d4yVL0WnucHgyj8jmB/VAXPXLkXUDs5qx8EYPeOiPZGKyvKKHgwd7J4=
X-Received: by 2002:a19:2d48:: with SMTP id t8mr2651720lft.295.1607594068847; 
 Thu, 10 Dec 2020 01:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20201209035104.22679-1-han.xu@nxp.com>
 <20201209035104.22679-2-han.xu@nxp.com>
In-Reply-To: <20201209035104.22679-2-han.xu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Dec 2020 06:54:17 -0300
Message-ID: <CAOMZO5Ahyd4qe9MyR6T_vfjG8A4z-k+4VEYQx7i4FwoRX8+wPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: gpmi: Fix the driver only sense CS0
 R/B issue
To: Han Xu <han.xu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_045431_785549_A3D033B6 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 9, 2020 at 12:52 AM Han Xu <han.xu@nxp.com> wrote:
>
> set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B signal
> from all CS.

s/dirver/driver.

Reviewed-by: Fabio Estevam <festevam@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
