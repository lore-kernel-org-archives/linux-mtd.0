Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B64C021AD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZjKgU8+SxNwEkEFX7UaLKRRJogYvZJEfgeVPG77IAE=; b=aaBva6uSRVRim8
	LlYWrsEEEGzu/vS5bO3m8Cq5dTSc0NVceMaNi5EYnTFXzt4QL6D61Vjsxd0RfajzXQzzGHgshpIaU
	JKZ/C/w/mmTh8aay/kRbRDjGPxwuMC7xGQQ0yfZoFpiA05YnTqVQ5eBs5PGRQTI43p6xLMTIN37Yv
	sk3abDebUMZak3CSJkA3VgZc+QoZ9Cnt6HhxSueX1l8m7fFX4lv5Sjtr7CbMnVrx/bIDZ9BPASoMl
	xplj0DZZU7vMqr5q857bQyrcoWcSRKEzmmaWRjSHEeqoljl3UDjWdSgXVpt1gbCyEfJOHiukygnx8
	rpVK1/KNdwQC6pE1wUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVbx-0000000A58R-3H7J;
	Tue, 18 Feb 2025 21:58:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVJ3-0000000A2Ap-1CcK
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 21:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 664955C61B3;
	Tue, 18 Feb 2025 21:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC25C4CEE2;
	Tue, 18 Feb 2025 21:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739914744;
	bh=y27wX8vWpKgnYWddqTGYwQR4K1r03gutos/Zex7AhL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdNP8HF7uFB3J37nEtpFvf5FG33uwBaNeA1rWL5b42Iqed3vsaB8OcGv0wVf+SRvo
	 cwDoP52dfO2koaQfiTEtqQXoO2PokOmL2KqGVo+rf/NT6Vochjfc7sgKZlS1dMR/W5
	 Ankl8KpvENeT6VEEBVjc8SkKbN8lRCURoVXQ9LseWzHI8qW8jFXMMmdxjL5lq/3PYJ
	 U/6UUdMTkF9OsGiZbbzf6+Pkioz0EFgmVYxlC9fyy3D1sA2ZMSFCfREsY8amAf0SQP
	 AUJsIjPKlWNBQI9zdBraZacFWdLnghsSHfZG1/hQWdng72wFdKHfm43m5W5GlUUFXP
	 BkBfd1rICSbew==
Date: Tue, 18 Feb 2025 15:39:03 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, richard@nod.at,
	vigneshr@ti.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <20250218213903.GA1203860-robh@kernel.org>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
 <20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
 <20250211212928.GA1188800-robh@kernel.org>
 <87r043r2lq.fsf@bootlin.com>
 <20250212160659.GA3883406-robh@kernel.org>
 <874j0zqgps.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874j0zqgps.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_133905_384331_4BB2586D 
X-CRM114-Status: GOOD (  23.88  )
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

On Wed, Feb 12, 2025 at 05:18:39PM +0100, Miquel Raynal wrote:
> On 12/02/2025 at 10:06:59 -06, Rob Herring <robh@kernel.org> wrote:
> 
> > On Wed, Feb 12, 2025 at 09:25:53AM +0100, Miquel Raynal wrote:
> >> Hi,
> >> 
> >> >> The partitions that gets created are
> >> >> part0_0
> >> >> part1_1
> >> >> part0_1-part1_0-concat
> >> >
> >> > 'part-concat' doesn't work if you have multiple sets of partitions you 
> >> > want to concatenate.
> >> >
> >> > I think you need something like 'prev-partition' or 'next-partition' in 
> >> > the partition nodes to create a linked list of partitions. Hopefully, 
> >> > you don't need both properties, but you do have to scan everything to 
> >> > figure out which ones are concatenated or not. For example, no property 
> >> > can mean not concatenated or last partition if you use 'next-partition'. 
> >> 
> >> Out of curiosity, would the chosen node be eligible as a central place
> >> where to look at?
> >
> > Why would you need that?
> 
> I'm talking about storing in a central place all the concatenated
> partitions. Your proposal with "next-partition" works fine if we locate
> it inside the 'partitions' node, but I feel like the 'part-concat'
> instead was not fitting very well there. So I was wondering in this case
> if moving the concatenation of the partitions would be eligible to the
> chosen node, or if that's reserved to *very* few properties (and should
> remain like that).

You would have to solve the same problem as this patchset which is how 
to support N sets of concatenated partitions.

In general though, we add new things to /chosen very carefully. It's 
usually "things the bootloader configured/enabled" which I don't think 
this qualifies as. 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
