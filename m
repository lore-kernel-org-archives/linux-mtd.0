Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2583EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 05:52:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA64C206E9
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 05:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xAydVsTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA64C206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:References:In-reply-to:MIME-Version:
	Subject:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VsNUe+Dw6NUSpPNabK30GnYIc71tIf0qxMZ4MPwkOX0=; b=xAydVsTOzJZ3z7eQ43hcZwgCi
	kcPH2YK0sW9u9nca3YauE9m2b+dykshnLs+V/eZ53ldQiXNwxQ474oLH/cJV+78rikKCCWksp+Ffi
	fCkRd7hrKl1S9PmscILQo7zKQeKKQFw+Qlch2s0RqA7RiKPIL4WnBmCbHViFFhheoqOq/qEmRtUkC
	nm8dD+D3lS/2cgZLK/0o3m/QV23C6GMljD6Oem4O4rGlbIYAuWS4HYa9tiS6QStCaLn5b6dE6B8N6
	p5doWVNao5OCnwKHU9yR1m8OFZmt6ybneGxYHnTS+LvGFRFfjbqQgq48ydakx1YrI0Xu9W0mK+ZTr
	9LR3NmnYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9Ai-0002ka-TG; Tue, 30 Jun 2020 05:51:08 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9Af-0002kP-LO
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 05:51:07 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49wtkv0ycLz1rt4G
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2020 07:51:03 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49wtkv0K5Fz1qqkQ
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2020 07:51:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FBHUHquyWd9g for <linux-mtd@lists.infradead.org>;
 Tue, 30 Jun 2020 07:51:02 +0200 (CEST)
X-Auth-Info: DjX23i1CpCVRy9jR8IN7PXkm0zSCGbtdqXysdvi3PPE=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2020 07:51:02 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 108)
 id 1A6F0A01A1; Tue, 30 Jun 2020 07:51:02 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 050A5A006E;
 Tue, 30 Jun 2020 07:50:55 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id 84DAA2400D6;
 Tue, 30 Jun 2020 07:50:55 +0200 (CEST)
To: Richard Weinberger <richard@nod.at>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
MIME-Version: 1.0
In-reply-to: <667429184.71186.1593417085045.JavaMail.zimbra@nod.at>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
 <2117676.Cu8v49ySxQ@ada>
 <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
 <20200629074814.CBCA12400D6@gemini.denx.de>
 <667429184.71186.1593417085045.JavaMail.zimbra@nod.at>
Comments: In-reply-to Richard Weinberger <richard@nod.at>
 message dated "Mon, 29 Jun 2020 09:51:25 +0200."
Date: Tue, 30 Jun 2020 07:50:55 +0200
Message-Id: <20200630055055.84DAA2400D6@gemini.denx.de>
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
Cc: Alexander Dahl <ada@thorsis.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dear Richard,

In message <667429184.71186.1593417085045.JavaMail.zimbra@nod.at> you wrote:
>
> > No, U-Boot does not implement any preferences here, i. e. both
> > methods can be used out of the box.  It is just the preference of
> > the user who decides which way to go - using the file system seems
> > more flexible to some unsers, while others care about the additional
> > boot time needed to mount the file system or the additional memory
> > footprint needed for the file system code.
> > 
> > Your choice.
>
> Good to know! Thanks for pointing this out.
>
> I think for most users reading from a filesystem feels more natural
> since on other storage systems this is the only way to go.

It's also easier to use a file system for example during development,
for example when you often switch between several different kernel
images and such.

But as mentioned it comes with the penalty of additional overhead,
both in memory footprint and boot time, so for the production
configuration it makes sense to use a static UBI volume instead.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"The question of whether a computer can think is no more  interesting
than the question of whether a submarine can swim"
                                                - Edsgar W.  Dijkstra

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
