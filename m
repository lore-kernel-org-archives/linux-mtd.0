Return-Path: <SRS0=nDBX=5X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D450C2D0EC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 19:55:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D919D20730
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Apr 2020 19:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YaTxQH/X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdgdNOzN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D919D20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2LYt0neDfHf5eDGTm9hIlEzj6qkx7JfSPEuvKd4UC0=; b=YaTxQH/XIfuk+O
	Ms853gnYRiglfhoAoKfFBENgiK0NvSCphIgW4XiqPW/EgXAB+wAuSTT8kc6mPMInuyEs952M0tUuf
	D1nk08H/v/JefhDfUiYO233KLVIqdvHCiVLe8xcr1qV4vmKHajdZiCRKQqPT8ijoYzu2oCFTg+UjS
	nU+GZeNj6eBwDREmoF4megqlz4ODu3cFYn2V7x47L2RiK+0DZN0B7RcScLvorUxh+0OmKV8sKTAqs
	UJHZGwKGubI4bMOEQjkQuZ5MN886vdT/2ORM5nm/5CeySrRNqms31gFT9g0IHvOVoDDAMD3obo54d
	U+UEnEvlKrcdA+aQiqqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLuJn-0008V9-D1; Tue, 07 Apr 2020 19:55:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLuJk-0008UR-EL
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2020 19:55:29 +0000
Subject: Re: [GIT PULL] UBI/UBIFS fixes for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586289328;
 bh=DaJda3zXtcFXkWyIZuejGWq7C0TsDmJ0DAG90FwqzAo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JdgdNOzN2frDG3eiBxR6ICwXoP3E5ChSJdrIKfIUu1KDNzIEkv2SO9XkYIQuFzD7R
 RX0CvbqgnTB9kO6E4+OlLDU32hDJfQDnnR4wDw+/l8xG2GDF9AhiIiLzty8fZlipqk
 WFo2vmC/KWk3ajrDB5l/c2OCetIH3fprGgvabyKI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <793490269.91815.1586263081165.JavaMail.zimbra@nod.at>
References: <793490269.91815.1586263081165.JavaMail.zimbra@nod.at>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <793490269.91815.1586263081165.JavaMail.zimbra@nod.at>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git
 tags/for-linus-5.7-rc1
X-PR-Tracked-Commit-Id: 3676f32a98cd6ed4481c21bceb8b4829d4b6d1cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 763dede1b24886d327bfaed7cf59ee3c01c7913e
Message-Id: <158628932815.3792.16265491519028967812.pr-tracker-bot@kernel.org>
Date: Tue, 07 Apr 2020 19:55:28 +0000
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_125528_506464_A075F231 
X-CRM114-Status: UNSURE (   1.76  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 7 Apr 2020 14:38:01 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/for-linus-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/763dede1b24886d327bfaed7cf59ee3c01c7913e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
