Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36E8F327CC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csDILsv10Juesh7bdUw3w56vm4TOaYAHCXjbW3KIzXE=; b=NxWduQ11FcEJmI
	WigCyV9XvOUamdj9d/35AiJ7/l5J1QFbJ34ESIEuu0XA4vTDzsSAaeCgS5/R3t+vNHZGxyzGPzh0f
	26RKV0V+S0G3UhahmdBVezQn/WHB+seoLeUGguMSzKe9bpfFf9sMgiY1P5TQJqaH5dqT82Eaxqg5w
	wouaziTi0P0DvbTkjo3uqilq0yWvrY93XzUWhOkfRqyrP6Hrvpq4IJWwpwokesz1JMmoWvHLU0aR0
	dveZxsWBxzTJGgM51MlT0CWYLygcM5AJbrlpDLnx2vP4c2kOy5cQK/O0T5TKlp5gnOQZaL9k9rXDT
	nscCNZAqcprcAJeKVsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7L4-00000008KBr-12ry;
	Tue, 21 Apr 2026 09:24:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7L1-00000008KBk-0Rcg
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 09:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E22560018;
	Tue, 21 Apr 2026 09:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D54EC2BCB0;
	Tue, 21 Apr 2026 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776763449;
	bh=z+h5Nnwo0xO4Chm3zN/QoyZZPeeIi/CZAFWRlbq4U+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aWGB1ZqAhJB5fE0pCS22Z40rhlnNYtTfb1tpD6gC5YbQcAGPc80XmZq+aZbO6NkcM
	 DhO284RZmDJj+aj8PoJNrZOnPqRBBVaBf9x1WbbbEH5oUkUHvJYwd7BpnGrzEBQdJl
	 ul/WRlXC5lS0JYHVZ26J8dF6AbXvsK5VHj1FSnDhA4eHo59KzzlIja8YFZS4BU+4hb
	 etCY7cFsrX1/ZdZq+0KLT+zGe98Ss5FlChMU0awBBRD6BLb8y8qCMrLBxeKvmeGQSh
	 65MgdgNF4XM4QimOPWwcxARG6z0PQCIxy62KKSv06iezOY150UHR84092OivE5kwHT
	 3M0CyKhpGCWlA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav
 <p.yadav@ti.com>,  Michael Walle <michael@walle.cc>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
In-Reply-To: <87jyu07olj.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 21
	Apr 2026 09:35:20 +0200")
References: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
	<87jyu07olj.fsf@bootlin.com>
Date: Tue, 21 Apr 2026 09:24:05 +0000
Message-ID: <2vxz4il47jka.fsf@kernel.org>
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

On Tue, Apr 21 2026, Miquel Raynal wrote:

> Hi Tudor,
>
> On 17/04/2026 at 15:24:39 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>> Sashiko noticed an out-of-bounds read [1].
>
> [...]
>
>> Cc: stable@vger.kernel.org
>> Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugfs")
>> Closes: https://sashiko.dev/#/patchset/20260417-die-erase-fix-v2-1-73bb7004ebad%40infineon.com [1]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>> We shall assign a CVE to this. I'll look into how next week.
>
> They are assigned automatically to every fix, no?
>
> If spi-nor folks want to ack, I might take it through an mtd/fixes PR.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Please do. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
