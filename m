Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPaBk-0008WR-Fe
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 03:10:59 -0500
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext11.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l298AlWY004503
	for <linux-mtd@lists.infradead.org>; Fri, 9 Mar 2007 10:10:52 +0200
Message-ID: <45F11641.1010507@nokia.com>
Date: Fri, 09 Mar 2007 10:09:37 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Does mtd support two-plane page program for nand flash?
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
	<20070307143414.GA16439@lazybastard.org>
In-Reply-To: <20070307143414.GA16439@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Jörn Engel wrote:
> On Wed, 7 March 2007 14:57:02 +0800, falls huang wrote:
>>     AFAIK , the samsung's nand flash K9LAG08U0M/K9HBG08U1M/K9MCG08U5M
>> support two-plane page program. For example: The K9LAG08U0M is
>> arranged in four 4Gb memory planes.Each plane contains 2,048 blocks
>> and 2112 byte page registers. This allows it to perform simultaneous
>> page program and block erase by selecting one page or block from each
>> plane. ( refer to the datasheet of K9LAG08U0M)
> 
> Interesting.  I was wondering when devices like this would show up.
> Do you have a spec for those chips?

OneNAND DDP does this too (google: onenand "2x program")

I presume the possibility exists to have the driver pretend that the
page size is twice as large and there are half as many erase blocks.
It would have to map the addressses accordingly - and everything
else would have to be willing to accept a 4KiB page with 8
subpages and 128 bytes of oob.
