Received: from mail.smartlink.ee ([213.180.16.242])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDcnT-0000FZ-Ti
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 02:56:05 -0400
Message-ID: <43212B77.9010508@colleduc.ee>
Date: Fri, 09 Sep 2005 09:28:07 +0300
From: Kalev Lember <kalev@colleduc.ee>
MIME-Version: 1.0
To: Ruediger Haertel <hae@port.de>
References: <200509071126.30256.hae@port.de>
In-Reply-To: <200509071126.30256.hae@port.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip - mount partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ruediger Haertel wrote:

>I have a DoC Mil+ 16MB. I am using 2.4.27-uc1 with this MTD 
>configuration:
>
>CONFIG_MTD
>CONFIG_MTD_PARTITIONS
>CONFIG_MTD_CHAR
>CONFIG_INFTL
>
>CONFIG_MTD_DOC2001PLUS
>  
>
Hello,

First of all I would suggest to use newer diskonchip driver under the 
nand sub-menu (CONFIG_MTD_NAND_DISKONCHIP) and a recent kernel (2.6.13 
for example).
Also take a look at 
http://www.linux-mtd.infradead.org/source.html#kernelversions .

-- 
Best regards,
Kalev Lember
