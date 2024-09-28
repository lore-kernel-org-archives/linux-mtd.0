Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42649CF6493
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2024 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ri5F6XFNIVMTqtaBk0MB+9zfAly0u8oAmkQZu40YtZA=; b=KXLk/sZ1LsIrzH
	Wf9+hDiX+boTczVwhAbzowwD9CEHENhk8Eaoe/5zyyNP7yOfqyWeAjZWFIKrBbqoubRVwHi7X2F0J
	Wj/+gzVQqdhTVpUGVe+jsL91yJKkyf7mT3cMKebtpJCAc31yu4AlWtsxwo+Q5FgXC1ANeq3WR0TYe
	tJVYLo/N8gp+HUn5msORTWrYyG7quhqlDvWFzs6cpswaVu9xeTmahBg5S82c7LboO4r7to8uCHSYe
	iRuKq93iI/K5TWKLmxIcee1JnIsKNIWSXz2dmCItZyPmHq1EcQlE6pk2kXeK6o329JBaopaFXPXLF
	2NqFv/888XD4PJOObLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suYaX-0000000DCT2-3QrX;
	Sat, 28 Sep 2024 14:38:25 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suYaV-0000000DCSN-1BKK
	for linux-mtd@lists.infradead.org;
	Sat, 28 Sep 2024 14:38:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1suYaL-000000004ig-0ri1;
	Sat, 28 Sep 2024 14:38:13 +0000
Date: Sat, 28 Sep 2024 15:38:09 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	John Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: mtd: ubi-volume: add
 'volume-is-critical' property
Message-ID: <ZvgU0eBEwTJ3sHuN@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org>
 <Zvf_84xxhxwpPgee@makrotopia.org>
 <18e9d774-813b-427e-9938-53853d695e18@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18e9d774-813b-427e-9938-53853d695e18@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_073823_349646_713B75FE 
X-CRM114-Status: GOOD (  38.51  )
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

On Sat, Sep 28, 2024 at 03:45:49PM +0200, Krzysztof Kozlowski wrote:
> On 28/09/2024 15:09, Daniel Golle wrote:
> > On Sat, Sep 28, 2024 at 03:02:47PM +0200, Krzysztof Kozlowski wrote:
> >> On 28/09/2024 14:47, Daniel Golle wrote:
> >>> Add the 'volume-is-critical' boolean property which marks a UBI volume
> >>> as critical for the device to boot. If set it prevents the user from
> >>> all kinds of write access to the volume as well as from renaming it or
> >>> detaching the UBI device it is located on.
> >>>
> >>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> >>> ---
> >>>  .../devicetree/bindings/mtd/partitions/ubi-volume.yaml   | 9 +++++++++
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> >>> index 19736b26056b..2bd751bb7f9e 100644
> >>> --- a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> >>> +++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> >>> @@ -29,6 +29,15 @@ properties:
> >>>      description:
> >>>        This container may reference an NVMEM layout parser.
> >>>  
> >>> +  volume-is-critical:
> >>> +    description: This parameter, if present, indicates that the UBI volume
> >>> +      contains early-boot firmware images or data which should not be clobbered.
> >>> +      If set, it prevents the user from renaming the volume, writing to it or
> >>> +      making any changes affecting it, as well as detaching the UBI device it is
> >>> +      located on, so direct access to the underlying MTD device is prevented as
> >>> +      well.
> >>> +    type: boolean
> >>
> >> UBI volumes are mapping to partitions 1-to-1, right? So rather I would
> >> propose to use partition.yaml - we already have read-only there with
> >> very similar description.
> > 
> > No, that's not the case.
> > 
> > An MTD partition can be used as UBI device. A UBI device (and hence MTD
> > partition) can host *several* UBI volumes.
> > 
> > Marking the MTD partition as 'read-only' won't work, as UBI needs
> > read-write access to perform bad block relocation, scrubbing, ...
> 
> OK, so not partition but read-only volume.

+1

> 
> > 
> > Also, typically not all UBI volumes on a UBI device are
> > read-only/critical but only a subset of them.
> > 
> > But you are right that the description is inspired by the description
> > of the 'read-only' property in partition.yaml ;)
> > 
> > I initially thought to also name the property 'read-only', just like
> > for MTD partitions. However, as the desired effect goes beyond
> > preventing write access to the volume itself, I thought it'd be
> > better to use a new name.
> 
> Yeah, maybe... critical indeed covers multiple cases but is also
> subjective. For some bootloader is critical, for other bootloader still
> might be fully A/B updateable thus could be modifiable. For others, they
> want to use fw_setenv from user-space so not critical at all.

The case I want to cover here is the bootloader itself being stored
inside a UBI volume. MediaTek's fork of ARM TrustedFirmware-A bl2 comes
with support for UBI and loads BL3 (which is TF-A BL31 and U-Boot, and
maybe OP-TEE as well) from a static UBI volume. Removing, renaming or
altering that volume results in the device not being able to boot any
more and requiring a complicated intervention (at attaching debugging
UART and using low-level recovery tool) in order to recover.

It is true that also in this case a fully A/B updateable strategy could
be implemented, however, typically that would not be done in Linux, but
rather the code carrying out such update would be part of the bootloader
itself.
UEFI update capsules are a good example for that, but in most cases
things are much less complex on simple embedded Linux networking
appliances such as routers, access points, switches, ...

> 
> I am in general not so happy in describing flash layout in DT, because
> it sounds way too policy or one-use-case specific.
> 
> UBI volume is purely SW construct. One OS can partition MTD in multiple
> ways, so maybe I just do not understand why we have in the first place.

Support for attaching UBI from DT and referencing UBI volumes has been
added because they serve as NVMEM providers, ie. UBI volumes are used to
store things such as Ethernet MAC addresses and Wi-Fi calibration data,
similar to how it also works on devices with NOR flash and simple MTD
partitions holding that data.
And we needed the kernel drivers to be able to access that information
directly, also in case eg. nfsroot is being used.

So while it's true that both, MTD partitioning as well as use of UBI
are pure software constructs, their use can go beyond and below the OS
kernel, meaning that early boot firmware usually requires a specific MTD
partition layout, and some require also certain UBI volumes to be present
for the device to be able to even start the bootloader.

It is also true that (just like MTD partitioning as well) it is
questionable whether this should be communicated as a property of the
flash hardware in DT, or rather end up as information filed under the
/chosen node which to me seems more appropriate. Moving all MTD
partitioning away from the node representing the flash chip and into the
/chosen node would have to happen in a way which doesn't break
compatibility with existing DT, which all describe MTD partitions as a
subnode of the storage hardware itself. Obviously that is beyond the
scope (and independent) of being able to mark some UBI volumes as
critical.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
