Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50ABE7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ypQhBp2I4rgmK1AdsmZJ3N1x2sGIjabJW7TfofipCNY=; b=qSMr11oKTptlKq
	h4IV2gl8c1zi3fpNjjQId4/1XxzZgRRFYAnnF8EuWQzes8606LecfXWMm1YAW4D3EXdc2frrmZzb9
	NAsU47IjRauPkZ6N78e+Ka8kD7FwFcLWMPp7jB0mX0ey4ypSnlvU2o+fOLrFs3KLRpiO+M6nx+uxp
	2DmwSW0t8XC5qYKoI8qN4eFIvieVjyHhsdAlkjm6wnRIpy/z56QZW8f9iFJ6k1z14drMfSkVzSSzT
	etZD5DWwcejKuaejSUZ0NO9odgaBi3ofl0Qjn386DZDO0Iipyb4DgbrN9RwN01iPrH9AwkVD92yQh
	HuVXA4rfKr9nZe/00Y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqNW-00000003ecs-1q7s;
	Sat, 07 Dec 2024 08:41:30 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqMU-00000003eXC-3ucn
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 08:40:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 96F002E6145;
	Sat,  7 Dec 2024 09:40:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id qPy_3ZzQQ0Pu; Sat,  7 Dec 2024 09:40:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 520E32E6150;
	Sat,  7 Dec 2024 09:40:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Vvl3TawRBc6n; Sat,  7 Dec 2024 09:40:25 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 33B032E6145;
	Sat,  7 Dec 2024 09:40:25 +0100 (CET)
Date: Sat, 7 Dec 2024 09:40:25 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <972877429.45679137.1733560825113.JavaMail.zimbra@nod.at>
Subject: [GIT PUL] JFFS2 fixes for v6.13-rc2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Index: 33KlDEGjZjqXAp/6Bdh5OoiTVbwAZg==
Thread-Topic: JFFS2 fixes for v6.13-rc2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_004027_115730_AB6FA2E1 
X-CRM114-Status: UNSURE (   3.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit feffde684ac29a3b7aec82d2df850fbdbdee55e4:

  Merge tag 'for-6.13-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux (2024-12-03 11:02:17 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.13-rc2

for you to fetch changes up to b29bf7119d6bbfd04aabb8d82b060fe2a33ef890:

  jffs2: Fix rtime decompressor (2024-12-05 12:31:40 +0100)

----------------------------------------------------------------
This pull request contains fixes for JFFS2:

- Fixup rtime compressor bounds checking

----------------------------------------------------------------
Richard Weinberger (1):
      jffs2: Fix rtime decompressor

 fs/jffs2/compr_rtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
