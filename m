Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C94C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 04:57:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB859611AD
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 04:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB859611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HarIB/m0KgI3GKQvvQPvd3rEMGs7j8+zqGRVsPCvg+M=; b=S3YapYsPfr8zUa1kEJXkuWbolB
	ltrMTuduJQRTSaLgF1Kx+y413Q4cdZw6MsSswm9xB1ViWzkMmQOegrIZcuyQhrvRVOg2RxtOpfmTH
	Olq5EQFJKCT6lmB9imBZT276HpM8qfKqYH72LipGIB4XcxUHVdH6c0zr1L8lZGOPiydSAuKQPvcOV
	/yDYudxbaO3WJ5nlZQlge9g9fIr6psyTMeovm00s+nZ9R8LfE8WSDv3YA4GMiHa+iIKbTayrF2695
	QYisp1eAIhdKZ0+YK8EyVuPRwFAIc8lTEVRneQpRGQx+Uv0YrIBWCwWAEqL7zaF+WqZdNE/iTQx2a
	rus5dwmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUMit-006uQS-6r; Thu, 08 Apr 2021 04:56:58 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUMin-006uPz-A8
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 04:56:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 3A17A2947
 for <linux-mtd@lists.infradead.org>; Thu,  8 Apr 2021 06:56:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vktJsYFJ-YTR for <linux-mtd@lists.infradead.org>;
 Thu,  8 Apr 2021 06:56:48 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 0F0B036A4; Thu,  8 Apr 2021 06:56:47 +0200 (CEST)
Date: Thu, 8 Apr 2021 06:56:38 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI issues with linux-stable 5.11.11
Message-ID: <YG6NBoom7bubm8V8@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Trevor Woerner <twoerner@gmail.com>,
 linux-mtd@lists.infradead.org
References: <20210407190302.GA12280@localhost>
 <20210407202356.GA31407@localhost>
Content-Disposition: inline
In-Reply-To: <20210407202356.GA31407@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_055649_753749_8E739C57 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Trevor,

Am Wed, Apr 07, 2021 at 04:23:56PM -0400 schrieb Trevor Woerner:
> I forgot to note that my filesystem/flash/UBI works perfectly fine with
> linux-stable kernels 5.0.19 to 5.10.27. The problem only shows up, suddenly,
> when trying to use 5.11.11 (everything else being the same).

I would try `git bisect` on this, probably with v5.10 as start and
master (or the last rc) as end point.

Greets
Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
