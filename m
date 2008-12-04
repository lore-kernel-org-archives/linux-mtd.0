Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8Elf-00060y-Dl
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 14:01:23 +0000
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e4.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mB4E0qV9018145
	for <linux-mtd@lists.infradead.org>; Thu, 4 Dec 2008 09:00:52 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mB4E1IJL1380542
	for <linux-mtd@lists.infradead.org>; Thu, 4 Dec 2008 09:01:19 -0500
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mB4E1Fbm021133
	for <linux-mtd@lists.infradead.org>; Thu, 4 Dec 2008 07:01:15 -0700
Date: Thu, 4 Dec 2008 09:01:07 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Sean MacLennan <smaclennan@pikatech.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081204090107.20269571@zod.rchland.ibm.com>
In-Reply-To: <20081203222832.3fc77d28@lappy.seanm.ca>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 3 Dec 2008 22:28:32 -0500
Sean MacLennan <smaclennan@pikatech.com> wrote:

Hi Sean,

A couple of comments/requests below.

> The current ndfc driver only compiles under arch/ppc. This arch was
> removed from the kernel. I notice the event entry for the ndfc in
> Kconfig has been removed in 2.6.28.
> 
> This patch converts the ndfc to a proper OF (OpenFirmware) driver. I
> can give a working example of the DTS if needed.

In addition to an example DTS patch (probably to warp itself), could
you briefly write up a binding and put it in
Documentation/powerpc/dts-bindings/amcc (or similar)?  Also please CC
the devicetree-discuss list on that part.

> The patch has been in production use on the PIKA Warp Appliance and is
> in use by others. The Warp basically boots from NAND, so the ndfc driver
> is very important to us.

Looking over the patch it seems pretty straight-forward and I don't see
anything immediately wrong with it.  You do have a number of
semi-unrelated changes to the actual port to of_platform though, like
the s/__raw_writel/out_be32 stuff, the addition of partition parsing,
etc.  I'm wondering if you could do those fixups separately from the
actual port.

Also, could you document why the data structures changed as they did in
the changelog or perhaps in a summary email.

You also seem to only support a single NAND chip, however the NDFC can
support multiple chips.  Have you looked at how the the fsl_elbc_nand
driver does multiple chip support?  If not, could you at least document
the limitation in the patch?

> This is a bi-monthly posting ;)

Keep at it Sean.  Your work is appreciated, even if the rest of us are
slow to review.

josh
