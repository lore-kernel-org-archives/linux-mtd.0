Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1So967-00066a-5P
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 08:13:44 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] [RFC] mtd: m25p80: Make fast read configurable via DT
Date: Mon, 9 Jul 2012 10:13:29 +0200
References: <1341555027-17462-1-git-send-email-marex@denx.de>
 <1341555027-17462-3-git-send-email-marex@denx.de>
In-Reply-To: <1341555027-17462-3-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207091013.29597.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek Vasut,

> Add DT property "m25p,fast-read" that signalises the particular
> chip supports "fast read" opcode.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: David Woodhouse <david.woodhouse@intel.com>
> ---
>  drivers/mtd/devices/m25p80.c |   32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> NOTE: I'm not sure where to document this property, as m25p80 is
>       a simple DT device. Any hints please?
> 
   ^--- bump?

Best regards,
Marek Vasut
