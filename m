Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFqJQ-0003wr-JA
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 12:27:15 +0000
Received: by py-out-1112.google.com with SMTP id p76so1795496pyb.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 04:27:07 -0800 (PST)
Message-ID: <47909B16.30601@gmail.com>
Date: Fri, 18 Jan 2008 17:57:02 +0530
From: vicky <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: question about node creation /dev/mtd*
References: <479097B7.9050401@gmail.com>
In-Reply-To: <479097B7.9050401@gmail.com>
Content-Type: multipart/mixed; boundary="------------020304020106040502080408"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020304020106040502080408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

vicky wrote:
> Hi,
>
> I have enabled mtd in my config. When I boot from the updated kernel I 
> find that /dev/mtdblock is not created?
>
> How does the /dev/mtdblock get created? I didn't find this in the 
> init/rcs script. I am under an impression that once the mtd is enabled 
> in the linux
> config file the creation of the corresponding node is taken care in 
> some script.
>
> I have a dummy nand driver written and placed in the mtd/nand location.
>
> Please advice.
>
> Vic
>
Adding to the email, I enabled the below options in my config file.

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_VERIFY_WRITE=y
CONFIG_MTD_NAND_IDS=y



--------------020304020106040502080408
Content-Type: text/x-vcard; charset=utf-8;
 name="vicky_irobot.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vicky_irobot.vcf"

begin:vcard
fn:vicky
n:;vicky
email;internet:vicky.irobot@gmail.com
version:2.1
end:vcard


--------------020304020106040502080408--
