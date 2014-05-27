Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpIoE-0001VW-NE
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 14:56:59 +0000
Message-ID: <1401202595.1304.165.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Date: Tue, 27 May 2014 17:56:35 +0300
In-Reply-To: <20140527141030.GA3130@earthship.local>
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-05-27 at 16:11 +0200, Daniel Golle wrote:
> When attempting to mount a non-ubifs formatted volume, lots of error
> messages (including a stack dump) are thrown to the kernel log even if
> the MS_SILENT mount flag is set.
> Fix this by introducing an additional parameter in ubifs_read_node and
> use it to pass down the MS_SILENT flag in ubifs_read_sb_node.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Thanks. How did you test this patch?

-- 
Best Regards,
Artem Bityutskiy
