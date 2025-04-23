Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857C0C369D3
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Txhqq+SoU2ZpJCJQXd7aGapkVevRq1c8FH09lPA792w=; b=1eT1qGkkw9VOcD
	wlSeaD9N5iQmaKJztrQnk9WdBK/BaJoK4nUdRkqkJKWz0rZ42wH0E04t9qL3pcIdSF/N2hCqdF83v
	NFPpny4TRf8GYkjynN2l+PXw2OQx+m2cJqeaCkKSIu/IPLuRu72kN7HaUNz1nuK1B1gLue1YKcgLV
	0Ldae42L/tYEsq3TNvs5ULLVBcZ/8tsy2suNcyVXiyC8dugCMAdEhe46g7AASExDp4Fg9kAdhmOfT
	H10USFhm6c3nP9yUJ23TVL+fsdqjSuBh3ekLK2bZOayxcrNRiRmEQgBW7wHpCXWrzRVk8NNiObJJj
	fAOvHsQaOwbRsph1TEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UCk-00000009S41-3ASu;
	Wed, 23 Apr 2025 07:07:34 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U0T-00000009PI7-3s6o
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 06:54:56 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 071531F92A;
	Wed, 23 Apr 2025 08:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745391290;
	bh=nvJn++qEslCDu+975uUp2+ZELhS1lD4myoKNsUrA9d8=; h=From:To:Subject;
	b=idSSLvGdfADvbTQf6zMXetjeLjNwH1dUdt1AllEMOtJ/TCs7/T+UqiZEKMVx4nXgL
	 U5mnHLdf8LRGIMBgf7uyET/eathXepq5PfGreHp/Ds463HlJMgRHs8aQHnv9Z1imv+
	 JG4tqCL8zB5UuxA9Opi+omJEMumttf/VrwIforViTnkxxSBv/57rIt8V+VKljbWEDU
	 4Li8cvhJDU+wFdb0OsfbSCG6r/htxiKbpm/bSmaUHJpX5G2uo8NmEqG6ax6Ayz0YpH
	 GBYY6SOVJuivXOY+G88tR8JiOMKy6ztnJC+WkqcZFrFE0+DHGlMKRdJjturJqQPoqD
	 FgeoqVhqZWNdQ==
Date: Wed, 23 Apr 2025 08:54:46 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Matthew Wilcox <willy@infradead.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
Message-ID: <20250423065432.GA4811@francesco-nb>
References: <20250408082018.GA23886@francesco-nb>
 <20250422175409.GA877874@francesco-nb>
 <aAhAylotNK_zHl0C@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aAhAylotNK_zHl0C@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_235454_844011_BF2AD46F 
X-CRM114-Status: UNSURE (   9.97  )
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

On Wed, Apr 23, 2025 at 09:22:18AM +0800, Herbert Xu wrote:
> On Tue, Apr 22, 2025 at 07:54:09PM +0200, Francesco Dolcini wrote:
> > 
> > On Tue, Apr 08, 2025 at 10:20:18AM +0200, Francesco Dolcini wrote:
> > > I do have the following regression on single core system using UBIFS,
> > > dual core seems not affected, any idea?
> 
> Please try this patch which will go in today:
> 
> https://patchwork.kernel.org/project/linux-crypto/patch/aAW8E9NrKWq1Xk2w@gondor.apana.org.au/

Yes, I fixes the issue, thanks.

Francesco



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
