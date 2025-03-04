Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90337C282D0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QFSjMhmlUrgrXIZWS+zxHYzurP31leb0Q7nB21xptU=; b=47qGVbNwhbnLjJ
	ohzvLW9qTqHve9visZE5MFivsk1/ltwTTsyvRRe2u5hiW9f8x191VRK2UqSmkeyHjY3YaDPBZ6V/i
	Y7TcE+Zv7VgACmrEa1sZm5A1NIo+9DtbxZiQ1ATJYuaYDydVU4z500Uob63Q9Bk4KqmhfFB0lbY4Z
	ePm2PdJkWZb4zY7IebZjBO+xQVhQJ8sgTRxqEfpcRvcVMQQ/97thc3pF5CoYUWI6po9sbN+xu7DQ3
	XtwJ/s3JolVdeE5PlDErkSdF2TM5rPzGCky51PqsVQF8ao5F7+PqjJmVByJhCMs9cDG5ptohCoDdj
	0Z292gCYeGZnSEXA2siw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP3v-000000042UY-0NId;
	Tue, 04 Mar 2025 09:59:43 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO0d-00000003iIK-380Z
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 08:52:17 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id C9522A4758; Tue,  4 Mar 2025 09:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1741078325; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=e56pXq7MVEuGUQ0dy41cR2qRm4hWlNM9sJ1NOMDE1yRA+iHY4ETgIvZgdwjNN2s0w
	 43I3KFjOUfCekrVDtiY4JHaaaRgwpenABraTtB47PCw4u/WlSjA0E3NqPrOqmrsg44
	 shqqJdoaHafvo6PkUuqvH172DIQswc1C8t6iVdsE+iOualmelWJblI9EBy9j4nIQHN
	 0i3G4GPKpQgjJ6HszHHJEWiwqbyhWEsssDqDdmjUqSZ95k7EYDS11kia9ovdWPDyJ4
	 S0S7PAhA8fULo0GxMSvGmr6598550OTxtTgEhXlgrdy1fsVleAUqLXpMzGr7rM6gHy
	 fDMpmbPWpNjdQ==
Received: by mail.novaplan.pl for <linux-mtd@lists.infradead.org>; Tue,  4 Mar 2025 08:50:42 GMT
Message-ID: <20250304084500-0.1.k7.1dfno.0.l81188imxp@novaplan.pl>
Date: Tue,  4 Mar 2025 08:50:42 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005216_474784_E9E5DC00 
X-CRM114-Status: UNSURE (   2.43  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
