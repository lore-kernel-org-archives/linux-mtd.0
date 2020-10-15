Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0642C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 07:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA6022243
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 07:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b7DKqqaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA6022243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bku3Dekuq2++otMskmlMfysW3dYGv63Y4hSPZLhj5JM=; b=b7DKqqaYO1nqwbdXZ/D81J4aH
	1xzPNjtuktLfIEnK7hIMKvb5qP4QKxK6LOQoUWIsQFxENia1oVpdyR0mnxd2ju8rG8+XO/3/3Wg8+
	7uYN1Rw9fOE8ZgIr2RZuD8bYW4Ex3toLujwJPJsNPH5sw9/bKaxVR4ZOsSxkprlyWrWbLh95MBlrJ
	rJkU4KbGoA5UaVXLiAXAu21SFk0XHBpZ8VonQRN0ke34odJYJWByRVMMAzAEoUjuAx+IZLPe5+jGZ
	a12LlsV9grjtG5+PTf0CX7TkaK5jI73sHaowOrJNoXPYOAiYIffMku8ZiEl3SFRmhl7lHoGeevvLM
	quWuaOdzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSxzw-0000yx-Cx; Thu, 15 Oct 2020 07:48:28 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSxzs-0000xz-Su
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2020 07:48:26 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7E64068B05; Thu, 15 Oct 2020 09:48:21 +0200 (CEST)
Date: Thu, 15 Oct 2020 09:48:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for
 IOMMU page tables
Message-ID: <20201015074821.GG14082@lst.de>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
 <20201011055258.22337d66@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201011055258.22337d66@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_034825_729645_7F7FC405 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>, Rob Herring <robh@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Jim Quinlan <james.quinlan@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Suram Suram <suram@nxp.com>,
 masonccyang@mxic.com.tw, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Oct 11, 2020 at 05:53:37AM +1100, Stephen Rothwell wrote:
> Hi Naresh,
> 
> Just adding Christoph and Jim to cc]

Well, a Cc doesn't help on its own.  Can you send an actual bug
report including the setup, warnings and error messages, a bisection
result and the usual suspects?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
