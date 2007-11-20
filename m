Received: from ims.2wire.com ([206.171.6.87])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IucpZ-0001vq-10
	for linux-mtd@lists.infradead.org; Tue, 20 Nov 2007 18:48:43 -0500
Message-ID: <474372DE.7020707@kenati.com>
Date: Tue, 20 Nov 2007 15:50:54 -0800
From: Carlos Munoz <carlos@kenati.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: How to map nand chip ?
References: <4739FA7A.9050403@kenati.com> <473C9D46.9060007@kenati.com>
	<Pine.LNX.4.64.0711152241450.11612@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0711152241450.11612@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Ricard Wanderlof wrote:
> Another thing that can cause this is if the ready/busy-pin is not read 
> properly by the chip driver. Again, the chip will probably respond quickly 
> to an id request, but when reading or writing the memory array, the access 
> times will be longer causing failure.
>
>   

That was the problem. The ready/busy pin was not working. Somehow, it's 
always high.

For now I added a 20 usec delay and everything works.

Thanks,


Carlos
