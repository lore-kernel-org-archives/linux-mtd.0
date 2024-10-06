Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5213BCFB422
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Oct 2024 01:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TATadsmIDwnij3pQjeJi1BNupZF5Ve/ApVBwJzuHsHY=; b=LrPtpaWxwjTYRn
	K/Hw0oRZUjymAVcnWyt+NaTrn1YEhF9gRZe3TwqeDOeJPj5KGbvMwnvK/VHKR23M2MzApwdQlNurV
	xA3/qSW2I4I1BY2DHGNzO6hev7o1oVGML44Sm9jzbw8H0puJZkeUzvphGqPJpkLlh8dpVXkCd8qL4
	aYwiQAU7rt22pejYuKnQ0ow1ibuIoDuYzpH5CA/ciOW9iVhMakx+nHu4z6pzPPYIAaHAbYLyNuWP2
	nIw0a+JulcTnsGAWjiiVViT4G1Y4mO922zcanLqc14Olfs83Erww4Y44VKFq39THhMq0rRb7InpJX
	ChdsGSic8HV8mbFArmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxGWD-0000000GQ0o-1kHP;
	Sun, 06 Oct 2024 01:57:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxGUs-0000000GPK4-3XfT;
	Sun, 06 Oct 2024 01:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86C2A5C55E1;
	Sun,  6 Oct 2024 01:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442DCC4CEC2;
	Sun,  6 Oct 2024 01:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179745;
	bh=/4L+Waftv30hJTd8pHAaY7MDs2ik61gNjRPrwI78SK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHJhnSlcDypCxKXc9/0e8sSwcsPUcNs5OrzLmNK372VoYuGepvQT+MeJe7gZxz24S
	 Td8OetlGIX6VQqxeo+oLpBwCwYCr2xh0kr7HWG2dWxJwS9C9I5+F0Ozm3XgnvgOi6R
	 eyo7cMIiqgZ5im6lRwsEC9egd6IBXTkhxhVOAfSeJ6SqQ1OAUWk36taYJoiLw9dpJ9
	 1TD2kMI24gaTyunNoaEycYfyV8WJ6EL2ZaaiP5SsbbYsVWCcKHV7TrlwKb7lUEYqTY
	 l48kzmdHzTLb/dBfgaSN3gUHXAeR3ENezjiB4lZZ+5JAICFVxSM/ycZNnlcwg/pUoP
	 0Njb/XOnUh7ew==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-gpio@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org,
	audit@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	dccp@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	drbd-dev@lists.linbit.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-leds@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	tipc-discussion@lists.sourceforge.net,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-wireless@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Date: Sat,  5 Oct 2024 20:55:35 -0500
Message-ID: <172817973322.398361.12931602917664759173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_185546_947525_B5841342 
X-CRM114-Status: UNSURE (   6.74  )
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


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[24/35] soc: qcom: qmi: Reorganize kerneldoc parameter names
        commit: eea73fa08e69fec9cdc915592022bec6a9ac8ad7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
