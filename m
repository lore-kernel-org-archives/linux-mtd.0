Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UanpC-0006sf-Jn
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 13:57:31 +0000
Message-ID: <1368194396.26780.166.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Macronix chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jim-Ting Kuo <jimtingkuo@gmail.com>
Date: Fri, 10 May 2013 16:59:56 +0300
In-Reply-To: <CAHgCKdV=Y8KNy6OM6VmDwMDnx-geAyzxYG467GyPYoC_kGAzEA@mail.gmail.com>
References: <CAHgCKdV=Y8KNy6OM6VmDwMDnx-geAyzxYG467GyPYoC_kGAzEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-04-02 at 22:47 +0800, Jim-Ting Kuo wrote:
> I changed and added JEDEC id of Macronix SPI flash to "m25p_ids" array.
> This is used for the current Macronix's product. And I initialized Macronix
> chip's status register to 0 which is needed by some Macronix chips. Thanks!
> 
> Signed-off-by: Jim Kuo <jimtingkuo@gmail.com>

Would you please refresh it against the latest Linus's tree or against
the mtd tree and re-send?

-- 
Best Regards,
Artem Bityutskiy
