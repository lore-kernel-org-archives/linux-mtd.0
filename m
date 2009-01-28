Received: from carallon.force9.co.uk ([80.229.37.120] helo=carallon.f9.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSAJi-0001KH-5l
	for linux-mtd@lists.infradead.org; Wed, 28 Jan 2009 13:18:56 +0000
Received: from [127.0.0.1] by carallon.f9.co.uk (MDaemon PRO v9.6.5)
	with ESMTP id md50000339295.msg
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2009 13:18:52 +0000
Message-ID: <49805B48.30501@carallon.com>
Date: Wed, 28 Jan 2009 13:19:04 +0000
From: Will Wagner <will_wagner@carallon.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: NAND and JFFS2 newbie question
References: <497F3CBF.4000309@carallon.com>
	<49804FA3.7010604@kernelconcepts.de>
In-Reply-To: <49804FA3.7010604@kernelconcepts.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nils Faerber wrote:

>> I am wanting to create a JFFS2 partition on the device. The partition is created using:
>>
>> mkfs.jffs2 -s 2 -e 128 -c 12 -o fs.jffs2 -r jffs2_fs
> 
> I guess one of the problems will be that the sizes you specified are way
> too small. Fomr the man-page of mkfs.jffs2:
> "Options that take SIZE arguments can be specified as either decimal
> (e.g., 65536), octal (0200000), or hexidecimal (0x1000)"
> 

The man page seemed to imply that values under 4096 would be treated as KiB so -e 128 
should be correct. However the page size looks like it doesn't do that and so it should be 
set to 2048.

As an aside do I need to specify the -c option or is it not needed? If it is needed is 12 
the correct size for the clean marker?

Thanks,

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner@carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
