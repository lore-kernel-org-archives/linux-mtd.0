Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BF1CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtrYlAoq7q+5lspCosO0Jo4awzGJUT/g5RqAFfH0W0k=; b=MhEiDiDw9oAiMa
	V9mA8O4E0or5dteUkHoV6h5SSjLvoy6KhwdKTvxNFy2gwBIppzbDA986O/3w421SYhAm2+KtrbrmN
	vtQwUJLP7TgK4RdeWZAy1h1B+my+IoM7sdm6Ek1dyFwF2SpLrKKADZkn0jdty62mQrWVZzlfrV5bo
	G72G3McTvKLtJV/RLM98eyr3GVrOQagdkQ10wcwLz9ypGS2gGMqTw4alf1gHTQlMEMTH+k4BsxhM4
	86prmZDygpXZi1MH5+EzanK56+7AICIP6D2FQ3K7GnkWWIFnMPGL2R1LV5NtXe4tGQjVGJgoB9eGD
	DmbF23TugWpPvMFSaP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jE-00000008Bfz-0IaF;
	Mon, 18 Aug 2025 17:33:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Cm-00000007y4v-1gu6
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 15:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC2FD44A53;
	Mon, 18 Aug 2025 15:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A487CC4CEEB;
	Mon, 18 Aug 2025 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755532527;
	bh=xKr1rCiwUqIXI8QwBa6YH9SvSvUWEf9h67156BGMFsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hY1fTk78r5Mg09w6ATvOScvntsKcpQ54EuKLoMIs8bf9X+iNeXuEbj/NJQqO5NTce
	 hATud+7OJVFO1HgYyM5WvKm2fjJzT8CAdcxx5Vqbn1jHN8wsU0b/2KbgQoVfkQDipo
	 yNn7BxJ5nOuYiho2FBjDpGG43Nb7lGHdS7l48Yd9YaU8djK5ABINoUVQVsMGVn0Ue2
	 3ZxJCxpjxH0nTFaV7/ATdKYN7EZ4M8nOkvq0WwHgJcbh3BWw8PiFDKQ1nsfVscEk9E
	 6UHW44ocAaiPovndUTj0FFv/VnbYB5ud+KVJssZ3KMaU1yKC3stCVUKv+/6MLQiDzn
	 l7yHsXqTvFZvw==
Date: Mon, 18 Aug 2025 10:55:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-mtd@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	Binbin Zhou <zhoubb.aaron@gmail.com>, loongarch@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K1000 NAND controller
Message-ID: <175553252642.1298621.17529958231132657783.robh@kernel.org>
References: <cover.1754890670.git.zhoubinbin@loongson.cn>
 <e6568dad8dfc1c2fba6b31a1fbb113e82f8c5da5.1754890670.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6568dad8dfc1c2fba6b31a1fbb113e82f8c5da5.1754890670.git.zhoubinbin@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_085528_457676_A714EF24 
X-CRM114-Status: UNSURE (   9.44  )
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


On Mon, 11 Aug 2025 14:03:14 +0800, Binbin Zhou wrote:
> Add new compatible for the Loongson-2K NAND controller used for
> Loongson-2K1000 SoC.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/loongson,ls1b-nand-controller.yaml    | 50 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
