Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6E7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=PSrFhErgBqZHPA
	NsWKaAs1+dRRP1WQTXKKWcEQKUZjrJ3CAst2H2/WwKgcyks32a6MPwN2tfzsB3Y3gUDZzh8NSgq4p
	wuxvCcH1xnyMi4MgccZl74T+KpfQUQstsbkkUX0uLn4SoCKhZgnyRa4Z3dkj0r10R9F7os9qB3ghj
	w/7iJkcfEJATadSz3Q0STvIKZ2VXCHqhicT1aR4pVldOMRgn/q0hYxmAIOmSZwbEIaxwPaTrN/hbN
	mjjy2Z77uQKyPBqa1BpD1cdHYtqycQ+tUPRQq3Xi2h/W7kZ6hlsdWm5iQqLoQJY8389qigCpkTfkV
	bSmdu3f5NzHDzyU0GxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu2Cv-002HKK-Js; Mon, 06 Dec 2021 00:50:17 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu2Cs-002HHw-Vt
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 00:50:16 +0000
Date: Mon, 06 Dec 2021 00:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail; t=1638751812;
 bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Rc1nM4JNILW/3bN9rgJqhqwvJrgrMlA+XDZkMADx/X5mZhfCbAo/eL15w1KBCKhK8
 Ct/76//G/alZpT6ZqrStBowWSBhAINNQP8G62CEScEJXVi5tg5U309y0TDR8VHA/ua
 e1kzPx+ir8fJIa0aVFWmvXm1HE65G2aEE+HSkhKl/KzWTl85RLJuhcoOha3tamqOKj
 kHBp7TsiQ//Sor8wKzsZQJhmtnUkbYRvLXLy5aPtSS2IuDIg03rQCbzM29hZBPVEo2
 YsDjYeWBnfI9p35LoWcDMHcR6kNYWFrEUModJgvTzLwtDNuatPvuPjwxU0CXqXnT62
 uUcFuNC27EEig==
To: Ralph Siemsen <ralph.siemsen@linaro.org>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] fectest.c: fix buffer overrun
Message-ID: <1ddc5984-0331-cc4d-5563-3b081e5ab51d@sigma-star.at>
In-Reply-To: <20211202144518.3133036-1-ralph.siemsen@linaro.org>
References: <20211202144518.3133036-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_165015_187948_B87791D3 
X-CRM114-Status: UNSURE (   2.37  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
