Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E75C433E0
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 18:48:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A88920738
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 18:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQtj0Aad";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="km2ppJ9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A88920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bsc9gthoOJNHX9KRVJw4jOyH0yRrJPPcGl9H/znvWwo=; b=TQtj0Aad+3DBmHaG4aa6DaQp8
	u430UyvQjk2Mj0lF5DmjkkZyVCE0t8WLobr//YnyIc17xNo02AERyvr1v9dGg3LIRwIByo3hy83kK
	bFNnsbd+3yNbSA6AonwRijCRIhV92320Nsy6WGuYCKmkc6GPVNCUlA6E0MzTDYalMInA6o9lKqUdj
	m4ZtJ1i3MXLfQdMmex/5OT7hwYJiNC44gkiGkXz4lIBS6FrfPhAKyp0ha98nwCtvm3u+GXFTu74iv
	2ahJ99rpv7zi1s92w/h8QucsyiySbVmamUTs5SGhpgRKXhxQIR2j53asV3HjIb52QaFazu/NgEsza
	ZKw+sjPPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2J19-0002wM-TA; Sun, 02 Aug 2020 18:47:31 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2J16-0002uY-RZ
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 18:47:29 +0000
Received: from nazgul.tnic (unknown [78.130.214.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6060E1EC027B;
 Sun,  2 Aug 2020 20:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1596394040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=6tNJPljLjNx2x9QEIVJnns37NMBlLLp4EAbpTzGkx/k=;
 b=km2ppJ9W1lKPkeogNByCZRPPB90pQ77y1xFpzqsz5v2Gw4jUrJuG2BUGC6FlwifBWKp5xA
 i/pwFuidiFCe1IAhyK7PX67NxCd1gqUPGlQREtpW/WPoHky93LT53Q3Zqf5RRY0CErhAu0
 8YCnO7sm9NOsIwnrSCtwGhnf6GzAdAw=
Date: Sun, 2 Aug 2020 20:46:48 +0200
From: Borislav Petkov <bp@alien8.de>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
Message-ID: <20200802184648.GA23190@nazgul.tnic>
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801125657.GA25391@nazgul.tnic>
 <b720aa44-895a-203b-e220-ecdb3acd9278@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b720aa44-895a-203b-e220-ecdb3acd9278@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_144729_030790_1D8852B1 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, trix@redhat.com,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Joerg Roedel <joro@8bytes.org>, linux-atm-general@lists.sourceforge.net,
 helgaas@kernel.org, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 02, 2020 at 07:28:00PM +0200, Saheed Bolarinwa wrote:
> Because the value ~0 has a meaning to some drivers and only

No, ~0 means that the PCI read failed. For *every* PCI device I know.

Here's me reading from 0xf0 offset of my hostbridge:

# setpci -s 00:00.0 0xf0.l
01000000

That device doesn't have extended config space, so the last valid byte
is 0xff. Let's read beyond that:

# setpci -s 00:00.0 0x100.l
ffffffff

> Again, only the drivers can determine if ~0 is a valid value. This
> information is not available inside pci_config_read*().

Of course it is.

*every* change you've done in 6/17 - this is the only patch I have
received - checks for == ~0. So that check can just as well be moved
inside pci_config_read_*().

Here's how one could do it:

#define PCI_OP_READ(size, type, len) \
int noinline pci_bus_read_config_##size \
	(struct pci_bus *bus, unsigned int devfn, int pos, type *value)	\
{									\
	int res;							\
	unsigned long flags;						\
	u32 data = 0;							\
	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
	pci_lock_config(flags);						\
	res = bus->ops->read(bus, devfn, pos, len, &data);		\

	/* Check we actually read something which is not all 1s.*/
	if (data == ~0)
		return PCIBIOS_READ_FAILED;

	*value = (type)data;						\
	pci_unlock_config(flags);					\
	return res;							\
}

Also, I'd prefer a function to *not* return void but return either
an error or success. In the success case, the @value argument can be
consumed by the caller and otherwise not.

In any case, that change is a step in the wrong direction and I don't
like it, sorry.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
