Received: from [212.209.10.221] (helo=krynn.se.axis.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwdlC-0001kb-I1
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 04:58:51 -0500
Received: from vin (vin.se.axis.com [10.92.142.1])
	by krynn.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with SMTP id
	j139wgcV022370
	for <linux-mtd@lists.infradead.org>; Thu, 3 Feb 2005 10:58:42 +0100
Date: Thu, 3 Feb 2005 10:58:42 +0100
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050203095842.GA20345@axis.com>
References: <20050202110715.GH27015@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20050202110715.GH27015@axis.com>
Subject: Re: Device ID collision in amd_flash.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 02, 2005 at 12:07:16PM +0100, Jonas Holmberg wrote:
> The (obsolete) AMD NOR-flash driver has an "probe-table-entry" for 
> AM29BDS643D that happens to match AM29DL640G as well, even though they  
> have different block/sector-layouts.
> 
> I think the problem is that AMD is assigning device-IDs of more than 
> 16-bits.  Anyhow, both AM29BDS643D and AM29DL640G supports CFI, so I 
> would like to remove support for them in amd_flash.c (patch below) to 
> avoid problems.
> 
> OK to commit?

Silly me, who cares about obsolete drivers...
Let me rephrase that question: Any objections before I commit on 
friday (tomorrow)?

I still would like to know how bugfixes finds their way into Linux 
2.4. As I understand, the main trunk in CVS is for 2.6 and I can't 
find any 2.4-branch...

Best regards
/Jonas

> 
> /Jonas
> 
> PS. Would this patch ever find it's way into Linux 2.4 or just Linux 
> 2.6?
> 
> 
> 
> RCS file: /home/cvs/mtd/drivers/mtd/chips/amd_flash.c,v
> retrieving revision 1.26
> diff -u -r1.26 amd_flash.c
> --- amd_flash.c 20 Nov 2004 12:49:04 -0000      1.26
> +++ amd_flash.c 2 Feb 2005 11:03:07 -0000
> @@ -67,7 +67,6 @@
>  #define AM29LV160DT    0x22C4
>  #define AM29LV160DB    0x2249
>  #define AM29BDS323D     0x22D1
> -#define AM29BDS643D    0x227E
>  
>  /* Atmel */
>  #define AT49xV16x      0x00C0
> @@ -618,17 +617,6 @@
>                         { .offset = 0x3f0000, .erasesize = 0x02000, .numblocks =  8 },
>                 }
>         }, {
> -               .mfr_id = MANUFACTURER_AMD,
> -               .dev_id = AM29BDS643D,
> -               .name = "AMD AM29BDS643D",
> -               .size = 0x00800000,
> -               .numeraseregions = 3,
> -               .regions = {
> -                       { .offset = 0x000000, .erasesize = 0x10000, .numblocks = 96 },
> -                       { .offset = 0x600000, .erasesize = 0x10000, .numblocks = 31 },
> -                       { .offset = 0x7f0000, .erasesize = 0x02000, .numblocks =  8 },
> -               }
> -       }, {
>                 .mfr_id = MANUFACTURER_ATMEL,
>                 .dev_id = AT49xV16x,
>                 .name = "Atmel AT49xV16x",
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
