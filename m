Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36190EB64DC
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jun 2023 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwb2ntlmVyeQR1ZWdKqrIvzlYdKE7pwJBdCNbox+krk=; b=gEk29AVdbXJr9A
	+ewbbYHQIT72H798cuC3XSnbv7L07wPQCYfGgRs49rNLu5QneDkQuJEx20Ox45D7A9DvMqlbUZsRY
	zufFgHt0iaVatX+hTYl5fc5tkBcQrbzLPuDAMEYExarl4fmCbMbGk/XouKLOR0irRJZ/h/FWL/LmG
	5X/ZZlKy4IusRT0+V0cIv/OAAYxAA+6x7w7cczMgliQTifaJnaTZ94WL7io5S5K0aZvkNblicUnWS
	r1nYQjRC090J6uNe1ylJhM2eXKfgyIOcuhkx21C2nDpuA3O0MdZJBEzCBNLOIgN1lEwyXK2XUBvop
	nNl17xFMBRMREdY6tvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDRbN-008DNq-14;
	Sun, 25 Jun 2023 15:24:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDRbK-008DLs-19;
	Sun, 25 Jun 2023 15:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rEYR7w637MKACj0VcVjJmrVd7z9dR5MqsO7bziZOnys=; b=Zka+/d1c0fkky2PBfw5ZEw87TE
	2PPk/GHnpdKe2feMmn4A/8ZyOlzgY2LJdVmRdjsocAsHeigLFwg9vwA5qoPC49M9QkSFo2RcTMkve
	ULzOTMxZjsvxmKzKs5uo0EGI9oYdTI+kMA1hL4LpbHLqQhifZSE/pwZmekc6zcD0RSB8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qDRbC-00HUOf-L0; Sun, 25 Jun 2023 17:24:22 +0200
Date: Sun, 25 Jun 2023 17:24:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rogan Dawes <rogan@dawes.za.net>
Cc: Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>,
	Marek Vasut <marex@denx.de>
Subject: Re: Trying to boot mainline on Wink Hub v1
Message-ID: <f2570cf9-d01f-431b-832c-deae7a8f4c61@lunn.ch>
References: <CAOYdKdhscu_NDetiWDgm7bqh-Tf7kqGMHYOvOE0sQh2dU3t64g@mail.gmail.com>
 <CAOMZO5AZQ1147K8tD5e0fJ680CtdDBWk1eMN7n9rVWtJX06W3A@mail.gmail.com>
 <CAOYdKdhuVbzavb9CJYqOLXX7PYCbOGzmeUg2eTgF1saTviCo-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOYdKdhuVbzavb9CJYqOLXX7PYCbOGzmeUg2eTgF1saTviCo-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_082430_496841_89A3DE27 
X-CRM114-Status: UNSURE (   9.83  )
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

> I *think* my problem is that U-Boot is not aware of the device tree,
> as I have been passing it as an appended item to the kernel, thinking
> that U-Boot was not Device-Tree compliant. Consequently, it is unable
> to patch it with the contents of the mtdparts environment variable,
> and hence the kernel never knows to go looking for the mtd partitions.

You should be able to fully describe the MTD partition in DT. For
example, from arch/arm/boot/dts/kirkwood-dockstar.dts.

&nand {
        status = "okay";

        partition@0 {
                label = "u-boot";
                reg = <0x0000000 0x100000>;
                read-only;
        };

        partition@100000 {
                label = "uImage";
                reg = <0x0100000 0x400000>;
        };

        partition@500000 {
                label = "data";
                reg = <0x0500000 0xfb00000>;
        };
};

You can then continue with appending the DT blob to the kernel. All
the bootloader needs to do is load the kernel.

    Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
