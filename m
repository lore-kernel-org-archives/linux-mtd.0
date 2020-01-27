Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0B5C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 15:46:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2A620661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 15:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GH0pWAYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E2A620661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1/5+n6VjjLsm4z0eVL+TwVdRhZq6gH+ivhi2rEsmbk=; b=GH0pWAYgZz+UTc
	o4kxfCVetPjEAhcOJBFcY0F4HeOCw9JiIlTlg+u5I2P58iFHqqvio8nwnLC9uAz82nCtE+DhHp+jX
	k9+yXsfHXrkPbbEoPvIYdfdHLHn62YlfYu4Utbc/zED2yDrpt1GUE1g0M7Q09+RlpMQ2wW7uThoWK
	tGa2+GDBA1T1C0KlShud2ZIyZqNuBbW5RjvKxgccGpaTjTw0GXGLSltC/iTsUFXSudaGmN55faVJM
	1TDuNoyI70BRx1Cqu9XDv9EMVIlc/NKi6gdlhbHEPPQ7gUrpQ9iqgjIMVAnGaiHctRcZ8zt7tarX7
	rclA2YC1Y6cGrxdObeBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw6aR-0007sk-7b; Mon, 27 Jan 2020 15:46:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw6aN-0007sQ-K4
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 15:46:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D655228CFD7;
 Mon, 27 Jan 2020 15:45:57 +0000 (GMT)
Date: Mon, 27 Jan 2020 16:45:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: How to handle write-protect pin of NAND device ?
Message-ID: <20200127164554.34a21177@collabora.com>
In-Reply-To: <20200127153559.60a83e76@xps13>
References: <CAK7LNAR0FemABUg5uN5fhy5LRsOm7n5GhmFVVHE8T57knDM9Ug@mail.gmail.com>
 <20200127153559.60a83e76@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_074559_919848_747BA12E 
X-CRM114-Status: GOOD (  26.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Jan 2020 15:35:59 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Masahiro,
> 
> Masahiro Yamada <masahiroy@kernel.org> wrote on Mon, 27 Jan 2020
> 21:55:25 +0900:
> 
> > Hi.
> > 
> > I have a question about the
> > WP_n pin of a NAND chip.
> > 
> > 
> > As far as I see, the NAND framework does not
> > handle it.  
> 
> There is a nand_check_wp() which reads the status of the pin before
> erasing/writing.
> 
> > 
> > Instead, it is handled in a driver level.
> > I see some DT-bindings that handle the WP_n pin.
> > 
> > $ git grep wp -- Documentation/devicetree/bindings/mtd/
> > Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt:-
> > brcm,nand-has-wp          : Some versions of this IP include a
> > write-protect  
> 
> Just checked: brcmnand de-assert WP when writing/erasing and asserts it
> otherwise. IMHO this switching is useless.
> 
> > Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt:-
> > wp-gpios: GPIO specifier for the write protect pin.
> > Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt:
> >          wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
> > Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt:-
> > wp-gpios: GPIO specifier for the write protect pin.
> > Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt:
> >          wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;  
> 
> In both cases, the WP GPIO is unused in the code, just de-asserted at
> boot time like what you do in the patch below.
> 
> > 
> > 
> > 
> > I wrote a patch to avoid read-only issue in some cases:
> > http://patchwork.ozlabs.org/patch/1229749/
> > 
> > Generally speaking, we expect NAND devices
> > are writable in Linux. So, I think my patch is OK.  
> 
> I think the patch is fine.
> 
> > 
> > 
> > However, I asked this myself:
> > Is there a useful case to assert the write protect
> > pin in order to make the NAND chip really read-only?
> > For example, the system recovery image is stored in
> > a read-only device, and the write-protect pin is
> > kept asserted to assure nobody accidentally corrupts it.  
> 
> It is very likely that the same device is used for RO and RW storage so
> in most cases this is not possible. We already have squashfs which is
> actually read-only at filesystem level, I'm not sure it is needed to
> enforce this at a lower level... Anyway if there is actually a pin for
> that, one might want to handle the pin directly as a GPIO, what do you
> think?

FWIW, I've always considered the WP pin as a way to protect against
spurious destructive command emission, which is most likely to happen
during transition phases (bootloader -> linux, linux -> kexeced-linux,
platform reset, ..., or any other transition where the pin state might
be undefined at some point). This being said, if you're worried about
other sources of spurious cmds (say your bus is shared between
different kind of memory devices, and the CS pin is unreliable), you
might want to leave the NAND in a write-protected state de-asserting WP
only when explicitly issuing a destructive command (program page, erase
block).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
