Received: from server.pyrenet.fr ([194.116.145.1])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DdMiV-0000Up-IJ
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2005 02:28:41 -0400
Message-ID: <429D558E.5040706@perax.fr>
Date: Wed, 01 Jun 2005 08:28:30 +0200
From: Ludovic Guilhamat <lguilhamat@perax.fr>
MIME-Version: 1.0
To: manningc2@actrix.gen.nz
References: <429C4D96.7000302@perax.fr>
	<20050601044012.1392D47AF@blood.actrix.co.nz>
In-Reply-To: <20050601044012.1392D47AF@blood.actrix.co.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: Samsung RFS Filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning a écrit :

>On Tuesday 31 May 2005 23:42, Ludovic Guilhamat wrote:
>  
>
>>Hi,
>>
>>I would maybe interested in testing the Samsung RFS File System...
>>
>>Does someone, here, already used it, and what are the conclusions ?
>>    
>>
>
>
>Please do do some testing. It would be good to see the results, positive or 
>negative.
>
>I have not used it, but from a description I can draw some immediate 
>conclusions.
>
>RFS = Robust FAT file system
>
>>From the blurb at 
>http://www.samsung.com/Products/Semiconductor/Flash/TechnicalInfo/rfs.htm
>
>this looks a bit like FATFS running on top of DOC. It might have some 
>transactioning which would make it look a bit more like Microsoft's TFAT.
>
>Neither of these are a proven reliable system. DOC can still get FAT 
>corruptions if you don't umount before power loss (== potentially a 
>completely scrambled fs). TFAT is completely unprovedn and is slower and not 
>always robust (not robust with typical mount options). Perhaps RFS gets the 
>robustness right.
>
>
>Running FAT on NAND costs some performance due to the FTL etc.  To make a 
>journaling system on FAT, as RFS claims, costs even more performance.
>
>IMHO: If you want robustnes on NAND use a log structured fs designed for 
>flash: YAFFS or JFFS2.
>
>For completeness, I will state that I wrote YAFFS, but I don't think this 
>biases my answer.
>
>-- CHarles
>
>  
>
Thanks.

Actually, the system I work on uses Jffs2 (Coldfire with uClinux). But, 
mount times are very long (the memory is a Flash Nand 16Mb). So, I 
planned to test Jffs2 patches (from the Jffs2 Improvement Project), then 
Yaffs. And as RFS is not freely distributed, and I don't know yet its 
cost, I wanted to know if someone had tested it.

Thanks for your response.

Ludovic.
