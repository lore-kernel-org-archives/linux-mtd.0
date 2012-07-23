Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1St843-0006OD-VZ
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 02:08:04 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V3] mtd: m25p80: Make fast read configurable via DT
Date: Mon, 23 Jul 2012 04:08:00 +0200
References: <1343009006-30154-1-git-send-email-marex@denx.de>
In-Reply-To: <1343009006-30154-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207230408.00837.marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, sr@denx.de,
 David Woodhouse <david.woodhouse@intel.com>,
 Rob Herring <rob.herring@calxeda.com>, dedekind1@gmail.com
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
[...]

Please ignore this one until properly discussed the previous one.

Best regards,
Marek Vasut
