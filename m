Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868EBC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Oct 2022 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qFJpZNQ97QU21oJMLjD30LFWJS9izGqG1ZPAkdYzSYc=; b=UK7beySV4C+hk2
	VMra0o8nAobz2AXMxLCbYti9Dc7sFqS3XEzHYze92ZV4Zhf7z7tc2LvMldgh2EjR8sZ0aI/NSSLCA
	IltDDxWvOPNrVXDxmm3MEUPneUmMq57xp1SvaoZC3p0Cfcqhu0PewsLgndATTZSHYFzJhbNDrVDba
	i05tEJcH5jPsWlmQejK3AcQL9X1fQuVxUbSuQy6ioRHzQc0R1YWJii7Gah5tQWErkC9azMBKR4XXH
	tKa5l1ypJnrJmxFD0xChXBNnx8BmE9hTK0BB4PKDX62m9fFTF76giUTO5E+9sgZOgl2tPpZpoAHAe
	VGtu7e8n0DSUkUc8aPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFeF-00Dzbz-0s; Fri, 14 Oct 2022 08:02:27 +0000
Received: from mail.fadrush.pl ([54.37.225.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFeB-00Dzb0-V3
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2022 08:02:25 +0000
Received: by mail.fadrush.pl (Postfix, from userid 1002)
	id AF42B23502; Fri, 14 Oct 2022 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fadrush.pl; s=mail;
	t=1665734537; bh=bD6j9gIFU6CLTaCGl0Ow9oeIxtirvTfMeNZSfLEZQ+I=;
	h=Date:From:To:Subject:From;
	b=TuJ/PKausY/+FnsCmfXl+zIiC7R1uFnAq35yy87likGx7Kt2OFDJ0u3hQgfNG0RTJ
	 0gqpE45IHwTGmPPp2Fo499ijf0M45eea0eOKsZCPUGcukh5eLVNw7k1RhMarfVIG5R
	 WJFreCaXmq4pgRorKR/5gfAwsAu2UUWdaO9wJRN7qcWCCAGH2IrUc3PeVRQ7dbT9UL
	 CnGSYKByYWHZqf1wrj3RKObPG4eJpkhS8AfQ1KGqkXLoZ5aKpOLk/AqVG2TxW0Zwa2
	 o5etlWnBgcMl8BuiTTV4uJk+2yJdt5uaQ5Ug2E0+974qKQLGWvLz1CWXUfOlX/yXtx
	 yBNN8trepcJdw==
Received: by mail.fadrush.pl for <linux-mtd@lists.infradead.org>; Fri, 14 Oct 2022 08:00:54 GMT
Message-ID: <20221014064500-0.1.28.m88h.0.i5iwpkli09@fadrush.pl>
Date: Fri, 14 Oct 2022 08:00:54 GMT
From: "Jakub Olejniczak" <jakub.olejniczak@fadrush.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Zwi=C4=99kszenie_p=C5=82ynno=C5=9Bci_finansowej?=
X-Mailer: mail.fadrush.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_010224_149612_7DF2F5FF 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGNo
Y2lhxYJieW0gemFwcm9wb25vd2HEhyB3eWdvZG5lIHJvendpxIV6YW5pZSwga3TDs3JlIHVtb8W8
bGl3aSBQYcWEc3R3YSBmaXJtaWUgc3RhYmlsbnkgcm96d8Ozai4gCgpLb25rdXJlbmN5am5lIG90
b2N6ZW5pZSB3eW1hZ2EgY2nEhWfFgmVnbyB1bGVwc3phbmlhIGkgcG9zemVyemVuaWEgb2ZlcnR5
LCBjbyB6IGtvbGVpIHdpxIXFvGUgc2nEmSB6IGtvbmllY3pub8WbY2nEhSBpbndlc3Rvd2FuaWEu
IEJyYWsgb2Rwb3dpZWRuaWVnbyBrYXBpdGHFgnUgcG93YcW8bmllIG9ncmFuaWN6YSB0ZW1wbyBy
b3p3b2p1IGZpcm15LgoKT2Qgd2llbHUgbGF0IHogcG93b2R6ZW5pZW0gcG9tYWdhbSBmaXJtb20g
dyB1enlza2FuaXUgbmFqbGVwc3plaiBmb3JteSBmaW5hbnNvd2FuaWEgeiBiYW5rdSBvcmF6IFVF
LiBNYW0gc3RhxYJ5Y2ggS2xpZW50w7N3LCBrdMOzcnp5IG5hZGFsIGNoxJl0bmllIGtvcnp5c3Rh
asSFIHogbW9pY2ggdXPFgnVnLCBhIHRha8W8ZSBwb2xlY2FqxIUgamUgaW5ueW0uCgpDenkgY2hj
aWVsaWJ5IFBhxYRzdHdvIHNrb3J6eXN0YcSHIHogcG9tb2N5IHd5a3dhbGlmaWtvd2FuZWdvIGkg
ZG/Fm3dpYWRjem9uZWdvIGRvcmFkY3kgZmluYW5zb3dlZ28/CgoKUG96ZHJhd2lhbQpKYWt1YiBP
bGVqbmljemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
