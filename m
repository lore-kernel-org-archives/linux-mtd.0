Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mb6ml-0005qU-97
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 05:54:11 +0000
Message-ID: <4A825873.4010202@gmail.com>
Date: Wed, 12 Aug 2009 08:51:47 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Andrew McKay <amckay@iders.ca>
Subject: Re: nand_update_bbt fix
References: <4A80A760.20901@iders.ca> <1250005159.25202.11.camel@localhost>
	<4A819637.7080501@iders.ca>
In-Reply-To: <4A819637.7080501@iders.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	JiSheng Zhang <jszhang3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/11/2009 07:03 PM, Andrew McKay wrote:
>>> out:
>>> - kfree(buf);
>>> + vfree(buf);
>>> return res;
>>> }
>>
>> I would disagree with this patch. Other people are fighting against
>> vmalloc, because they want to do DMA in their drivers, but they cannot.
>> I've CCed Zhang who is doing the opposite to what you do.
>
> I understand vmalloc is frowned upon in general, but then why is it
> already being used in nand_scan_bbt? Any fix that avoids vmalloc for
> nand_update_bbt should be used in nand_scan_bbt as well.

My position is:
   * vmalloc is a problem because it prevents DMA
   * kmalloc is a problem because large allocations of contiguous memory
     are impossible

Thus, I think people should invent some nice solution for the whole issue
instead of turning vmalloc's into kmallocks and back and forth. I'm CCing
David Brownell because AFAIR he was discussing similar things on lkml some
time ago.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
