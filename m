Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDBCD167E9
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnB3TtKuYo8Lve0MSkTQ9rvLnUR1FZpxU974nqsxXyA=; b=nswCX/H1BcwbKV
	HaDfVHCjsqkt37J8zhU7hluAINg76e0zyZusyI6JUHjdDuTZQjzJ/jrcdxa7h3C2c01K8P/4A93TX
	Ws9PDpbxM4FuZl2Fhm8LhXMOByUhNXvl3sZ/S7i3NvmW708MI9sYuEZFi1KuX20YnSjTgdbDidgGJ
	+ldyY5xseH8/bLqhXqBSi9KvPOy0rN4cwBu5clb6L6qTFKPboINDrrVNjcG0Z1+AJ0tEicEX4CXeC
	+OebPCDAkPfogCrlhu3iLfee/y0TBARgU45rhDPq/Be63o0/C8Dkoii2CSpYK5qgpaPsDlbNvIg9L
	BnqXVF5V4e0YglDvw/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8pq-000000021KG-2hJd;
	Fri, 09 Jan 2026 09:31:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8pm-000000021JX-0Vvb
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD2B643E14;
	Fri,  9 Jan 2026 09:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF3DC4CEF1;
	Fri,  9 Jan 2026 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951065;
	bh=MIKc/r+xHdWmFPm5tfPOSF/8DUVXSugT8lhEXzTHZJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q40zQrnRJ4ZiaZjp8Ifd5UpPCbKVjYlLrTsIQ0orcgazLQTW4QcfYH6oOf+XX8Ie3
	 BbIa/NyUXwjXwIQ/cUfx2kvjO3BvV7NZ8lSTkOVV9oBBWgyZc/nBWvlXJNqLRsccHD
	 UYIDSswxlpKAIaXGJOcU3l/JKYsxgOoUwGmkzY+9c66v02VOObq8XgJGF26dIZfW3s
	 iXS+m6ZDd6AElCvT7xzMhEJKAxqT/YH35/EfJ+3REQTYV99/jrmQRc6D36ytQDAQuy
	 s9/yYJKKuUQczsvSQt75YoQcD+qKGheHqVduKqDkuA7NSjGx2MSsDNwMigVvcAvI06
	 KmPN7WoNXcHzA==
Date: Fri, 9 Jan 2026 10:31:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: mtd: partitions: Define
 "#{address,size}-cells" in specific schemas
Message-ID: <20260109-crouching-alligator-of-ampleness-aca683@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-5-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-5-124a53ce6279@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013106_183670_3D32FE7E 
X-CRM114-Status: GOOD (  10.68  )
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

On Thu, Jan 08, 2026 at 11:53:14AM -0600, Rob Herring (Arm) wrote:
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> index e3978d2bc056..dc6421150c84 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
> @@ -28,10 +28,6 @@ properties:
>        device. On a flash memory with 32KB eraseblocks, 0 means the first
>        eraseblock at 0x00000000, 1 means the second eraseblock at 0x00008000 and so on.
>  
> -  '#address-cells': false
> -
> -  '#size-cells': false

That's probably separate commit. These partitions never used child
nodes.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
