Received: from mga11.intel.com ([192.55.52.93])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAg8s-0003wJ-1L
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 09:48:31 +0000
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: make sector erase command
	variable
From: David Woodhouse <david.woodhouse@intel.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20101026094523.6578.44863.stgit@dev.siriade.com>
References: <20101026094523.6578.44863.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Oct 2010 10:48:24 +0100
Message-ID: <1288086504.29264.22.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "zhangyd6@gmail.com" <zhangyd6@gmail.com>,
	"fggs@terra.com.br" <fggs@terra.com.br>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"w.sang@pengutronix.de" <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-10-26 at 10:45 +0100, Guillaume LECERF wrote:
> Some old SST chips use 0x50 as sector erase command, instead
> of 0x30. Make this value variable to handle such chips.
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com> 


Looks good. Let me know when it's tested :)

Thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
