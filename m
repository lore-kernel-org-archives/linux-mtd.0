Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F7TTe-0000LG-8G
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 03:18:05 -0500
Message-ID: <43EC4C50.9010202@inf.u-szeged.hu>
Date: Fri, 10 Feb 2006 09:18:24 +0100
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: Robert Liu <robertliu@wiscore.com>
References: <43EC38E0.9060007@wiscore.com>
In-Reply-To: <43EC38E0.9060007@wiscore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 summary error!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert!

We have developed the summary support but we haven't found this kind of 
error before.
Please send me the kernel log with JFFS2 debug level 1 and the dump of 
the wrong fs image.
I will try to reproduce/fix the problem.

Thanks:
    Zoltan

Robert Liu wrote:

> Hi All,
>
> I am using Linux-2.6.10 with the lastest CVS MTD codes.
> My device is a Intel IXP E.V. board, configured as a big-endian machine,
> with 8M NOR flash and 32M NAND flash.
>
> I can mount a JFFS2 partition correctly without enabling the JFFS2 
> summary support.
> But, I usually got warning messages, when turn on the JFFS2 summary 
> support.
> (I don't know this problem occurs unders what condition)
> The following steps are used to test:
>  1. flash_eraseall /dev/mtdblock/3
>  2. mount -t jffs2 /dev/mtdblock/3 /mnt
>  3. do some operations (mkdir, touch, dd, ...)
>  4. umount /mnt
>  5. mount -t jffs2 /dev/mtdblock/3 /mnt
> then the warning (error!?) meesage showed:
>  JFFS2 warning: (86) jffs2_sum_process_sum_data: Unsupported node type 
> found in summary! Exiting...
>  mount: Mounting /dev/mtdblock/3 on /mnt failed: Input/output error
>
> I added some debug code and found the warrnig always occured with 
> nodetype 02E0.
> This looks like a endian problem.
> Would someone help me to debug?
>
> Regards,
> Robert
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
