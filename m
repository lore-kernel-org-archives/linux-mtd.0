Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F1Nn6-0000TY-J8
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2006 08:01:12 -0500
Message-ID: <43D6254D.4000408@ru.mvista.com>
Date: Tue, 24 Jan 2006 16:02:05 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: yuri.golovach@mindspeed.com
References: <OFFED20C5C.C2FC40DE-ON882570FF.005D6B36-C22570FF.005ED903@mindspeed.com>
In-Reply-To: <OFFED20C5C.C2FC40DE-ON882570FF.005D6B36-C22570FF.005ED903@mindspeed.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Yuri,

can you please specify what patches you did apply and what flash you're 
using. Thanks!

Vitaly

yuri.golovach@mindspeed.com wrote:

>Good day Vitaly.
>
>I've tried your patches which modifies nand_base.c, other mtdfiles and 
>mtdutils to be compatible with yaffs2.
>
>Unfortunately, I've some issues with them.
>
>1) 
>        my version of mtd is newer then your and I was unable to patch 
>nand_base.c with your patch. So, I add this patch manually (but I'm not 
>sure - have I done some mistakes or             not).
>
>2)       After the kernel compiling with your patches I've started it and 
>receive a long list of
>                Bad eraseblock1 ... at ...x..................
>
>        After "mount" and "df" commands I saw that there is no free space 
>on flash because all bloks were marked as "bad block" .
>        Than I've tried patched version of flash_eraseall but it was not 
>able to see blocks also.
>
>
>3) I've changed nand_bbt.c file (in the patched kernel) where simply 
>comment the bad blocks checking. Have booted from it and _successfully_ 
>used patched flash_eraseall.
>
>4) Than I've start the patched kernel _with bad blocks checking_ but these 
>(previously erased blocks) were marked like "bad blocks" again (in a 
>kernel booting procedure).
>
>
>So, can you, please, provide your vision what should I do to run your 
>patch. Or you can send the link on the mtd line which supports yaffs2, 
>because I was unable to find your updates in CVS mainline :(
>
>Thank you,
>        Yuri Golovach
>
>
>  
>
