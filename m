Received: from polonez.inetia.pl ([195.114.161.60])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHqXB-0007bK-2Z
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 20:15:13 +0000
Received: from www.n1.pl (www.n1.pl [195.114.173.151])
 by polonez.inetia.pl (Sun Internet Mail Server sims.4.0.1999.06.13.00.20)
 with ESMTP id <0HNY006075K6KR@polonez.inetia.pl> for
 linux-mtd@lists.infradead.org; Thu,  6 Nov 2003 21:14:31 +0100 (MET)
Date: Thu, 06 Nov 2003 21:13:24 +0100
From: andrzej.mialkowski@inetia.pl
In-reply-to: <20031106091734.GA9616@plexity.net>
To: dsaxena@plexity.net
Message-id: <1068149604.3faaab64b7a3a@imail.internetia.pl>
MIME-version: 1.0
References: <20031106091734.GA9616@plexity.net>
Content-type: text/plain; charset=ISO-8859-2
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Remove hardcoded number of CFI chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cytowanie Deepak Saxena <dsaxena@plexity.net>:

> 
> All, 
> 
> The attached patch is an update of the patch I posted about a month
> ago [1] that removes the hardcoded CFI_MAX_CHIPS, which was originally
> written by Andrzej Mialkowski @ Intel.  This patch fixes two issues:
> 
> - Get rid of extra structure probe_info that was just carrying around 
>   a long* variable.
This 'stupid' single field structure was intentional to allow easier expansion 
if somebody fill need for additional fields.
> 
> - Fix bug in bitmap size on systems with 2-8 chips. The old patch had:
> 
>   +	max_chips = map->size >> cfi.chipshift;
>   +	probe.chip_map = kmalloc((max_chips + 7) / 8, GFP_KERNEL);
> 
>   This would cause systems with 2-8 chips to be allocated only one
>   byte for the bitmap instead of the 2 needed. Fixed code does:
> 
>   +  max_chips = map->size >> cfi.chipshift;
>   +  chip_map = kmalloc((max_chips / 8) + ((max_chip % 8) ? 1 : 0),
> GFP_KERNEL);
> 
Why I need two bytes to store up to 8 bits? By the way 2/8 + 2?1:0 = 1.
Initially I thought to put higher alignment here for instance ((max_chips + 
31) / 32)*4) but found no reason to do this. Maybe I was wrong...

Andrzej


 
