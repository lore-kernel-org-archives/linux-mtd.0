Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mqE-0003B1-2L
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:43:18 +0000
Received: by wibbw19 with SMTP id bw19so12006176wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:42:56 -0700 (PDT)
Date: Wed, 10 Jun 2015 22:43:42 +0200
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 00/60] Fix mtd parent device not showing up in sysfs
Message-ID: <20150610204342.GB1392@bugger.home>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 10, 2015 at 10:38:14PM +0200, Frans Klaver wrote:
>   - Fix compile error in 30: "fsmc_nand: show parent device in sysfs"

Oh dear, that should have been fsl_elbc_nand.

Frans
