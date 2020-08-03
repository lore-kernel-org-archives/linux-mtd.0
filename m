Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC2DC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 15:26:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C6CA206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 15:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lg9hCTEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C6CA206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=battistine.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:To:Message-ID:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xitx+IbCVO5QfRcoC3t/W8usSc0yMpqDB4onxNNkPLI=; b=lg9hCTEmn4zIaehQR+3y1QAKov
	QwQyoqFZDGtwJU5URg87zHku+gZ9vO9cpkUT7c2UwbW/CIrN98SVomiW1a8cIW/f2FfCxSLZj4tl2
	2ZQCndcSNIHf46QZ0BIujfoKScc3oFqkISdWlmJ5JlHFcp9hGA06wM3VCq40t9DmcWgd8ARdHg2aP
	94aZnMuiRLnmbn20hIgw2lTRSfhKZMZ/flM2yEFuIvMYAGfl11kOyc6T3OHdi6G7Rx066+q02bAFT
	xKocYa/yvQB0E8+ne4I/hDcIRAf42Df/lUOf5bz5JbsJdzwO63W38R5d2602SIaNZvhD3bPOUrIeH
	APDPiRAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2cL0-0000Vn-Rc; Mon, 03 Aug 2020 15:25:18 +0000
Received: from posta.domusmedia.it ([95.110.165.184])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2cKt-0000V2-Ln
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 15:25:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by posta.domusmedia.it (Postfix) with ESMTP id 81F2F43303
 for <linux-mtd@lists.infradead.org>; Mon,  3 Aug 2020 17:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 posta.domusmedia.it 81F2F43303
X-Virus-Scanned: amavisd-new at posta.domusmedia.it
Received: from posta.domusmedia.it ([127.0.0.1])
 by localhost (posta.domusmedia.it [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HokqlM75Sp9t for <linux-mtd@lists.infradead.org>;
 Mon,  3 Aug 2020 17:14:19 +0200 (CEST)
Received: by posta.domusmedia.it (Postfix, from userid 1001)
 id B423F4334F; Mon,  3 Aug 2020 15:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 posta.domusmedia.it B423F4334F
Received: from posta.domusmedia.it (unknown [167.179.5.184])
 by posta.domusmedia.it (Postfix) with ESMTPA id BC10C4112D;
 Mon,  3 Aug 2020 15:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 posta.domusmedia.it BC10C4112D
Date: Mon, 3 Aug 2020 09:56:32 -0400
From: massiblue <judith.pamintuan@battistine.it>
Message-ID: <a51f20d92542$a3a8d02f$e20bc352$@battistine.it>
To: "ssiitt" <ssiitt@iol.it>, "f federici" <f.federici@sit-consulting.it>,
 "segreteria studenti" <segreteria.studenti@polimi.it>,
 "linux mtd" <linux-mtd@lists.infradead.org>,
 "joern" <joern@wohnheim.fh-wedel.de>
Subject: =?UTF-8?Q?Spero_che_tu_stia_avendo_una_giornata_?=
 =?UTF-8?Q?magnifica?=
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_112512_489541_CAFE3975 
X-CRM114-Status: UNSURE (   2.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

https://trichamedpas1912.blogspot.sn/





Tuo per sempre,massiblue@libero.it


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
