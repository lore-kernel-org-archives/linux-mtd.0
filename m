Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE1FC61DBD
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 05:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJdsJk/ee2uUU26EWj3kaYWatidD84ZZDIWg3vBDL2Q=; b=BXEW4ckvLqaKsQ
	SU4VgCFQH7QqZUmBBBKcbDreDGSgbJ+sJfNyPJa6Cr/262sdJdSqN3hhuf6/yHm0XyChYrhqwUzji
	oYXZ5yrSBhWkKi7DyW21rp15WI9TzqrZWYtfnH+fyX/UnLi5vbnKBzNPC4UeHP+GDGP4xT8ZU5lkU
	utZTPkEnjyU+03XrgsRqX0L4Cm2FzCRa4YWDOVI1hDDklWgQAUlD4lXtBlAM0ZF++bsC9DzsAIR6N
	AZsUPynBQYJAk/W3qup8M0nS9Bf0YSfOLa9DKEXS3XotCl6iHzDmKXCE59ytX3FSyuON0mz7hHRoB
	k06lVQ0pKeOoW9i+V4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpca-00000005Ay1-0EhG;
	Fri, 28 Aug 2026 05:59:24 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpcX-00000005Axd-3ijq
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 05:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787896762; x=1819432762;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8+107hDhR+OaHNqVNebExzPHsopsVl8LYlJEiPaqL4s=;
  b=HC3O5gEm9geN68H/6Kb4VpkSiJcIIfs8BElTBDwa4lQsBf3vBLnKU9kU
   q6m0qgHzCsr7effY7za/hq67J25Z2RutXZnEKypi2JqNNq0soTz28j1VO
   k6fgFJ2M5TO/JIufS+nQZUgXcGqdRp6rhr4IpQpRFxpGCvXHuxNsr8AvX
   g=;
X-CSE-ConnectionGUID: lwCI5+8FT4GweHdmaziGBQ==
X-CSE-MsgGUID: NeCEDLO+Q8GoUfcpOvSdrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="158416316"
X-IronPort-AV: E=Sophos;i="6.25,248,1779141600"; 
   d="scan'208";a="158416316"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 07:59:17 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:59:16 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 28 Aug
 2026 07:59:16 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Fri, 28 Aug 2026 07:59:16 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <michael@walle.cc>, <miquel.raynal@bootlin.com>
CC: <mwalle@kernel.org>, <pratyush@kernel.org>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: RE: Sashiko to track linux-mtd
Thread-Topic: Sashiko to track linux-mtd
Thread-Index: AQHdA6z+zQDJzP5BH0+i5EcNLx8rzbZNZ7CNgAhEU1WAAoKYgIAN9y/AgAts7tyAAGVG64A86BDN///nvICABJVZIA==
Date: Fri, 28 Aug 2026 05:59:16 +0000
Message-ID: <e2acce09375046f8afdddc3693ccd7eb@infineon.com>
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
 <87pl19s7ng.fsf@bootlin.com> <0fe3140096bc48a8e71838362220d9f8@kernel.org>
 <b224c6938e084763b017c63e0aa3fa3f@infineon.com> <8733xikmb9.fsf@bootlin.com>
 <8733xhiqyn.fsf@bootlin.com> <87v78yimb1.fsf@bootlin.com>
 <10CE8F35-D4FC-4CE8-B687-1154DF9915CF@walle.cc>
In-Reply-To: <10CE8F35-D4FC-4CE8-B687-1154DF9915CF@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_225922_239646_A192EC47 
X-CRM114-Status: GOOD (  19.22  )
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

> Hi,
> 
> Am 25. August 2026 11:25:38 MESZ schrieb Miquel Raynal <miquel.raynal@bootlin.com>:
> >Hello,
> >
> >On 17/07/2026 at 17:19:28 +02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> >> Hello folks,
> >>
> >>> So I will make a PR for enabling it, but let's keep in mind that this is
> >>> experimental and can be re-discussed at any time.
> >>
> >> FYI: https://github.com/sashiko-dev/sashiko/pull/336
> >
> >I am partially satisfied about how Sashiko intervenes in my review
> >flow, here is my current feeling.
> >
> >About Sashiko itself:
> >+ many interesting findings, worth enabling for sure
> >+ most of the findings are correct, but not always worth another version
> >- no possible feedback loop (eg. "this is an hallucination, stop
> >  bothering us with this")
> >- pre-existing issues are flagged at the same "level" as new issues
> >
> >About our configuration of Sashiko:
> >- it takes more time to me to do the check, copy & paste dance every
> >  time there is something I find really needed
> >- I get Cc'ed on reviews of patches I did not receive (eg. jffs2 things)
> 
> Yeah I noticed that, too.
> 
> >In the end I would like to modify the current configuration in order for
> >Sashiko to act as a regular reviewer, ie. just answer to all recipients,
> >including the author:
> >
> >- cc = ...
> >+ reply_all = true
> >+ reply_to_author = true
> 
> I'm fine with the change. Let's see how patch submitters will react.
> 
> -michael

I'm fine too.

Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
