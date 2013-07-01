Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtZVB-00031w-1S
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 08:30:25 +0000
Message-ID: <1372667655.22014.50.camel@sauron.fi.intel.com>
Subject: Re: mounting ubifs read-only, is it really readonly, not any
 wirte/erase?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Caizhiyong <caizhiyong@huawei.com>
Date: Mon, 01 Jul 2013 11:34:15 +0300
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1AE72A5E@szxeml525-mbx.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F1AE72A5E@szxeml525-mbx.china.huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Renxueliang <renxueliang@huawei.com>, Quyaxin <quyaxin@huawei.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jiangzhonglin <jiangzhonglin@huawei.com>,
 "Wanglin \(Albert\)" <albert.wanglin@huawei.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-16 at 13:36 +0000, Caizhiyong wrote:
>     I'm using ubifs as root filesystem, and mounted readonly.
> 
>     bootargs are:
>         console=ttyAMA0,115200 ubi.mtd=3 root=ubi0:ubifs ro rootfstype=ubifsmtdparts=hi_sfc:-(spi);hinand:10M(10M),50M(50M),50M(50M),-(data)
>     
>     I'm update ubi.img in uboot used command "nand write xxxx", but when kernel (linux 3.4) startup, there are some write/erase operation.
> 
>     I'm add prints to the following functions:

Hi, I do not think I fully understand what is the problem, but it looks
like you need to re-formulate it more carefully, and re-send with u-boot
mailing list in CC.

-- 
Best Regards,
Artem Bityutskiy
