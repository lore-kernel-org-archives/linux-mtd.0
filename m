Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16233C10F00
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 15:45:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD6A218A5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 15:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJ7PdKMj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD6A218A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaILTMoQcZUm5WEIcsvJ9+DRTVmNjsvjS4YfldNzVUA=; b=GJ7PdKMjcXuwTM
	h234Fra9TeT6UfjYtH/0P4pmCLp1/18S3lhtHPfxDiYnU+GCG0J7s/Sxyj+uLRyv6cmQ1PLGTqxUW
	PnXwVwIor1dYm68E0CZDxGfTwxV6p60ELLlcswsTiYjc5/37lofMfKh6bD+cDnttetyu0Dpbbf7cV
	rcwR6EdrawW/eaqBrWoLW8hPQ9tpGPEWmOI4QALbTIERhDID7RignFM0ugGJLsffPe4CnT5bm4hRQ
	lY4mWONox1TjXT58YADreAhcDuWQOQStwCnHhqgU5D2DAReasRL62oTawCezCVQSsT1/V8oD/Ce6y
	Mvm4sOmGaQcNZsAMvvAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6zsU-0000Mj-MU; Thu, 21 Mar 2019 15:45:10 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6zsR-0008Mt-9M
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 15:45:09 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F493C057F40;
 Thu, 21 Mar 2019 15:45:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-98.rdu2.redhat.com
 [10.10.121.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6655D5C66D;
 Thu, 21 Mar 2019 15:45:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20992998.5BCRIlqCZf@blindfold>
References: <20992998.5BCRIlqCZf@blindfold> <3463221.D14WHduXq3@blindfold>
 <155316902426.29884.2476392753144421312.stgit@warthog.procyon.org.uk>
 <6007.1553181386@warthog.procyon.org.uk>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [RFC PATCH 0/6] Convert mount_single-using filesystems to
 fs_context
MIME-Version: 1.0
Content-ID: <19627.1553183102.1@warthog.procyon.org.uk>
Date: Thu, 21 Mar 2019 15:45:02 +0000
Message-ID: <19628.1553183102@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 21 Mar 2019 15:45:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_084507_353252_7D57C193 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: linux-block@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
 Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard Weinberger <richard@nod.at> wrote:

> > Bah.  The problem is that vfs_get_super() doesn't set fc->root before
> > calling reconfigure_super().
> 
> Do you still need the disassembly?

Thanks, but no.  I've pushed replacement patches to my git branch.

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
