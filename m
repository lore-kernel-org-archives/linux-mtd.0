Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189ASq-0000xp-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 20:38:20 +0000
Date: Tue, 5 Nov 2002 22:08:33 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Junping Zhang <JZhang@erinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: seeking help on JFFS2
Message-ID: <20021105210833.GF29951@wohnheim.fh-wedel.de>
References: <F4608F665DF5D311B231009027B70F700131DF9D@MAIL>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F4608F665DF5D311B231009027B70F700131DF9D@MAIL>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 November 2002 14:56:56 -0500, Junping Zhang wrote:
> 
>    I just tested 2.4.19 with shared-zlib patch, same behavior. I could use
> the JFFS2 system,
> but it will eventually crash after a while.
> 
>    The flash chip is original from Motorola: 8M, 80 pin SIMM, SM73228. I
> used Christian's
> map file. Since JFFS works on it without any problem, should I safely assume
> the MTD layer
> is correct?

Ok, glancing at the spec, it said something about being compatible to
Am29F040 chips, which use the amd command set. And looking back at the
trace, we see
    Trace; c00df668 <cfi_intelext_read+b4/100>
                         ^^^^^
This is strange.

Have you configured only CONFIG_MTD_CFI_AMDSTD, only
CONFIG_MTD_CFI_INTELEXT or both?

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
