Received: from smtp6-g21.free.fr ([212.27.42.6])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QOrqX-00089S-I1
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 13:40:30 +0000
Message-ID: <4DDBB542.7020506@free.fr>
Date: Tue, 24 May 2011 15:40:18 +0200
From: Robert Jarzmik <robert.jarzmik@free.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: Add DiskOnChip G3 support
References: <1306074869-5533-1-git-send-email-robert.jarzmik@free.fr>
	<1306221756.2785.51.camel@localhost>
In-Reply-To: <1306221756.2785.51.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: joern@lazybastard.org, dwmw2@infradead.org,
	Robert Jarzmik <robert.jarzmik@atosorigin.com>,
	linux-mtd@lists.infradead.org
Reply-To: robert.jarzmik@free.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/24/2011 09:22 AM, Artem Bityutskiy wrote:
> On Sun, 2011-05-22 at 16:34 +0200, Robert Jarzmik wrote:
>> From: Robert Jarzmik<robert.jarzmik@atosorigin.com>
>>
>> Add support for DiskOnChip G3 chips. The support is quite
>> limited yet :
>>   - no flash writes/erases are implemented
>>   - ECC fixes are not implemented
>>   - powerdown is not implemented
>>   - IPL handling is not yet done
>>
>> On the brighter side, the chip reading does work.
>>
>> Signed-off-by: Robert Jarzmik<robert.jarzmik@atosorigin.com>
> Hi,
>
> the driver looks neat from the first glance, but I did not review it. We
> have just changed mtd partitions API, today. You'll need to amend the
> driver and re-send.
Yes, I have seen them. I'll amend it, no big deal.

I'll wait 1 or 2 weeks for a review, and if nobody steps up, I'll resend 
the amended version for mtd_register stuff, and push for an inclusion 
into -next.

Cheers.

--
Robert
