Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA84C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 20:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4ED217F9
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 20:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOnU6EUy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4ED217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnq5/l+qPd4mtdalblU648+7puHsPnqe/2Mz7qJou5Y=; b=OOnU6EUyqyKSCk
	5mDj0zpRDUxRFtzpf84zNKNE5QnNjmNSCJh99itxEotyCQ0VN2VYbRgAGDrAGrMVdLkMTFvtIuLVN
	jDzmDZnyJOG2RwlHb1KQv6Wk2cAetoSI2oKFfq2k6lTp7qNeZ1Da0/C1XKRm/Oo3F3M6efJO/KivB
	C6dUioTisww+9stjfv+VxtR/fqwcEu2fa9L9JRuRdj/NPtvOWHFLcVQgWsJK0ygrQQWtBVjejFQ7A
	eCV9485oG9e4M1Jp0jnLLBEewmi5oevnVXfOtm1FqYfOgdv0eCM3GzIThwFaKBilF7NC98AUtHgqK
	0avbgdTGy+UuOM1YEjeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvp6b-0005vx-KX; Mon, 18 Feb 2019 20:01:33 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvp6P-0005sh-Oj
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 20:01:30 +0000
Received: by mail-ot1-f66.google.com with SMTP id g1so30245837otj.11
 for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2019 12:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y3fBCzVJ+IFAl2IKW///XvVmMSodPHdurOmaqMNQlQw=;
 b=LGYu4C6E15iZa8ci49UjitVH3Ba1SNSeie/fC1PJrC5yQCqAtL/LfX0s+IFRwDrl8b
 OcgvcGg4YdAdGVgte/NvuLMRfEALYsV2DTt4NMQtxhlfRTBf+YTxPqhZ0Sgvwv9KqUjZ
 wiJN+wBi30v5fNUm349mBk75dHWKETnckLgBxRxp7xc1ixYwAKQ7bzLPPyy+A46P0Pt0
 ZkcZBdGHtynURp0DB35wtH221NMhrwxBUFpA1CZBuR7xLlbyisMkkrQtToG7c2LxdeuS
 UWnJCdDP28+f1Gkv7lmAeQsj283oWDOeC9tmfZyIdOpxIzoHWbwByfMxIZyJx3z9IRjJ
 +h0Q==
X-Gm-Message-State: AHQUAuZC3ESdh6U3wNKheMDV0KaGZviPMdhY3NshSo4DRQO+MoLGRm8a
 2gbSuM/CM5Gx9gnZtMu9lw==
X-Google-Smtp-Source: AHgI3IY1ToZXEDJTkjotJ6MF47OA0T72HTuLMZuH0FXGF+bENDzzOp3azBkgtpg04QWcHYfiaufiHA==
X-Received: by 2002:aca:4cc3:: with SMTP id z186mr323944oia.90.1550520081033; 
 Mon, 18 Feb 2019 12:01:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 88sm2901580otx.57.2019.02.18.12.01.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Feb 2019 12:01:20 -0800 (PST)
Date: Mon, 18 Feb 2019 14:01:19 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 08/10] mtd: rawnand: denali: decouple controller and
 NAND chips
Message-ID: <20190218200119.GA27213@bogus>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-9-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1549955582-30346-9-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_120121_945201_D7CBEAA9 
X-CRM114-Status: GOOD (  17.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 04:13:00PM +0900, Masahiro Yamada wrote:
> Currently, this driver sticks to the legacy NAND model because it was
> upstreamed before commit 2d472aba15ff ("mtd: nand: document the NAND
> controller/NAND chip DT representation"). However, relying on the
> dummy_controller is already deprecated.
> 
> Switch over to the new controller/chip representation.
> 
> The struct denali_nand_info has been split into denali_controller
> and denali_chip, to contain the controller data, per-chip data,
> respectively.
> 
> One problem is, this commit changes the DT binding. So, as always,
> the backward compatibility must be taken into consideration.
> 
> In the new binding, the controller node expects
> 
>   #address-cells = <1>;
>   #size-cells = <0>;
> 
> ... since the child nodes represent NAND chips.
> 
> In the old binding, the controller node may have subnodes, but they
> are MTD partitions.
> 
> The denali_dt_is_legacy_binding() exploits it to distinguish old/new
> platforms.
> 
> Going forward, the old binding is only allowed for existing DT files.
> I updated the binding document.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  39 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/denali.c                      | 453 ++++++++++++---------
>  drivers/mtd/nand/raw/denali.h                      | 117 +++++-
>  drivers/mtd/nand/raw/denali_dt.c                   |  98 ++++-
>  drivers/mtd/nand/raw/denali_pci.c                  |  30 +-
>  5 files changed, 500 insertions(+), 237 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
