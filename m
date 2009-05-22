Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7Ujg-0007uk-5z
	for linux-mtd@lists.infradead.org; Fri, 22 May 2009 13:24:50 +0000
Subject: Re: Problem to attach NAND MTD-device to UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kaius =?ISO-8859-1?Q?H=E4ggblom?= <kaius@oliotalo.fi>
In-Reply-To: <4A16A46B.8030302@oliotalo.fi>
References: <4A169E16.6010305@oliotalo.fi>  <4A16A46B.8030302@oliotalo.fi>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 May 2009 16:24:23 +0300
Message-Id: <1242998663.21646.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-22 at 16:11 +0300, Kaius Häggblom wrote:
> Set volume size to 129927168
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 1023:512, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
> 2147479551:0, PEB 1023
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 1022:512, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
> 2147479551:0, PEB 1022
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 1021:512, written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 
> 2147479551:0, PEB 1021
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 1020:512, written 0 bytes

http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail

?
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
