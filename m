Received: from mta-out1.inet.fi ([62.71.2.203] helo=kirsi1.inet.fi)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xstgv-0006V1-SH
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 13:28:35 +0000
Date: Mon, 24 Nov 2014 15:27:55 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Jijiagang <jijiagang@hisilicon.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
Message-ID: <20141124132755.GA3167@node.dhcp.inet.fi>
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
 <1413805935.7906.225.camel@sauron.fi.intel.com>
 <C3050A4DBA34F345975765E43127F10F62CC5D9B@SZXEMA512-MBX.china.huawei.com>
 <1413810719.7906.268.camel@sauron.fi.intel.com>
 <545C2CEE.5020905@huawei.com>
 <20141120123011.GA9716@node.dhcp.inet.fi>
 <BE257DAADD2C0D439647A27133296657394A65A4@SZXEMA511-MBS.china.huawei.com>
 <20141124091024.GA1190@node.dhcp.inet.fi>
 <BE257DAADD2C0D439647A27133296657394A75F1@SZXEMA511-MBS.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BE257DAADD2C0D439647A27133296657394A75F1@SZXEMA511-MBS.china.huawei.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Caizhiyong <caizhiyong@hisilicon.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 Hujianyang <hujianyang@huawei.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
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

On Mon, Nov 24, 2014 at 10:20:59AM +0000, Jijiagang wrote:
> Hi Kirill,
> I test your patch, bus there's no dump_vma definition.
> The log is here, hope it will be helpful.
> 
>  page:817fd7e0 count:3 mapcount:1 mapping:a318bb8c index:0x4
>  page flags: 0xa19(locked|uptodate|dirty|arch_1|private)
>  pte_write: 1
>  page:81441a80 count:3 mapcount:1 mapping:a318bb8c index:0x5
>  page flags: 0x209(locked|uptodate|arch_1)
>  pte_write: 1

Okay, pte is writable but page is not dirty and doesn't have private flag
set.

I looked through code and don't see how that could happen.

>  UBIFS assert failed in ubifs_set_page_dirty at 1422 (pid 545)
>  CPU: 2 PID: 545 Comm: kswapd0 Tainted: P           O 3.10.0_s40 #19

Is it possible to reproduce the issue on current upstream without any
patches or third-party modules?

-- 
 Kirill A. Shutemov
