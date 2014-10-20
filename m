Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgBVv-0005jZ-Lb
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 11:52:40 +0000
Message-ID: <1413805935.7906.225.camel@sauron.fi.intel.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Jijiagang <jijiagang@hisilicon.com>
Date: Mon, 20 Oct 2014 14:52:15 +0300
In-Reply-To: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Caizhiyong <caizhiyong@hisilicon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-10-09 at 06:48 +0000, Jijiagang wrote:
> Hi Artem and Adrian,
> 
> We encountered a “UBIFS assert failed in ubifs_set_page_dirty at 1421
> (pid 543)” problem when running MONKEY test in android platform.

Hi, yes, this looks like a bug,

could you please re-send this e-mail in plain test format, because the
MTD mailing list traps HTML e-mails.

Thanks!
