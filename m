Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C2DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 00:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3576120880
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 00:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2PRUL5H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5RFyThl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3576120880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTfeW4fJMJyF766dWkRLRZm5EE+S7z+PTTp5JEEBnyY=; b=c2PRUL5HKIfl4j
	HIBiA7SJeVyfQPiYYYd2OuD6Hn61aws7Q/82d50owZ8NCSeo6wC7f49kyuuAGAcYW+nbWIXrpCo38
	4/LunErfpA4xUsvi7Y0i7z/S2nTjsN7ShbbKdnHlpOBtl/eZWgN3SSrC6x5NrOnXckYt3ZNg6yQI+
	JdTq987wTB517PA8TfwP0+InoEa+SxmEU4WX7uqGqXUPG0dAwTk5I3/B7F9o6bcWPo9xjKdtyj/72
	YjUfp5Udjx+HtDTXGVz/i6rMYag9SqUw5h8nvWEduJxsh/gTwFUyGXeNvLq0JEMbm5IPQCM3LWPJ/
	dlfhOeBNigP+YLk6P5Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwbrh-0000rF-7R; Thu, 21 Feb 2019 00:05:25 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwbrb-0000qa-HW
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 00:05:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id r5so14643183wrg.9
 for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2019 16:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xeZjUHz/lL/WElTAEWkA6w8FttdZ49cdX8uQNFSz6uI=;
 b=E5RFyThle7gZorAwzRaJeGVv3b5tzOHmMQMLHTaDWN3RoEZOwwQjTRFVgCaBLiM4Ug
 SSa7GqpSKRufqSIPoDF6mv2NhuY6D8EEc0NQ7w8ghlITT4+kmuT/LHBUrVvjJ2ER5QSM
 Y0gI0TZZd/KL7TC+449CJtkZjxbMc9/xNPTpPnqiIqZ0zPtRiC5ixGzbCYVVw8DCam+/
 /fqPB6gLxcQUcukSv02bAFtcNMVSck2V8/O5eUlx0AHm0ML7VfH69hbj3t8/oMnuOYAs
 DPRjF7nlTYTc3vZDfjMSpT+eoXSfbNPWbxaY3ZzOxW17RkLnsZ3cVgQ0OtYy4f/jM8Dy
 RfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeZjUHz/lL/WElTAEWkA6w8FttdZ49cdX8uQNFSz6uI=;
 b=dzpzYzClLMKFhrnM6dfk9OGzooPQtMrATArEYcKmstUI1y/MFUA7aFoyxftT4PAjnU
 KZIgvc/OEt0Ccn5YsbWk3kNgYf2HyQZx7aYKGLKMgIFoGp/wIXXJeeJYGGJ3SyAhrB9x
 LhO2b4p6gznk0CnJI3TLAuqrSDDEfJd6Ka2Z8nsRvEGjwHwViFeBj+O5mtcydtJkQfwd
 saeXhqglH6TKUkaLLCXvIXx5H+9Hmiz4dP5oCXYUCdtp/rCkEJCYZGyZTsUCdwDCWs/j
 Ei1pE972D4YBnH0nharVduwoH1Kp2qVFRY/fRHNeXOzzv6ZInLuclCOSF2xZRhptzxin
 vDfg==
X-Gm-Message-State: AHQUAuZxS+q5UmG1treLDJFhMVU3/gftLjT94iv6LDcnbH2MeKlqjALq
 kWA+I/MgUlK/m4udqFV2SRux4gFUU55TcSrcF60=
X-Google-Smtp-Source: AHgI3IZzz2xA3h6KGid6VVUZyLbrcYBgVRAWNTQ5Rs5N8LunaVL+Wfqn8Trwywu2hJXVvC0zjStacW9zerjnr/8i9yA=
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr27735016wrx.203.1550707516291; 
 Wed, 20 Feb 2019 16:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
In-Reply-To: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 21 Feb 2019 01:05:04 +0100
Message-ID: <CAFLxGvxJ=sRRKMVJHCh6S--NtEjJ7eUXD=VK3a5DXkWqi4Y1fQ@mail.gmail.com>
Subject: Re: Prevent Nand page writes on Power failure
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_160519_606883_FDEEBF1B 
X-CRM114-Status: GOOD (  18.14  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 20, 2019 at 2:58 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
>
> Hi All,
>
> I have hardware here for which the normal way to turn off is just to cut
> the power. When the powercut happens during a NAND page write then we
> get more or less completely written pages during next boot. Very rarely
> it seems to happen that such a half written page with only very few
> flipped bits is erroneously detected as empty and written again which
> then results in ECC errors when reading the data.
>
> The Nand in question is a Micron MT29F4G08ABADAH4 and in TN2917 Micron
> clearly states:
>
> | Power loss during NAND array operations (especially Program/Erase) is a
> | violation of the NAND voltage specifications, which is not supported and
> | should be avoided
>
> Micron suggests to make the capacitors on the Nand chips supply input
> big enough that every started operation will be finished before the
> power goes down. Now we don't have that situation here, what I have
> though is a power good status GPIO, so my job is to wire that up to the
> Nand write operations.
>
> Now my question is how could that be done? I assume for some people a
> power good failure means that we should write all important data away,
> rather than preventing any Nand access. Given it's a policy decision I
> assume user space should be involved, right?  An option might be to
> introcude some sysfs entry to switch mtd devices to readonly mode. Would
> that be fine? Other suggestions?

Well, we need to make sure that no new write/erase command is issued and
the running one can complete. So, in nand_base.c you can (ab)use a lock
to ensure that.
Regarding important data, users that care need to use fsync() anyway, so
there is no need to trigger whatever writeback upon power failure.
Or what else important data do you have in mind?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
