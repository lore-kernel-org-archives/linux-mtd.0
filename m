Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EtX3Z-0007mo-97
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2006 16:17:34 -0500
Message-ID: <43B99860.1010103@ru.mvista.com>
Date: Tue, 03 Jan 2006 00:17:20 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Ole Reinhardt <ole.reinhardt@kernelconcepts.de>
References: <1136219436.11699.55.camel@platon>
In-Reply-To: <1136219436.11699.55.camel@platon>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd with AMD AM29LV800DB nor flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

you might want to try patch from Todd Poynor sent to this list 
16.11.2005. If you wish, I can provide you the direct link to this email 
in the linux-mts mailing list archive.

Hope that helps,

Best regards,
   Vitaly

Ole Reinhardt wrote:

>Hello,
>
>I have a problem using 2.6.15-rc7'th mtd with an AMD AM29LV800DB nor
>flash device.
>
>The flash chip is connected to CS0 and is using 16bit bus width. It is
>recognised as AM29LV800BB, which is fully software and pin compatible to
>the AM29LV800DB device.
>
>Everything works quite fine, except writing / erasing. I tracked down
>the problem downto the following function:
>
>finfo_uaddr() in drivers/mtd/chips/jedec_probe.c
>
>I have a 16bit bus width, so I would expect it to return
>MTD_UADDR_0x0555_0x02AA, but there are the following lines:
>
>
>if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
>	/* ASSERT("The unlock addresses for non-8-bit mode
>	   are bollocks. We don't really need an array."); */
>	uaddr = finfo->uaddr[0];
>}
>
>In other words: For my flash chip, always MTD_UADDR_0x0AAA_0x0555 is
>returned.
>
>This is definatly the wrong unlock address for 16bit mode and every
>erase command will fail.
>
>If I comment out the "if (uaddr != MTD_UADDR_NOT_SUPPORTED ) ..."
>everything works fine.
>
>Can anybody explain me what's going wrong or is this a bug in the mtd
>code?
>
>Best regards,
>
>Ole Reinhardt
>
>  
>
