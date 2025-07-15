Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9FFC83F1D
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jul 2025 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5OP6uYTGZuqiBptH+wg+Bt34kklfrHBV+k6CyTpAgXc=; b=3Uhfy/b5CnWE7d
	vjvl/u8TSjJanx+ZrdOm2donSPy0+eTq9EJJHwY56sG0K4yQs9/zjTpTLJ2rAkWc/mNzLUHtNJlKW
	c3OQ0H9PFpxWNsVIUUZvaILwM3HvcRfjwpg/CwT+Ru86/i1UBySNnMQFiFzzlr0QI34YzHOzW6r6Q
	BLZE7gUH+jo0cXAgNsqF6CCRSCA2FamiJzPiuwrYu/0iyEa37hLrUVdUyNDJ2xvSUSSHAP12uFkGF
	8UImMruPrio9NN6Ga5mubAhXileh9ovNW52ulUsOtIOZwM3SvY+fMMsC6Xt72rZSggNnbdHdiujf6
	2p7KxdriTAX3MgTm0acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbKC-00000004ZQ4-1PkJ;
	Tue, 15 Jul 2025 08:47:44 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubas2-00000004Uja-1NZv
	for linux-mtd@lists.infradead.org;
	Tue, 15 Jul 2025 08:18:39 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id 562804AE83; Tue, 15 Jul 2025 10:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1752567413; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=ddgv87CVm6WEpLRyIndOVHq22ZwvR+9NxOXvsYirqs2w00ch2ECLU/9kZVHMiYyCs
	 a2VsL40K2baeAF45k9TmoGjOH24uMKtlj+MJhRRVErbMv2LHRasBAzqkJS8bTO38ZN
	 8tSixXzMRaHPRqWQeVS2JpV8SBU7ccrGFSYTtfpNxc6fqsmM3ltEJ3IEPw7lbbNAhr
	 WwMuXzKs8w7mk92YXBheCCmLzbsu2Z3OIELQvehHwgOM/QSm7BS5zyFvAxZ5yH8+dT
	 /KdND+22fLQWR/HvAHToHMIEiBZqBxkvPpTK5EnYfRxeVomn39oOtFRZKFjwY79CoQ
	 EmH1AzcFam57g==
Received: by mail.fintara.pl for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2025 08:15:48 GMT
Message-ID: <20250715084500-0.1.ao.2tmhq.0.as02d18lli@fintara.pl>
Date: Tue, 15 Jul 2025 08:15:48 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011838_504906_F678023D 
X-CRM114-Status: UNSURE (   1.39  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
