Received: from mgw-da01.ext.nokia.com ([147.243.128.24]
	helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PaR93-0002QW-Pg
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 11:03:12 +0000
Message-ID: <4D244FD0.4010208@nokia.com>
Date: Wed, 05 Jan 2011 13:02:40 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line
	partitioning
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>	
	<20101213122051.20685.46383.sendpatchset@ahunter-work.research.nokia.com>
	<1292421869.2512.56.camel@localhost>
In-Reply-To: <1292421869.2512.56.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15/12/10 16:04, ext Artem Bityutskiy wrote:
> On Mon, 2010-12-13 at 14:20 +0200, Adrian Hunter wrote:
>>  From d27a88c5f9f18a7c38784c085889c3e1053340cf Mon Sep 17 00:00:00 2001
>> From: Adrian Hunter<adrian.hunter@nokia.com>
>> Date: Wed, 30 Dec 2009 07:40:16 +0100
>> Subject: [PATCH 1/7] mtd: OneNAND: OMAP2/3: add support for command line partitioning
>>
>> Add the ability to parse MTD partition information from the
>> kernel command line.
>>
>> Note that a pointless BUG_ON is removed, as are redundant
>> calls to 'del_mtd_partitions()' and 'del_mtd_device()'
>> because they are also done by 'onenand_release()'.
>>
>> Finally note that 'add_mtd_device()' returns 1 on failure
>> so the error condition was incorrect.
>>
>> Signed-off-by: Adrian Hunter<adrian.hunter@nokia.com>
>
> I've pushed patches 1 and 7 to l2-mtd-2.6, but patch #2 is not
> applicable. I think this is because of changes Kyungmin made recently.
> Could you please re-send patches 2 and 3 on top of the l2 tree?

I just tried to apply them to l2 and they applied fine as is.
Has something changed?  Do I have the wrong tree?

	git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

>
> I guess I can apply 2 and 3 now. Patch 4 should wait for comments from
> Tony, AFAICS. Patches 5 and 6 are dependent, and hence should wait as
> well, AFAICS.
>
