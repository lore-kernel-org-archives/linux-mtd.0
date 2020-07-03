Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE41C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 10:27:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6A32063A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 10:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIDjsV0z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6A32063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eczpM9PvggceJJRT8Fq964nB0OK3GexW3M+tswnxBtg=; b=uIDjsV0z0/5QJ4SFoTRzWL2cgu
	IWsofNPy+OJh7kL8oiI7HK+tCfAnIn1234LAV1H+wlKbVxcMeoX5xogoRo2WY03m9jWG+5y1bHply
	iEOpSWJ86I1vsJdf0ikeb5qzR/fgbv/SK+83XX/3BWg6vUsbgRpeZsss8fxgr2Ck+w7HOIZFU6vQW
	mwD2F3eUYoMkzxOwlRVmrh5XECDCQNcYK97+uVFHokItTqcQMh+dPUUcwAEooXm6zcKYiD5IQ8DFc
	vZJH0APX/ixLRf9nbJ5uzAeagW7NdoWVsuVqipHBP+vNlznl9Qbs94T+CJIZLKB/xEgHu9vrYvhsT
	/rzvqoBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrItq-0005cN-Jt; Fri, 03 Jul 2020 10:26:30 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrIto-0005be-2f
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 10:26:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 7BB3B1EE1
 for <linux-mtd@lists.infradead.org>; Fri,  3 Jul 2020 12:26:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hj7LaWo5b7EP for <linux-mtd@lists.infradead.org>;
 Fri,  3 Jul 2020 12:26:20 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 0F2C646F3; Fri,  3 Jul 2020 12:26:19 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: lists.infradead.org restored from backup, git.infradead.org down.
Date: Fri, 03 Jul 2020 12:26:16 +0200
Message-ID: <3179465.I5GL2cDyv0@ada>
In-Reply-To: <CAFLxGvyuQ011RNjLYch-c0zhwPME214whiQZ=eMwodQ1SVafyw@mail.gmail.com>
References: <e31c36b5-5860-b547-81cb-74135eb5823a@koalo.de>
 <CABDT8WwS=gmS6r9ihV342hywvUZH-uXj-f7cdyh-n06QjObRYQ@mail.gmail.com>
 <CAFLxGvyuQ011RNjLYch-c0zhwPME214whiQZ=eMwodQ1SVafyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_062628_239967_33B535FF 
X-CRM114-Status: UNSURE (   7.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hei hei,

Am Donnerstag, 2. Juli 2020, 17:09:46 CEST schrieb Richard Weinberger:
> On Thu, Jul 2, 2020 at 1:46 PM Florian Kauer <florian.kauer@koalo.de> wrote:
> > Thanks for the fast response!
> > The only one I am aware of is https://github.com/sigma-star/mtd-utils
> 
> Another mirror:
> https://git.infraroot.at/mtd-utils.git/

If you only care about mtd-utils, you'll find some pesonal forks on GitHub of 
course:

https://github.com/search?q=mtd-utils&s=updated&type=Repositories

Sorting by "recently updated" reveals at least those which were last updated 
in February:

- https://github.com/LeSpocky/mtd-utils (mine)
- https://github.com/sigma-star/mtd-utils (already mentioned)

And more, but most probably outdated.

But this is one repo only, git.infradead.org probably had more?

Greets
Alex




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
