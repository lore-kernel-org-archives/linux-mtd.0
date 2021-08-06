Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ED5C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 10:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C4D60F35
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 10:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20C4D60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UAQ89FkUH9XQVJj2RVdv1uBlExwLIsVjQD4tyJ3SSnY=; b=jB4uxodkqDBuW3IKNJysADf2VH
	+NlIBszYMmjZoDZVFPi5pMFYtFOb0fSvMes7rDodInpoV3iayIYWWjbbu2PnyrnugkEyHCnaEjmUn
	5zZBDBxSmmVax505o+rtcU9mhmRoKkLvj6avdf/bCwxN0uT4AzsMX3niMugHekdbwU6U83YtnVHp6
	s2EE1RptgollavQgiWKMpRXbAq2vFGfIDnFr9ptKSWJJZ990qArwgSNSw9ggsFd1SwZXnMM/7G7Pk
	krY1ROausuGtqCMDntTg+B/ATZy50psYddUR3bvrx98X9vGOnMUiKmZcrvQgTRNIc8pxR3U+mCeFH
	mCt1RNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBxUC-00CAYX-QH; Fri, 06 Aug 2021 10:53:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBxU7-00CAYA-G7
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 10:53:53 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mBxU5-0002nV-4I; Fri, 06 Aug 2021 12:53:49 +0200
Subject: Re: [RFC PATCH v1 0/4] keys: introduce key_extract_material helper
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Song Liu <song@kernel.org>,
 Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-integrity@vger.kernel.org
References: <cover.b2fdd70b830d12853b12a12e32ceb0c8162c1346.1626945419.git-series.a.fatoum@pengutronix.de>
Message-ID: <7bc58825-c6d8-5e6d-4e1c-c4375e19c10e@pengutronix.de>
Date: Fri, 6 Aug 2021 12:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <cover.b2fdd70b830d12853b12a12e32ceb0c8162c1346.1626945419.git-series.a.fatoum@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_035351_599428_E4AFF14B 
X-CRM114-Status: GOOD (  23.20  )
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

Hello everyone,

On 22.07.21 11:17, Ahmad Fatoum wrote:
> While keys of differing type have a common struct key definition, there is
> no common scheme to the payload and key material extraction differs.
> 
> For kernel functionality that supports different key types,
> this means duplicated code for key material extraction and because key type
> is discriminated by a pointer to a global, users need to replicate
> reachability checks as well, so builtin code doesn't depend on a key
> type symbol offered by a module.
> 
> Make this easier by adding a common helper with initial support for
> user, logon, encrypted and trusted keys.
> 
> This series contains two example of its use: dm-crypt uses it to reduce
> boilerplate and ubifs authentication uses it to gain support for trusted
> and encrypted keys alongside the already supported logon keys.
> 
> Looking forward to your feedback,

@Mike, Aliasdair: Do you think of key_extract_material as an improvement?

Does someone share the opinion that the helper is useful or should I drop
it and just send out the ubifs auth patch seperately?

Cheers,
Ahmad

> Ahmad
> 
> ---
> To: David Howells <dhowells@redhat.com>
> To: Jarkko Sakkinen <jarkko@kernel.org>
> To: James Morris <jmorris@namei.org>
> To: "Serge E. Hallyn" <serge@hallyn.com>
> To: Alasdair Kergon <agk@redhat.com>
> To: Mike Snitzer <snitzer@redhat.com>
> To: dm-devel@redhat.com
> To: Song Liu <song@kernel.org>
> To: Richard Weinberger <richard@nod.at>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-raid@vger.kernel.org
> Cc: linux-integrity@vger.kernel.org
> Cc: keyrings@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-security-module@vger.kernel.org
> 
> Ahmad Fatoum (4):
>   keys: introduce key_extract_material helper
>   dm: crypt: use new key_extract_material helper
>   ubifs: auth: remove never hit key type error check
>   ubifs: auth: consult encrypted and trusted keys if no logon key was found
> 
>  Documentation/filesystems/ubifs.rst |  2 +-
>  drivers/md/dm-crypt.c               | 65 ++++--------------------------
>  fs/ubifs/auth.c                     | 25 +++++-------
>  include/linux/key.h                 | 45 +++++++++++++++++++++-
>  security/keys/key.c                 | 40 ++++++++++++++++++-
>  5 files changed, 107 insertions(+), 70 deletions(-)
> 
> base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
