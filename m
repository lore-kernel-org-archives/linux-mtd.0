Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DE3C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PO7gtFatTu7Z77GWDdh+NJwoUFVV2OMfKoCQnI+Jp4U=; b=jAYZExtAr0INIb
	0RPF/MlNpj3x3qyfhkfk6vABFOiAkt+83iv+Sb78pCCkUsaV/gnSSePizRrC1eScGOM8FW62jgk74
	U0o0w1B+E3nCT1gGdq85RWb7Qipq5sR2VRyoW2diCzdl7tOrp6tt9RRQXIshT2B/TwxE+h6xME74T
	YLrVmO51s2i5hBg3+BC+pZUvatHWHrBqsmIyOfILbR82liQ0MdCRKFgnHj4hlJgjgtxN7KacGdj0B
	es2m37WnzxBLW+XOCUJStKoYd4ccrl09fAInWTQG3toCBhZ7AKW7It/9IIK0JKKesn7MoIpiNYNiF
	rljHSjP5lZN3hG77wrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owm3h-005AA9-Kl; Sun, 20 Nov 2022 15:16:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owm3e-005A9A-Nv
	for linux-mtd@lists.infradead.org; Sun, 20 Nov 2022 15:16:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA3A560BFC;
	Sun, 20 Nov 2022 15:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846CDC433C1;
	Sun, 20 Nov 2022 15:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668957392;
	bh=/UximhifsHnyMuRvxnsCs//tzMn6Vtl9erSlkKEjSCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYJngp+pH/YWXZX16wFxFDPZP7sTEzDRTZv8dV0eJgkJSHD+ylQH7bMq0E7Y1YrwD
	 rlu/dlUXBx700+9aOFsmfqP546lSRTxNdnpAPQGPEeLpaRBYHebEsbmpXy4gJPu+jv
	 ed9cy8ClWcpq9X3N01QxLVbVREhXrT6NsOuftGrrqrBFyIc6zzwGV8uo8wTjl5lXEa
	 o7clSrLxmZSP0qcFDyYqWnzVfQ0bj5/b6p/3QtZhKDASYYu7CcfoQHH+mfjtgE707t
	 zmqx1pb0EAjnN2NqLCySpyDbX28PeioFwO0X2/27eWRUrueJvRB6lWQ9S1gsXK61Hk
	 H5CY3TRoB79lg==
Date: Sun, 20 Nov 2022 16:15:40 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [RESEND PATCH v4 1/1] mtd: spi-nor: winbond: Add support for
 w25q01jvq
Message-ID: <20221120151540.mqovzmbabnstul6y@yadavpratyush.com>
References: <20221111060530.2201084-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111060530.2201084-1-potin.lai.pt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_071634_836552_4F615E17 
X-CRM114-Status: UNSURE (   7.33  )
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

On 11/11/22 02:05PM, Potin Lai wrote:
> From: Potin Lai <potin.lai@quantatw.com>
> 
> Add support for winbond w25q01jvq chip
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
