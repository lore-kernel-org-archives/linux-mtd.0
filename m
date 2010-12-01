Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PNjHI-0007YT-30
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 09:47:09 +0000
Message-ID: <4CF61995.9080609@aimvalley.nl>
Date: Wed, 01 Dec 2010 10:47:01 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: boaz ben david <boazbd@gmail.com>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
References: <20101129195014.19224240@wker>	<4CF4D4CA.8040906@aimvalley.nl>	<20101130163541.44c48a94@wker>
	<AANLkTikEDQyNttTcKgHLwhR53sYSFbtVK-oy2S3END46@mail.gmail.com>
In-Reply-To: <AANLkTikEDQyNttTcKgHLwhR53sYSFbtVK-oy2S3END46@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

boaz ben david wrote:
> Sorry to bump the thread but I'm having issues which I think are similiar
> with MLC NAND flash.
> Will reducing the write buffer help here too?
> 
> Thanks.
> 
> Boaz.
> 


no.
The CFI write buffer size is an attribute specific for NOR flash only.

---
N. van Bolhuis
