Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B24C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fS/235ZbanSFhGQvTPwRPamnOcmDMTCPi7GgwyQXbY=; b=nfmQ6txukdpSff
	9bHL5ToGIrXZ7ysfT3vymhwWFgOKutVwR2Fvogts1jD+t5w4f7N+1Fc7iiCUttqwdrGadmdP7sTHJ
	6sE+DVdpMRVilRSOTB98HY3hyzLxRcexy0sIzs9mnrnFsEJ2V2yRkXAB24bcMYK2FaAUrG+faCPKc
	/pwOsud0qDrZLJJzGRKPC+5xaSh7YHcSpSQ0SQ727iRl3zMWjwUdw1nh7ZkSDjeAFCBsUPjIDw4y6
	kXamOSEcu74k8K190J2xqHY82IoiH7yS0f02Sxes0j4R60UZKrl3+JovPdZGUCyZSWiuq5OgZJciC
	+VzQftxJUsLSghzrVRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQDP-000000094i0-0SIV;
	Mon, 12 May 2025 10:16:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPYf-00000008xLA-3fDW
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 09:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C00761127;
	Mon, 12 May 2025 09:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A031C4CEE7;
	Mon, 12 May 2025 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747042488;
	bh=w58paniyZtCqV2wtIcE3EAeN7LrUtsoNYt39HAUVduQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tbajbUW78IyTN4z0SlV8ai34Qau8HaPSBbmS72QqKwBh8hUezo7G0aiz07N83Mmq3
	 MXpJTfpBVPaMW6yMhzcBbUIcAvTMGFdWZChj0jH7oyD0Q/y5oQiC3EwDabSCBq7cQu
	 GuhSWQN4Vlsr7/Id1NTFVA2/v3VzDQ5+0ORf4dEKE7sIVDArUGyiVElmpQcqpntRDi
	 QOLDmtggOsIzzTyxfIICI97sfJGM6SWQX/2cx1ONC7y99fV+uRjtcXCkb91ALd8G9y
	 BQLbKOFBFRNDtsh+r1iW/uGLQfOKYaRA6yFXYxFAriMfoPX+Ylvs6KUc1kSAUbA4Kj
	 b9Evr3OudGl6g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Luke Wang <ziniu.wang_1@nxp.com>,
  "broonie@kernel.org" <broonie@kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "michael@walle.cc" <michael@walle.cc>,  "p.yadav@ti.com"
 <p.yadav@ti.com>,  "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com"
 <vigneshr@ti.com>,  Bough Chen <haibo.chen@nxp.com>,  Han Xu
 <han.xu@nxp.com>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
In-Reply-To: <87cycep8go.fsf@bootlin.com>
References: <DU2PR04MB85678048FE8B475B1E323E0AED802@DU2PR04MB8567.eurprd04.prod.outlook.com>
	<10b40148-b949-442d-9d43-0db09517269a@linaro.org>
	<mafs0zffo3gea.fsf@kernel.org> <87cycep8go.fsf@bootlin.com>
Date: Mon, 12 May 2025 09:34:45 +0000
Message-ID: <mafs0wmam6ukq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Mon, May 12 2025, Miquel Raynal wrote:

> Hello,
>
> On 07/05/2025 at 09:43:25 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
>
>> Hi Luke,
>>
>> On Tue, Apr 29 2025, Tudor Ambarus wrote:
>>
>>> On 4/29/25 10:03 AM, Luke Wang wrote:
>>>> Hi Pratyush,
>>>> 
>>>> I'm following up on this patch series [1] Avoid odd length/address read/
>>>> writes in 8D-8D-8D mode. While some of the series has been merged, the
>>>> patch 4-6 remains unmerged.
>>>> 
>>>> In fact, we also encountered similar read/write issue of odd address/
>>>> length with NXP FSPI controller (spi-nxp-fspi.c). Currently, we handled
>>>> the odd address/length in the controller driver, but I think this should
>>>> be a common issue in the octal dtr mode. Was there a technical reason
>>>> for not merging the core layer solution?
>>>
>>> I guess I stumbled on those small comments and did not consider the
>>> greater benefit of taking the patches. No one cared and we forgot about
>>> it. Please address the comments and resubmit.
>>
>> Yes, it should have been a simple next revision from me but apparently
>> it fell through the cracks. I do strongly agree that this should be done
>> in SPI NOR, and not in controller drivers. So it would be great if you
>> can respin the remaining patches of the series.
>
> The fact is that we will have octal DTR support in SPI NAND as well at some
> point, hence a common solution would be welcome as we will likely face
> similar problems when performing these unaligned accesses. I don't know
> how feasible it is yet, but if we have a fix for SPI NOR, we will need
> something similar for SPI NAND.

The common solution would then probably be in SPI MEM? Since you need to
make sure you don't do an out of bounds read, you need to know the size
of the flash at least. That is recorded in the dirmap operations, so
perhaps we can have this logic in spi_mem_dirmap_{read,write}()? Haven't
thought too deeply so not sure if it would end up being a good idea.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
