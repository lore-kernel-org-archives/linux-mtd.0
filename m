Received: from e8.ny.us.ibm.com ([32.97.182.138])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdUgU-0004fX-BV
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 02:16:45 +0000
Received: from /spool/local
 by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 1 Apr 2015 22:16:20 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 71120C9005E
 for <linux-mtd@lists.infradead.org>; Wed,  1 Apr 2015 22:07:28 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t322GIFG29032618
 for <linux-mtd@lists.infradead.org>; Thu, 2 Apr 2015 02:16:18 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t322GHBx031345
 for <linux-mtd@lists.infradead.org>; Wed, 1 Apr 2015 22:16:18 -0400
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/powernv: Add interfaces for flash device
 access
In-Reply-To: <1427868330.742068.357457598273.1.gpush@pablo>
References: <1427868330.742068.357457598273.1.gpush@pablo>
Date: Thu, 02 Apr 2015 13:16:14 +1100
Message-ID: <m31tk32s29.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Cyril Bur <cyrilbur@gmail.com>, Joel Stanley <joel@jms.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jeremy Kerr <jk@ozlabs.org> writes:

> From: Cyril Bur <cyrilbur@gmail.com>
>
> This change adds the OPAL interface definitions to allow Linux to read,
> write and erase from system flash devices. We register platform devices
> for the flash devices exported by firmware.
>
> We clash with the existing opal_flash_init function, which is really for
> the FSP flash update functionality, so we rename that initcall to
> opal_flash_update_init().
>
> A future change will add an mtd driver that uses this interface.
>
> Changes from Joel Stanley and Jeremy Kerr.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acking that firmware calls are merged into skiboot.

Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>
