Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmgRH-0008IO-7v
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 10:06:43 +0000
Message-ID: <1415354772.958.311.camel@sauron.fi.intel.com>
Subject: Re: Report: mtd-utils: "Floating point exception" with ubiformat
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Fri, 07 Nov 2014 12:06:12 +0200
In-Reply-To: <545C98DE.3020706@huawei.com>
References: <5453663A.8080608@huawei.com>
 <1415353395.958.300.camel@sauron.fi.intel.com>
 <545C98DE.3020706@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-11-07 at 18:03 +0800, hujianyang wrote:
> The /proc/mtd shows there are two 512M nand flash but actually
> they share the same device.
> 
> If I format mtdblock0 as jffs2 and then, I can mount a jffs2 file
> system from mtdblock2. Very interesting~!

The partitioning code is old and hairy, and needs love.

Artem.
