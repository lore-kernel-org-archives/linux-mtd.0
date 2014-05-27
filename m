Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpGLZ-000275-6B
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:19:13 +0000
Message-ID: <1401193128.1304.132.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Date: Tue, 27 May 2014 15:18:48 +0300
In-Reply-To: <20140517015541.GA6399@earthship.local>
References: <20140517015541.GA6399@earthship.local>
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

On Sat, 2014-05-17 at 03:55 +0200, Daniel Golle wrote:
> When attempting to mount a non-ubifs formatted volume, lots of error
> messages (including a stack dump) are thrown to the kernel log even if
> the MS_SILENT mount flag is set.
> Fix this by introducing an additional parameter in ubifs_read_node and
> use it to pass down the MS_SILENT flag in ubifs_read_sb_node.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

This looks reasonable. Could you please send v2 with checkpatch.pl
complaints addressed?

Thanks!

-- 
Best Regards,
Artem Bityutskiy
