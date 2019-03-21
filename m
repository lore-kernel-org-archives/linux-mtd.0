Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FA3C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 15:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C200218A5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 15:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfg5o24L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C200218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2b2kOwalHKWNHOj5h4Tpwmrii8BwLsFcWKilq9CDd+o=; b=rfg5o24LKXGaDU
	V7aZr7JrqQ2XXy0TOTAM8WZQffskC90/5nopJOi5HrQe2lqIOfjSwgHePpB0NzbVrloJfxWT3xWrl
	s0a0tXStGyFIW37qKKkixAtyLRD2ZXhdLV34bJgldskh6xbfR1U1X3dO7Dv8/prPVBFdATCy8i68C
	gGRmYNAz6iRI/bG9hr/rVkVx9S/4lVOD0S2FNK9zUu4y4QUrQwygPYJRHr5/wDTevm5d9XSRePGPd
	3aK/S9e1JDZWDdxFtdnQ/g6fZ1XgUuK1LGobmtDfQhC80/rrHYA+/GNIkwMoq0cVpU1g92uIGHCUp
	ETbWlX8hSv6EtkljQ92w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6zpZ-00070E-A7; Thu, 21 Mar 2019 15:42:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6zpU-0006zI-KE
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 15:42:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 23E9B60D4822;
 Thu, 21 Mar 2019 16:42:01 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1yo2eUvrtXPh; Thu, 21 Mar 2019 16:42:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C7C2760D4821;
 Thu, 21 Mar 2019 16:42:00 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rGDP5xh5P4wx; Thu, 21 Mar 2019 16:42:00 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 12FA4603B562;
 Thu, 21 Mar 2019 16:42:00 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH 0/6] Convert mount_single-using filesystems to
 fs_context
Date: Thu, 21 Mar 2019 16:41:59 +0100
Message-ID: <20992998.5BCRIlqCZf@blindfold>
In-Reply-To: <6007.1553181386@warthog.procyon.org.uk>
References: <3463221.D14WHduXq3@blindfold>
 <155316902426.29884.2476392753144421312.stgit@warthog.procyon.org.uk>
 <6007.1553181386@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_084204_811294_A77F612D 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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
Cc: squashfs-devel@lists.sourceforge.net, Nicolas Pitre <nico@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 21. M=E4rz 2019, 16:16:26 CET schrieb David Howells:
> Bah.  The problem is that vfs_get_super() doesn't set fc->root before cal=
ling
> reconfigure_super().

Do you still need the disassembly?

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
