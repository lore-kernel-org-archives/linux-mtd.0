Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1LZX-0001AQ-5d
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 04:34:15 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <!~!UENERkVCMDkAAQACACsBAAAAAAAAOKG7EAXlEBqhuwgAKypWwgAARU1TTURCLkRMTAAAAAAAAAAAG1X6IKpmEc2byACqAC/EWgwAAABTV0NFTQAvbz1zd2NlbnRlci9vdT1GaXJzdCBBZG1pbmlzdHJhdGl2ZSBHcm91cC9jbj1SZWNpcGllbnRzL2NuPWttcGFyawDYNSHzpwAAAAEAAAAUAAAAYwAAAC9vPXN3Y2VudGVyL291PUZpc>
References: <!~!UENERkVCMDkAAQACACsBAAAAAAAAOKG7EAXlEBqhuwgAKypWwgAARU1TTURCLkRMTAAAAAAAAAAAG1X6IKpmEc2byACqAC/EWgwAAABTV0NFTQAvbz1zd2NlbnRlci9vdT1GaXJzdCBBZG1pbmlzdHJhdGl2ZSBHcm91cC9jbj1SZWNpcGllbnRzL2NuPWttcGFyawDYNSHzpwAAAAEAAAAUAAAAYwAAAC9vPXN3Y2VudGVyL291PUZpc>
Content-Type: text/plain
Date: Wed, 16 Feb 2005 10:34:02 +0100
Message-Id: <1108546442.24721.34.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Remove duplicated Samsung NAND 512MiB 3,3V 8-bit
	device ID
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-16 at 17:33 +0900, Kyungmin Park wrote:
>         Remove duplicated Samsung NAND 512MiB 3,3V 8-bit device ID.
>         Correct device ID is defined following.
>         {"NAND 512MiB 3,3V 8-bit",      0xDC, 0, 512, 0,
> NAND_SAMSUNG_LP_OPTIONS | NAND_NO_AUTOINCR},
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 

Applied. Thanks.

tglx
