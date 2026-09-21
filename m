Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8071BC982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yb+XX1n0Sr97Yj8PGRboHSMfcyLhhAXSp80CiN6uCzg=; b=IoRHT2opj0DcWJ
	le4TLhSPevCCbbg8hDsabteG2ZIgnGWFR/x9smhkWPHvftTj7sfECG2mgk3uJsaXaYys5lfO9usKE
	JzDvQBB/J7HEUUUyRbTx4RJYNf5NHHJgn3Suo/QQCjpqwfTBV5hQ+lu52ZdvaR8b0r6uTIvSqTfp3
	8HRKEYHYWLIMYJIIK+1cKPnYjHboswbv0VpUdGVJe+214XZAY47t0phVc6riy90rM6z2c3K/f+761
	be3ppz8RYjJ8+SM7M4Uu6AtnJEwr4gSSFFWAXbaPW2VYxt8yn9qJtZOwPu6yUNAItXpolzze0H8kL
	J9w4crFeidnsTEP5aMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZDc-00000001Jzn-1nG5;
	Mon, 21 Sep 2026 08:17:44 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZDa-00000001Jyx-2CGr
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 08:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zSWyoAbSBO40r69UB/PnNFlKMJoroqefBV/j+DeU+Zw=; b=C2h1OsK03KGlhSbTI7LgZ3P+pM
	Ed4UR8d7g79BYj3sgdok4vQmMAtEMc8r9gtYaeG3dJhWdl5vFPI/bLItmurR8Ilxmk0o8N+fsWfiK
	+SarJzYh3wctOaArr16IVF6hdJCvaOl18DWrUZrksuB8M1J8t9nWCgrQMXHtBUT1aEwOZNrH8ks7G
	ihNjFoVIYVMWDxo5qgjs+6JMdG9G6XgLew7+QfGMxPl2EmrFBgq3pr/K8XOIZ/wAbZ47B/S0UktY7
	y174rImeJciQo0fpzndPKeGdReRaaHuEKJ7bm3dXDrgDvdp4XqMqbvwRWOyfFUJDBa+cDsNFrW8Ij
	4kdkUNdA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8ZDK-0024F6-1j;
	Mon, 21 Sep 2026 08:17:26 +0000
Date: Mon, 21 Sep 2026 01:17:22 -0700
From: Breno Leitao <leitao@debian.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kees Cook <kees@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: use assign_bit() where applicable
Message-ID: <arDoApVtVH4yXbKY@gmail.com>
References: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_011742_569353_785CF657 
X-CRM114-Status: UNSURE (   6.29  )
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

On Sat, Sep 19, 2026 at 09:08:06PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
