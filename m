Received: from ipmail06.adl6.internode.on.net ([150.101.137.145])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgQK0-0001KE-7m
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 03:41:21 +0000
Date: Tue, 21 Oct 2014 14:38:47 +1100
From: Dave Chinner <david@fromorbit.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
Message-ID: <20141021033847.GS17506@dastard>
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
 <1413805935.7906.225.camel@sauron.fi.intel.com>
 <C3050A4DBA34F345975765E43127F10F62CC5D9B@SZXEMA512-MBX.china.huawei.com>
 <1413810719.7906.268.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413810719.7906.268.camel@sauron.fi.intel.com>
Cc: Jijiagang <jijiagang@hisilicon.com>, Caizhiyong <caizhiyong@hisilicon.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>, linux-mm@kvack.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "Wanli \(welly\)" <welly.wan@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 20, 2014 at 04:11:59PM +0300, Artem Bityutskiy wrote:
> 3. There are exactly 2 places where UBIFS-backed pages may be marked as
> dirty:
> 
>   a) ubifs_write_end() [->wirte_end] - the file write path
>   b) ubifs_page_mkwrite() [->page_mkwirte] - the file mmap() path
> 
> 4. If anything calls 'ubifs_set_page_dirty()' directly (not through
> write_end()/mkwrite()), and the page was not dirty, UBIFS will complain
> with the assertion that you see.
> 
> > CPU: 3 PID: 543 Comm: kswapd0 Tainted: P           O 3.10.0_s40 #1

Kernel is tainted. Not worth wasting time on unless it can be
reproduced on an untainted kernel...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
