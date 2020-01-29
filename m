Return-Path: <SRS0=VDEF=3S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4794C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 15:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE15C20716
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 15:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fMNICCYE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE15C20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSJMbNRynn/QWLCmFLRkMhcSMQFDWaCV9ZqgDozTRcY=; b=fMNICCYEKv0Ab3
	tj5XA6Ai31HV/o75l4m1mL+5UYXToJCwtEsehQtR+dMrFVIbE8TWQPckw5+wX7yQy7NWoYTValibY
	X5eRnS9NFLQps6fdjKycjxYpnHqQiCLNURboldQd8viprggPQCT2d5Z2U/4b3vNoluzBJAezkdttD
	OBXBRzskKlAADYNr/rHJ+9X65WaQb3aqG0iJ8ZG+fYCHJiMsWuQyEyOt2AM5xJLqHhBWlJ3wm8rNH
	G1S2w/nPLEPOXy6zyJXyyYat7coY4m/Gp/NTet4OzXzVINt3IV3tuDOZOxK4cuiwYjW8dvXquIyBx
	63Ausn25mY3YalZ1vZUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwp68-00068m-CX; Wed, 29 Jan 2020 15:17:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwp63-000686-N4
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2020 15:17:41 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2F164293EDE;
 Wed, 29 Jan 2020 15:17:36 +0000 (GMT)
Date: Wed, 29 Jan 2020 16:17:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: How to handle write-protect pin of NAND device ?
Message-ID: <20200129161733.004183ef@collabora.com>
In-Reply-To: <20200129160045.3dc451d8@xps13>
References: <CAK7LNAR0FemABUg5uN5fhy5LRsOm7n5GhmFVVHE8T57knDM9Ug@mail.gmail.com>
 <20200127153559.60a83e76@xps13>
 <20200127164554.34a21177@collabora.com>
 <20200127164755.29183962@xps13>
 <20200128075833.129902f6@collabora.com>
 <CAK7LNAQyK+jy4pm5M5z58uD5Zdv95Day6C6D3Gwvpv2C4Vh53Q@mail.gmail.com>
 <20200129143639.7f80addb@xps13>
 <20200129145336.66f840ea@collabora.com>
 <20200129145950.2a324acf@xps13>
 <20200129154926.50e955e8@collabora.com>
 <20200129160045.3dc451d8@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_071740_018485_41861271 
X-CRM114-Status: GOOD (  44.39  )
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

