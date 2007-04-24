Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgIXB-0000HR-9f
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 06:46:11 -0400
Message-ID: <462DDFEF.4070604@ru.mvista.com>
Date: Tue, 24 Apr 2007 14:46:07 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<462DDD04.5020405@ru.mvista.com>
	<20070424103827.GC1748@xi.wantstofly.org>
In-Reply-To: <20070424103827.GC1748@xi.wantstofly.org>
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

Lennert Buytenhek wrote:
> On Tue, Apr 24, 2007 at 02:33:40PM +0400, Ruslan V. Sushko wrote:
>
>   
>> The patch adds glue logic to support MTD for NAND flash devices on
>> Intel IXP4xx based platform
>>     
>
> Hmm, the IXP4xx doesn't have an on-chip NAND controller, does it?
> Is this for NAND flashes connected to the expansion bus?  Maybe we
> need something a la physmap for NAND flashes..
>   
Yes, It's true the NAND flash is connected to expansion bus. The driver 
has two parts: The common glue logic submitted here and the platform 
specific (evaluation board) definition submitted to 
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4323/2
All maps defined in last patch
