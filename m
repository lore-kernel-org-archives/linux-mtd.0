Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A4A106ACE4
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Qi2cZLX1q7XDbQV8qaZb2WGHMG7tW8TwaUIfQimHkw4=; b=okaYruy8YFQPuJiBpw5adv07WX
	pORFw03krCLsri1Nlf7/qb1Xf9gNgbpy2I81il2AwBBgkSwGrWiPRg01NHK4WzP5xuWS+CD6QhPLg
	XNQVfDRVUFhDogcTy997pZR4fpeGFOMxBXKCk5royJ2jxEx6xSvGCi8unbNqles498BRkqjNEn3B3
	5hPB+353FqJrNpvusuRYlxCOPiMUszrXxZMgx9Y00jXqc6pDrd0eQ+ZaJRf7FLesTVPziQ4SfsQe/
	m9rDdGJdtJBsf583zXcfmdz0T7puWKfbzNH4QKSACUflBjgDOBvwNnY3zt15VTIMhZaGF9ClKrnkk
	KcD4FtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lnE-0000000F7qj-2tbV;
	Thu, 12 Mar 2026 19:34:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lnC-0000000F7q9-3XsI;
	Thu, 12 Mar 2026 19:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VQ4I1//oujMg/wMbvtHZ1fNg62i5rEhIWcPKRohhj4U=; b=ZrnPA5B9UUEjcpxDB2y7UWknNu
	HBiI3yuwlrPvI9t+ttYfOgQm+ljWEGkXQufxW24oaXseftJe6d5oYq4PBIxaErDzFIfRfJR2Qqg90
	KKd+A2O6y1m8OJHpY2dInDTihyZtJpyuSWejmd/3XJXhc425DSSb3AV3Kv4H+FlRvZ5BHgxj59Wu+
	qhcOk//D2MfBJvEnBF8OOaEuuriagwajMaqkRaXt/Pp0+hxhbxn0WL/sEdFlJrtg8jpm7Eb4D8UyJ
	/LIR7mN785LeZWFCVMZvfwfc4uIiVkEuX3P3ADo1/dXhW5bxSpDC0mtYdxLefkskw28yAH20obMKm
	DhKvZN6g==;
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ln9-00000001uIG-03T0;
	Thu, 12 Mar 2026 19:33:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4DE582C14A8;
	Thu, 12 Mar 2026 20:33:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id yCwNT8mwVvHB; Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8A34D2C14AA;
	Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3HN7guaAFMsE; Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id ABF4A2C14A6;
	Thu, 12 Mar 2026 20:33:42 +0100 (CET)
Date: Thu, 12 Mar 2026 20:33:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx <amd-gfx@lists.freedesktop.org>, 
	apparmor <apparmor@lists.ubuntu.com>, bpf <bpf@vger.kernel.org>, 
	ceph-devel <ceph-devel@vger.kernel.org>, cocci <cocci@inria.fr>, 
	dm-devel@lists.linux.dev, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	gfs2 <gfs2@lists.linux.dev>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-block <linux-block@vger.kernel.org>, 
	linux-bluetooth@vger.kernel.org, 
	linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-cifs <linux-cifs@vger.kernel.org>, linux-clk@vger.kernel.org, 
	linux-erofs <linux-erofs@lists.ozlabs.org>, 
	linux-ext4 <linux-ext4@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org, 
	linux-hyperv <linux-hyperv@vger.kernel.org>, 
	linux-input@vger.kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-leds@vger.kernel.org, 
	linux-media <linux-media@vger.kernel.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, linux-modules@vger.kernel.org, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-nfs <linux-nfs@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	linux-phy@lists.infradead.org, linux-pm <linux-pm@vger.kernel.org>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, 
	linux-scsi <linux-scsi@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	LSM <linux-security-module@vger.kernel.org>, 
	linux-sh <linux-sh@vger.kernel.org>, 
	linux-sound <linux-sound@vger.kernel.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	linux-usb@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	netdev <netdev@vger.kernel.org>, ntfs3 <ntfs3@lists.linux.dev>, 
	samba-technical <samba-technical@lists.samba.org>, 
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, v9fs <v9fs@lists.linux.dev>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1584421372.26258.1773344022512.JavaMail.zimbra@nod.at>
In-Reply-To: <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
Subject: Re: [PATCH 48/61] mtd: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: Prefer IS_ERR_OR_NULL over manual NULL check
Thread-Index: 0l8CyewQmrWlgaG6N3QgQFfukutRbA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193355_203421_23C5A22D 
X-CRM114-Status: UNSURE (   2.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlBoaWxpcHAgSGFobiIgPHBo
YWhuLW9zc0Bhdm0uZGU+Cj4gLQlpZiAoZ3Bpb210ZC0+bndwICYmICFJU19FUlIoZ3Bpb210ZC0+
bndwKSkKPiArCWlmICghSVNfRVJSX09SX05VTEwoZ3Bpb210ZC0+bndwKSkKCk5vLCBwbGVhc2Ug
ZG9uJ3QuCgpUaGlzIG1ha2VzIHJlYWRpbmcgdGhlIGNvZGUgbm90IGVhc2llci4KClRoYW5rcywK
Ly9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
