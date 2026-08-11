Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31EC5CFC1
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZIxbJwCblq5XkgBPkPJq87FNP8ohFQX40RLr3Gc5Fo=; b=Jg3mt6t3cyohgF
	nH+0M7Hrp31zciPZ0os+drNQf+z1fhTL8iIU4biLdIo9ziuTrejU2NzRFO8CesTcUE2AnDeoz0YBs
	3uZZMhiQ7iuFNPIVEt12jKWuaBdfp57Q7pjIhnV+o/+HMzQXOtF3wr+75fVBY4xmwpSIWs9YwYihw
	6ke3cAHaPVQf5kmkEtVenFk6Md6jln+0ZcR4sNua1q759fNTvOX2dgTdaxMh1at1Gf8fWHo/33HCs
	Au6D/jDqy94+mHpvzDIW74K52zeZtG2qk3D20z5J9B7Qfqgul0qTW9nkcIFcDznELfYKZnI8OGdkx
	Hoo87sriK7hW99bV88BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuKK-0000000F0RV-3anu;
	Tue, 11 Aug 2026 21:48:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuKI-0000000F0RB-32IO
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 21:48:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2E4E600AE;
	Tue, 11 Aug 2026 21:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391861F000E9;
	Tue, 11 Aug 2026 21:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786484881;
	bh=ldJUy+mzYfFP+vTdoeV8DvQmSIj2flUuiuA6smQkXlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EAYrd1ZSyenBjwi+GTlIj0fT3POLmvwRPTT8Z5Agd8LitTYnULbzv4neyKZEIXf/G
	 CECisP6uHKGFpl+T7DN5igAIXnZDhB8T/3gMciPbskwqGmvHfHFPpY4UNMcxICMXHr
	 +p0iq7ntd6C0U0ic4qwSeHXk8C5H5QAestbIIX0jssm5vruTd4pvy9z9VKpm820deV
	 SJVnxV0Au+qqELN9lKgxf4P4XNyF+3Z5U24W9ZGUZ/Pa6lRiqLfq+VxxG0FQn3Hq6z
	 cEaubLv3FE6jYXgZBOzSCj2FDA48Cg8E3hg0yszAm43/ClAPyf9+/YHDVLxAld0VBa
	 ZRfVPSVmOx4hg==
From: Richard Weinberger <rw@kernel.org>
To: richard@nod.at, Ibrahim Hashimov <security@auditcode.ai>
Cc: chengzhihao1@huawei.com, s.hauer@pengutronix.de, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260724074327.73582-1-security@auditcode.ai>
References: <20260724074327.73582-1-security@auditcode.ai>
Subject: Re: [PATCH] ubifs: fix out-of-bounds read in signature length
 check
Message-Id: <178648487886.3958324.18328006518346578815.b4-ty@b4>
Date: Tue, 11 Aug 2026 23:47:58 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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

On Fri, 24 Jul 2026 09:43:27 +0200, Ibrahim Hashimov wrote:
> ubifs_sb_verify_signature() bounds the on-disk ubifs_sig_node->len field
> before handing the signature payload to verify_pkcs7_signature(), but the
> check has the wrong sign:
> 
> 	if (le32_to_cpu(signode->len) > snod->len + sizeof(struct ubifs_sig_node))
> 
> The signature bytes start sizeof(struct ubifs_sig_node) (UBIFS_SIG_NODE_SZ,
> 64 bytes) into the node, so the payload is at most
> 
> [...]

Applied, thanks!

[1/1] ubifs: fix out-of-bounds read in signature length check
      commit: d68851fbac230fabaeeae25b19fe60ece173da88


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
