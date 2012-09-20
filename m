Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TElR6-00005B-7Y
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 18:25:16 +0000
Received: by pbbrq8 with SMTP id rq8so5911963pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 11:25:13 -0700 (PDT)
Message-ID: <505B5F83.6070408@gmail.com>
Date: Thu, 20 Sep 2012 23:55:07 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Dimitar Penev <dpn@switchfin.org>
Subject: Re: ubiattach  issue
References: <006c01cd970c$1b9cb930$2901a8c0@dpn>
In-Reply-To: <006c01cd970c$1b9cb930$2901a8c0@dpn>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/20/2012 2:14 PM, Dimitar Penev wrote:
> Hi Gents,
>
> I am facing an issue with ubiattach on Linux kernel 3.0.8
> On our target we have nand flash with mtd layer on top.
> The logs attached below.
>
> Can you please give me a pointer?
>
>
> /bin # ubinfo -a
> UBI version: 1
> Count of UBI devices: 0
> UBI control device major/minor: 10:62
>
> /bin # ubiformat /dev/mtd5 -y --vid-hdr-offset="2048"
> ubiformat: mtd5 (nand), size 511705088 bytes (488.0 MiB), 3904
> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 3903 -- 100 % complete
> ubiformat: 3904 eraseblocks have valid erase counter, mean value is 3
> ubiformat: formatting eraseblock 3903 -- 100 % complete
>
> /bin # ubiattach /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
> ubiattach: error!: cannot attach mtd5
> error 25 (Inappropriate ioctl for device)

Before any pointers, which version of mtd-utils are you using?
How to:
(http://linux-mtd.infradead.org/faq/general.html#L_compile_mtd)

~Vikram