On Wed, 29 Jan 2020 16:00:45 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Jan
> 2020 15:49:26 +0100:
> 
> > On Wed, 29 Jan 2020 14:59:50 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 29 Jan
> > > 2020 14:53:36 +0100:
> > >     
> > > > On Wed, 29 Jan 2020 14:36:39 +0100
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > >       
> > > > > Hello,
> > > > > 
> > > > > Masahiro Yamada <masahiroy@kernel.org> wrote on Wed, 29 Jan 2020
> > > > > 19:06:46 +0900:
> > > > >         
> > > > > > On Tue, Jan 28, 2020 at 3:58 PM Boris Brezillon
> > > > > > <boris.brezillon@collabora.com> wrote:          
> > > > > > >
> > > > > > > On Mon, 27 Jan 2020 16:47:55 +0100
> > > > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > > > > >            
> > > > > > > > Hi Hello,
> > > > > > > >
> > > > > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 27 Jan
> > > > > > > > 2020 16:45:54 +0100:
> > > > > > > >            
> > > > > > > > > On Mon, 27 Jan 2020 15:35:59 +0100
> > > > > > > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > > > > > > >            
> > > > > > > > > > Hi Masahiro,
> > > > > > > > > >
> > > > > > > > > > Masahiro Yamada <masahiroy@kernel.org> wrote on Mon, 27 Jan 2020
> > > > > > > > > > 21:55:25 +0900:
> > > > > > > > > >            
> > > > > > > > > > > Hi.
> > > > > > > > > > >
> > > > > > > > > > > I have a question about the
> > > > > > > > > > > WP_n pin of a NAND chip.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > As far as I see, the NAND framework does not
> > > > > > > > > > > handle it.            
> > > > > > > > > >
> > > > > > > > > > There is a nand_check_wp() which reads the status of the pin before
> > > > > > > > > > erasing/writing.
> > > > > > > > > >            
> > > > > > > > > > >
> > > > > > > > > > > Instead, it is handled in a driver level.
> > > > > > > > > > > I see some DT-bindings that handle the WP_n pin.
> > > > > > > > > > >
> > > > > > > > > > > $ git grep wp -- Documentation/devicetree/bindings/mtd/
> > > > > > > > > > > Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt:-
> > > > > > > > > > > brcm,nand-has-wp          : Some versions of this IP include a
> > > > > > > > > > > write-protect            
> > > > > > > > > >
> > > > > > > > > > Just checked: brcmnand de-assert WP when writing/erasing and asserts it
> > > > > > > > > > otherwise. IMHO this switching is useless.
> > > > > > > > > >            
> > > > > > > > > > > Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt:-
> > > > > > > > > > > wp-gpios: GPIO specifier for the write protect pin.
> > > > > > > > > > > Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt:
> > > > > > > > > > >          wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
> > > > > > > > > > > Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt:-
> > > > > > > > > > > wp-gpios: GPIO specifier for the write protect pin.
> > > > > > > > > > > Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt:
> > > > > > > > > > >          wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;            
> > > > > > > > > >
> > > > > > > > > > In both cases, the WP GPIO is unused in the code, just de-asserted at
> > > > > > > > > > boot time like what you do in the patch below.
> > > > > > > > > >            
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > I wrote a patch to avoid read-only issue in some cases:
> > > > > > > > > > > http://patchwork.ozlabs.org/patch/1229749/
> > > > > > > > > > >
> > > > > > > > > > > Generally speaking, we expect NAND devices
> > > > > > > > > > > are writable in Linux. So, I think my patch is OK.            
> > > > > > > > > >
> > > > > > > > > > I think the patch is fine.
> > > > > > > > > >            
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > However, I asked this myself:
> > > > > > > > > > > Is there a useful case to assert the write protect
> > > > > > > > > > > pin in order to make the NAND chip really read-only?
> > > > > > > > > > > For example, the system recovery image is stored in
> > > > > > > > > > > a read-only device, and the write-protect pin is
> > > > > > > > > > > kept asserted to assure nobody accidentally corrupts it.            
> > > > > > > > > >
> > > > > > > > > > It is very likely that the same device is used for RO and RW storage so
> > > > > > > > > > in most cases this is not possible. We already have squashfs which is
> > > > > > > > > > actually read-only at filesystem level, I'm not sure it is needed to
> > > > > > > > > > enforce this at a lower level... Anyway if there is actually a pin for
> > > > > > > > > > that, one might want to handle the pin directly as a GPIO, what do you
> > > > > > > > > > think?            
> > > > > > > > >
> > > > > > > > > FWIW, I've always considered the WP pin as a way to protect against
> > > > > > > > > spurious destructive command emission, which is most likely to happen
> > > > > > > > > during transition phases (bootloader -> linux, linux -> kexeced-linux,
> > > > > > > > > platform reset, ..., or any other transition where the pin state might
> > > > > > > > > be undefined at some point). This being said, if you're worried about
> > > > > > > > > other sources of spurious cmds (say your bus is shared between
> > > > > > > > > different kind of memory devices, and the CS pin is unreliable), you
> > > > > > > > > might want to leave the NAND in a write-protected state de-asserting WP
> > > > > > > > > only when explicitly issuing a destructive command (program page, erase
> > > > > > > > > block).            
> > > > > > > >
> > > > > > > > Ok so with this in mind, only the brcmnand driver does a useful use of
> > > > > > > > the WP output.            
> > > > > > >
> > > > > > > Well, I'd just say that brcmnand is more paranoid, which is a good
> > > > > > > thing I guess, but that doesn't make other solutions useless, just less
> > > > > > > safe. We could probably flag operations as 'destructive' at the
> > > > > > > nand_operation level, so drivers can assert/de-assert the pin on a
> > > > > > > per-operation basis.            
> > > > > > 
> > > > > > Sounds a good idea.
> > > > > > 
> > > > > > If it is supported in the NAND framework,
> > > > > > I will be happy to implement in the Denali NAND driver.
> > > > > >           
> > > > > 
> > > > > There is currently no such thing at NAND level but I doubt there is
> > > > > more than erase and write operation during which it would be needed
> > > > > to assert/deassert WP. I don't see why having this flag would help
> > > > > the controller drivers?        
> > > > 
> > > > Because ->exec_op() was designed to avoid leaving such decisions to the
> > > > NAND controller drivers :P. If you now ask drivers to look at the
> > > > opcode and guess when they should de-assert the WP pin, you're just
> > > > going back to the ->cmdfunc() mess.      
> > > 
> > > I was actually thinking to the ->write_page(_raw)() helpers, but
> > > yeah, in the case of ->exec_op() it's different. However, for these
> > > helpers as don't use ->exec_op(), we need another way to flag the
> > > operation as destructive.    
> > 
> > I don't think we really care about ancient (AKA non-exec_op()) drivers.
> > They seem to work fine as they are now, so let's focus on the modern
> > ones.  
> 
> Not my point: the ->write_page[_raw]() helpers are implemented by
> everyone, no ->exec_op() is involved and they are destructive as well.

Well, yes. If the driver has custom ->write_page[_raw](), they should
be patched to handle WP de-assertion/assertion.

> 
> >   
> > > 
> > > But actually we could let the driver toggle the pin for any operation.
> > > If we want to be protected against spurious access, not directly ordered
> > > by the controller driver itself, then we don't care if the operation is
> > > actually destructive or not as long as the pin is deasserted during our
> > > operations and asserted otherwise.    
> > 
> > Or we could patch the ->exec_op() path to pass this information (and
> > maybe provide helpers for the GPIO case). Should be as simple as:  
> 
> This approach is fine.
> 
> Without the delay penalty in mind, I would say it is useless and the
> driver can simply deassert WP at the start of ->exec_op() but as there
> is a small penalty, why not.

Right. 100ns on an operation that takes more than 100us is negligible,
but if you start de-asserting/asserting WP on shorter operations, like
READ_STATUS, that might have an impact.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
