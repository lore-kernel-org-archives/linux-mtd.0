Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29ABC35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 20:23:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949C120730
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 20:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RDYWuiEA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 949C120730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ijExsVkBKE6p4XPSIgKx3Lia7pt21CJ2rq0wkHgAJQ=; b=RDYWuiEAkCQ41S
	UFsjJ5l1ox5FR15H7VP7VButouCruEPvyR1fo0YIFzASY4pji+O2QifBSfD/ixG61bhj+OTXEE7RY
	CSXeuD2QXs5qQV2ykfu6tkJbLoAzCj7tLqdMSiYUSQn9DPXWoaMsPV937Y2AfJzc7+HcA4HXJoLKL
	Zf5lAoP9mY+XuGSju8zaWfHQG/Gkbfc8qSwYw3QDrPEbc3NwZAFdsYtELyFDUWrfNu+MODeSkljzs
	zNXwB2GFBxr4MWOs/OhgBDYZWQUv6XlCZC7DP0OkkZCwSMzhkk5A9rY8wxcrj1uzKTMKWHqC+yMZe
	9dHcqsGHjNHSdfnGVubA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izRCd-00025E-2z; Wed, 05 Feb 2020 20:23:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izRCZ-00024t-3Y
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 20:23:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A60F12912B6;
 Wed,  5 Feb 2020 20:23:04 +0000 (GMT)
Date: Wed, 5 Feb 2020 21:23:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: JH <jupiter.hce@gmail.com>
Subject: Re: mtd_nandbiterrs errors
Message-ID: <20200205212301.1e26c263@collabora.com>
In-Reply-To: <CAA=hcWSX9tBOjX8DEsg+=9NPdKzdwQBa1PyxA-r9vCLVsz52tg@mail.gmail.com>
References: <CAA=hcWTvGf9_izDMJhER-S=vEYcc22K4Syp5CuVjUr9tND7cgQ@mail.gmail.com>
 <CAA=hcWSX9tBOjX8DEsg+=9NPdKzdwQBa1PyxA-r9vCLVsz52tg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_122311_279552_F4FC0C94 
X-CRM114-Status: UNSURE (   7.45  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 5 Feb 2020 22:28:50 +1100
JH <jupiter.hce@gmail.com> wrote:

> Resolved, using kernel test probably a bad idea, change to use
> mtd-utils nandbiterrs resolved issue.

I doubt it solved the real problem: ECC is not working properly.

> > [  695.257984] mtd_nandbiterrs: Inserted biterror @ 0/0
> > [  695.262984] mtd_nandbiterrs: rewrite page
> > [  695.273646] mtd_nandbiterrs: read_page
> > [  695.280000] mtd_nandbiterrs: Read reported 2 corrected bit errors

The ECC engine should report an uncorrectable error here, not 2
corrected bits. BTW, an ECC of 2bits/512bytes sounds weak for a 2k-page
NAND. What's the NAND part you're testing with?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
