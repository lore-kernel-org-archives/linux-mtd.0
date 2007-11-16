Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IsycX-0003H5-Bt
	for linux-mtd@lists.infradead.org; Fri, 16 Nov 2007 05:40:28 -0500
Message-ID: <473D73D6.5010209@gmx.net>
Date: Fri, 16 Nov 2007 11:41:26 +0100
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: How to map nand chip ?
References: <4739FA7A.9050403@kenati.com> <473C9D46.9060007@kenati.com>
	<Pine.LNX.4.64.0711152241450.11612@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0711152241450.11612@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15.11.2007 22:44, Ricard Wanderlof wrote:
> On Thu, 15 Nov 2007, Carlos Munoz wrote:
>
>   
>> When I load the nand driver module, the nand chip is detected correctly
>> but it seems all the erase blocks are bad. I wonder if it's caused by
>> the wrong timings when accessing the nand chip. However, the
>> manufacturer and chip id are read correctly. Does anyone know what may
>> be the cause for these errors ?
>>     
>
> The timing requirements when reading chip id's are not as severe as when 
> actually accessing the memory, so if you are just below the limit, you can 
> get the id ok but other things fail.

Side note: I have seen very old chips (from 1999, don't remember whether
they were NAD though) where reading chip IDs needed longer timing than
reading memory, but that is not the case here.


Regards,
Carl-Daniel
