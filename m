Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75426C0219B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lccjIECls1jTPzbz4Cc68+4Nf13WOrqjezYOvNQzpDg=; b=tzNybU34Fseaec
	nKK1ZrJLsA3qgxkcSG9nX3rc9TqjKoxI8L3EHRUoju2Sg2nLeeRmH2HrnbuNP0+wDteoRz0jITNV1
	OTRGAyTO9LyPz3nha0RIFd+eV92Vdaw0hxtOT3QfNKkEf9iX2LOYq0e7VOeFREmVgBb2HjZ/V2n/4
	AN+EuU3gg+2TlFEzuCGhDOj0oRMNgYvnBgHwQS4v/U0kchCEfNMvq50x84f/xHi6qQfxrExOiGslm
	ieaugU/0Fm5aWzX4LqeeGD7L835cVJD/wifsrszclSaQ+EkC0IemeXMPvQyoBMvfYjdZfWtqsE60F
	/4uq7UOs0YUr3LlV2JBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxoz-00000005M41-2wnt;
	Tue, 11 Feb 2025 21:29:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxox-00000005M3a-0c2S
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 21:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1FAAA40C6F;
	Tue, 11 Feb 2025 21:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA14BC4CEDD;
	Tue, 11 Feb 2025 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739309370;
	bh=NaUS/xid8E3zDqwf+U421yyey7c36cXUSga07rj7yNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5o8gSPfQq4IgyVNNnH17NgMRkO8e4gyfCOrL/4gYWEoThBhBYQyKJ5EyvYgel9BD
	 eZziKOsCNPSFb5c6YPFys+0z1OyUjJzXIlJDNDgzLCViFLQX+qJCO4hhOLEJbdiEAl
	 svknN0H4vkcntQ+K3SdJAqFt+4kK7tdAa/06eexV98C1mLaqfvEcjQTZKLYCZct0Sk
	 fy8sFJK71nx5PS4aKFrVhxWIvVTPQE6FeMMioDRtIT0jAoDHJ2JG+snexxBQkVDU+o
	 AiowVHT7aemYqByHqTwCPBozswKNo0Wpjf2rAWfO4RobedKU/ihnaCr9GUYWlne8V7
	 w2S/dWjbgKOIg==
Date: Tue, 11 Feb 2025 15:29:28 -0600
From: Rob Herring <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <20250211212928.GA1188800-robh@kernel.org>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
 <20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_132931_310115_C0E20313 
X-CRM114-Status: GOOD (  16.60  )
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

On Wed, Feb 05, 2025 at 07:07:28PM +0530, Amit Kumar Mahapatra wrote:
> The AMD QSPI controller supports an advanced connection modes called
> Stacked mode which allow the controller to treat two different flashes
> as one storage.
> 
> In Stacked connection mode flashes share the same SPI bus, but different CS
> line, controller driver asserts the CS of the flash to which it needs to
> communicate. Stacked mode is a software abstraction rather than a
> controller feature or capability. At any given time, the controller
> communicates with one of the two connected flash devices, as determined by
> the requested address and data length. If an operation starts on one flash
> and ends on the other, the mtd layer needs to split it into two separate
> operations and adjust the data length accordingly. For more information on
> the modes please feel free to go through the controller flash interface
> below [1].
> 
> Introduce new DT property to specify which partitions are concatenated to
> each other.
> 
>     flash@0 {
>             reg = <0>;
>             partitions {
>                     compatible = "fixed-partitions";
>                     part-concat = <&flash0_part1>, <&flash1_part0>;
> 
>                     flash0_part0: part0@0 {
>                             label = "part0_0";
>                             reg = <0x0 0x800000>;
>                     };
> 
>                     flash0_part1: part1@800000 {
>                             label = "part0_1";
>                             reg = <0x800000 0x800000>;
>                     };
>             };
>     };
> 
>     flash@1 {
>             reg = <1>;
>             partitions {
>                     compatible = "fixed-partitions";
> 
>                     flash1_part0: part1@0 {
>                             label = "part1_0";
>                             reg = <0x0 0x800000>;
>                     };
> 
>                     flash1_part1: part1@800000 {
>                             label = "part1_1";
>                             reg = <0x800000 0x800000>;
>                     };
>             };
>     };
> 
> The partitions that gets created are
> part0_0
> part1_1
> part0_1-part1_0-concat

'part-concat' doesn't work if you have multiple sets of partitions you 
want to concatenate.

I think you need something like 'prev-partition' or 'next-partition' in 
the partition nodes to create a linked list of partitions. Hopefully, 
you don't need both properties, but you do have to scan everything to 
figure out which ones are concatenated or not. For example, no property 
can mean not concatenated or last partition if you use 'next-partition'. 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
