Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZoPa-000867-2A
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 14:28:02 +0000
Message-ID: <47D939ED.2090909@parrot.com>
Date: Thu, 13 Mar 2008 15:27:57 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Binary Nandwrite/read to Flash
References: <47D91B98.20001@feig.de>
	<Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Manuel Sahm <Manuel.Sahm@feig.de>,
	Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> On Thu, 13 Mar 2008, Manuel Sahm wrote:
> 
>> Hello,
>>
>> is it possible to write directly to nandflash, or to store a file in 
>> nand flash ?
> 
> Yes, use the mtdtools applications nandwrite and nanddump in order to skip 
> bad blocks during read and write. You'll need the pad option to nandwrite 
> in order to fill out to an even multiple of the page size.
> 
> If you're writing a file, it really is raw byte by byte, with no 
> indication of file size, access times etc, so to the extent you need that 
> info you'll have to store it explicitly.
> 
And if bits flip appear you've got a problem : you need to rewrite the file.


Matthieu
