Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41106C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Apr 2022 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tA1PmwbwTSFy0b8ifyq83Hz4RtLt6DMr6gecXMfZL4=; b=N+NPxp8E/e1Fgg
	gjFpzqcekUlaglFXhWBRRzi9Hi5A43D7m1wDzBu0z+aaftfxQHRnCxal/dxIZUnODgD+fzUhko/hb
	LU/XPJHJ2H00EW1ZnwVuh5iVRlNtww2HUUKD6q8hUh2eb7Tw+elcLm9+h+RadqpsQffWyFYmcvKEd
	GHy48xWHqmVWQIRV7nuuYAc4huCbreSaW6L0oBwpigH1PDzYk2Ng7Bc1Rl0lMJAAGEjKG5IJi9aYQ
	kjNJThvwij7ku1xvTWqi8fKmQ5C2b8upe9sWnqn0hRT49WmcR/AwJt140RHkSOdqfuFXtmRX8aB1x
	SaU85aJL7iVrhjvIL76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkqHS-00EgCO-Jp; Sat, 30 Apr 2022 16:49:14 +0000
Received: from smtp6.goneo.de ([2001:1640:5::8:31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkqHO-00EgBF-WD
 for linux-mtd@lists.infradead.org; Sat, 30 Apr 2022 16:49:13 +0000
Received: from hub1.goneo.de (hub1.goneo.de [85.220.129.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp6.goneo.de (Postfix) with ESMTPS id 94F3D10A330E;
 Sat, 30 Apr 2022 18:49:05 +0200 (CEST)
Received: from hub1.goneo.de (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPS id EFC7E10A32F4;
 Sat, 30 Apr 2022 18:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=georgemail.eu;
 s=DKIM001; t=1651337344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ec1glOe9cLci9Z+BxPODKQVarHyoiLJOtgRBzicod2c=;
 b=Mg2y3wAEIj1DEkXL+SsTo1rXdQSWP0Kwte/jD8Br/PKkLdwUiuUwfKac1vbcH8U9i5uy2r
 YjK0Jsrep/52ZRAop038Hz1Bem5eMP3//Hz3GXYNwaZ6JkvZ9j6Yn1Ilv54pL/rKIi8u2v
 PtNtAjCYL1Kyhm44dWM+kZPzjTpHXQR/v0123G/ttSoRCDdn/lMOOBfzc8oOJNHeSek8so
 Bnu1wyHi6UCI9k6aEiongd+tjFz2pQ9obevHQb4mRdARG993O2xuqxkeWxPwByRvPPJJR5
 +dVMvJmvWStQngr38RYrx1Veu6oiB1rJhH7zybWiCgkJ9bzDf/TizqU7whb7SA==
Received: from brot.fritz.box (ip-178-201-230-219.um46.pools.vodafone-ip.de
 [178.201.230.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by hub1.goneo.de (Postfix) with ESMTPSA id AC8AC10A330F;
 Sat, 30 Apr 2022 18:49:03 +0200 (CEST)
From: "Leon M. George" <leon@georgemail.eu>
To: Pratyush Yadav <p.yadav@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: support eon en25
Date: Sat, 30 Apr 2022 18:48:46 +0200
Message-Id: <20220430164847.144710-1-leon@georgemail.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <leon@georgemail.eu>
References: <leon@georgemail.eu>
MIME-Version: 1.0
X-Rspamd-UID: 4eee18
X-Rspamd-UID: 7a1481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_094911_809650_7A127615 
X-CRM114-Status: UNSURE (   4.69  )
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
Reply-To: "Leon M. George" <leon@georgemail.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi,

The original commit message contained typos and two of the paragraphs have
been reworked.
A 'Tested-By:' tag was been added.

Please consider this updated version of the commit.

kind regards,
Leon George


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
