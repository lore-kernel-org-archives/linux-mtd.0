Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8gcq-0006iL-31
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 00:04:17 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V5] mtd: m25p80: Make fast read configurable via DT
Date: Tue, 4 Sep 2012 02:04:09 +0200
References: <1345923416-9293-1-git-send-email-marex@denx.de>
In-Reply-To: <1345923416-9293-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201209040204.09537.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 devicetree-discuss@lists.ozlabs.org, robherring2@gmail.com,
 David Woodhouse <david.woodhouse@intel.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> Add DT property "m25p,fast-read" that signalises the particular
> chip supports "fast read" opcode.

Do you think it's aplicable now ?

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: David Woodhouse <david.woodhouse@intel.com>

[...]

Best regards,
Marek Vasut
