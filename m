Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsIBx-0000GW-68
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 08:50:28 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l4RCnkEq013683
	for <linux-mtd@lists.infradead.org>; Sun, 27 May 2007 08:49:46 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l4RCnkRu519002
	for <linux-mtd@lists.infradead.org>; Sun, 27 May 2007 08:49:46 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l4RCnjXh007289
	for <linux-mtd@lists.infradead.org>; Sun, 27 May 2007 08:49:46 -0400
Subject: Re: [PATCH] mtd/ubi: silence gcc warning
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Jeff Garzik <jeff@garzik.org>
In-Reply-To: <20070527113254.GA11940@havoc.gtf.org>
References: <20070527113254.GA11940@havoc.gtf.org>
Content-Type: text/plain; charset=utf-8
Date: Sun, 27 May 2007 07:48:03 -0500
Message-Id: <1180270083.3360.45.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2007-05-27 at 07:32 -0400, Jeff Garzik wrote:
> Silence the gcc warning
> 
> drivers/mtd/ubi/eba.c: In function ‘ubi_eba_read_leb’:
> drivers/mtd/ubi/eba.c:371: warning: ‘crc’ may be used uninitialized in this function
> 
> This is an example of the uninit'd-var warnings emitted by gcc that
> can be proven to be bogus.
> 
> Normally I would commit this to my git repository containing
> such verified cases, but with all the goto-driven control flow in
> ubi_eba_read_leb(), I feel that initializing the 'crc' variable is
> an easy way to both shut up gcc, and also make the code less fragile
> for the long term.
> 
> Signed-off-by: Jeff Garzik <jeff@garzik.org>

Acked-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>
