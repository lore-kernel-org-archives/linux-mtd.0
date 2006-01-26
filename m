Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F26bU-0003QF-3Y
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 07:52:06 -0500
Message-ID: <43D8C5E1.4010600@ru.mvista.com>
Date: Thu, 26 Jan 2006 15:51:45 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: yuri.golovach@mindspeed.com
References: <OFD870B79D.90A804FE-ON88257101.0037ED08-C2257101.0037DF6B@mindspeed.com>
In-Reply-To: <OFD870B79D.90A804FE-ON88257101.0037ED08-C2257101.0037DF6B@mindspeed.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yuri,

well, lemme just summarize what you hafta do in order to make YAFFS2 
work with my patches.

1. Apply the following patch to the mtd code:
http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.html
(yes, it's a single patch!)
2. Modify the fs/yaffs2/yaffs_mtdif2.c to use read_oobfree/write_oobfree 
where appropriate.

Hope that helps,

   Vitaly

yuri.golovach@mindspeed.com wrote:

>
> Hi Vitaly,
>
> Sure:
>
> flash device Samsung K9F1G08UOM
>
> patches:
>
> http://lists.infradead.org/pipermail/linux-mtd/2005-November/014494.html
> http://lists.infradead.org/pipermail/linux-mtd/2005-December/014522.html
> http://lists.infradead.org/pipermail/linux-mtd/2005-December/014523.html
> http://lists.infradead.org/pipermail/linux-mtd/2005-November/014496.html
> http://lists.infradead.org/pipermail/linux-mtd/2005-December/014521.html
>
>
>
> P.S: I've also downloaded ithe mtd version from 24th of November, 
> implements it in my kernel and patched with the same results. Is it 
> possible for you to say me where can I find your mtd version?
>
> Thank you,
>         Yuri Golovach
>
>
>
> *Vitaly Wool <vwool@ru.mvista.com>*
>
> 24.01.2006 15:02
>
> 	
> To
> 	yuri.golovach@mindspeed.com
> cc
> 	linux-mtd@lists.infradead.org
> Subject
> 	Re: [PATCH] treat OOB as a single chunk of oobavail bytes
>
>
>
> 	
>
>
>
>
>
> Hello Yuri,
>
> can you please specify what patches you did apply and what flash you're
> using. Thanks!
>
> Vitaly
>
> yuri.golovach@mindspeed.com wrote:
>
> >Good day Vitaly.
> >
> >I've tried your patches which modifies nand_base.c, other mtdfiles and
> >mtdutils to be compatible with yaffs2.
> >
> >Unfortunately, I've some issues with them.
> >
> >1)
> >        my version of mtd is newer then your and I was unable to patch
> >nand_base.c with your patch. So, I add this patch manually (but I'm not
> >sure - have I done some mistakes or             not).
> >
> >2)       After the kernel compiling with your patches I've started it 
> and
> >receive a long list of
> >                Bad eraseblock1 ... at ...x..................
> >
> >        After "mount" and "df" commands I saw that there is no free 
> space
> >on flash because all bloks were marked as "bad block" .
> >        Than I've tried patched version of flash_eraseall but it was not
> >able to see blocks also.
> >
> >
> >3) I've changed nand_bbt.c file (in the patched kernel) where simply
> >comment the bad blocks checking. Have booted from it and _successfully_
> >used patched flash_eraseall.
> >
> >4) Than I've start the patched kernel _with bad blocks checking_ but 
> these
> >(previously erased blocks) were marked like "bad blocks" again (in a
> >kernel booting procedure).
> >
> >
> >So, can you, please, provide your vision what should I do to run your
> >patch. Or you can send the link on the mtd line which supports yaffs2,
> >because I was unable to find your updates in CVS mainline :(
> >
> >Thank you,
> >        Yuri Golovach
> >
> >
> >  
> >
>
>
>
