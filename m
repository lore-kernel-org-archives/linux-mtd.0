Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5znw-00034o-P9
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 13:24:21 +0000
Message-ID: <1331299599.29445.28.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 00/18] mtd/nand/fsmc related modifications
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Fri, 09 Mar 2012 15:26:39 +0200
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linus.walleij@linaro.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-03-07 at 17:00 +0530, Vipin Kumar wrote:
> Hello All,
> 
> Please find the nand/fsmc driver modifications
> Major modifications include
> - DMA support
> - Word read/write support to improve performance
> - Move platform related things(ALE/CLE) from driver to platfrom files
> - Add default partition support for more devices with erase sizes (256KB, 512KB,
> 		1024KB, 2048KB)
> - Bugfixes
> 	- Read only 512 + 13 bytes for 8bit NAND devices
> 	- Flip the bit only if the error index is < 4096
> 	- Fixed data abort inside change_bit()

Pushed patches 1-7 to l2-mtd.git. Patch 8 look wrong to me, the other
won't apply without patch 8 so I did not look beyond patch 7. Thanks!

But please, confirm that it is OK to have only some of these patches
merged, not the complete set. Thanks!

-- 
Best Regards,
Artem Bityutskiy
