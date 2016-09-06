Received: from mail-cys01nam02on0085.outbound.protection.outlook.com
 ([104.47.37.85] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhIHz-0005Hb-5m
 for linux-mtd@lists.infradead.org; Tue, 06 Sep 2016 15:27:59 +0000
Subject: Re: [PATCH] mtd-utils: Support jffs2 flash-erase for large OOB (>32b)
To: Manikandan Ramachandran <crmanik@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <1438886294.23233.6.camel@mramach3-lnx001>
From: Graham Moore <grmoore@opensource.altera.com>
Message-ID: <40ec1dc1-210a-77fb-89d5-779b930c3764@opensource.altera.com>
Date: Tue, 6 Sep 2016 10:22:02 -0500
MIME-Version: 1.0
In-Reply-To: <1438886294.23233.6.camel@mramach3-lnx001>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/06/2015 01:38 PM, Manikandan Ramachandran wrote:
> "flash_erase" fails on nand flash with JFFS2 that has OOB size greater than
> 32 bytes. "flash_erase" uses "MEMGETOOSEL" to determine OOB size. This ioctl
> call is obsolete and returns error if OOB size is more than 32 bytes.
>
> This patch fixes this issue by using "mtd_write" to update clean-marker
> instead of mtd_oob_write. This fix is based on the discussion:
> http://lists.infradead.org/pipermail/linux-mtd/2011-September/037958.html.
>

Hi Manikandan,

I'd like to use this patch in our Angstrom/Yocto builds, but our company 
policy doesn't allow patches that aren't signed off.

I wonder if you could re-post this with your sign-off?  I'd really 
appreciate it.

Thanks!
Graham Moore
