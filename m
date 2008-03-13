Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZp6Q-00025z-2x
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 15:12:18 +0000
Message-ID: <47D94451.7080108@feig.de>
Date: Thu, 13 Mar 2008 16:12:17 +0100
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Binary Nandwrite/read to Flash
References: <47D91B98.20001@feig.de>
	<Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
	<47D92581.1030007@feig.de>
	<Pine.LNX.4.64.0803131448330.6032@lnxricardw.se.axis.com>
	<47D938C1.6040804@feig.de>
	<Pine.LNX.4.64.0803131525230.6032@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0803131525230.6032@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Ricard Wanderlof schrieb:
>
> On Thu, 13 Mar 2008, Manuel Sahm wrote:
>
>> Thank you very much....
>>
>> Is it possible to write/read to the NAND flash "directly" without an 
>> partition ?(/dev/mtdX) ?
>
> No, but you can set up a /dev/mtdX device to span the whole device, 
> even if you then have additional /dev/mtdX devices which refer to 
> partitions.
>
> /Ricard
> -- 
> Ricard Wolf Wanderlöf                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
Thank you,

it´s very dangerous, because if I use the wrong address I´ll kill my 
system :-)

Is ther a possibility to make the /dev/mtdX read only (write protected) ?

Thank you


Best regards 

Manuel Sahm	
