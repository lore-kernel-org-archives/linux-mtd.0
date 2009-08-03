Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXzhP-00070u-39
	for linux-mtd@lists.infradead.org; Mon, 03 Aug 2009 15:43:47 +0000
Message-ID: <4A7705A9.3040402@users.sourceforge.net>
Date: Mon, 03 Aug 2009 17:43:37 +0200
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: E Robertson <e.robertson.svg@gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>	<200907302036.24243.marek.vasut@gmail.com>	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>	<20090730202637.GH16220@n2100.arm.linux.org.uk>	<3972542e0907301408r7ae0c06bkf4417724dcec9459@mail.gmail.com>	<20090730212155.GI16220@n2100.arm.linux.org.uk>
	<3972542e0907301429n45c4597ar36907386bf00637e@mail.gmail.com>
In-Reply-To: <3972542e0907301429n45c4597ar36907386bf00637e@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	linux-arm-kernel@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

E Robertson wrote:
> On Thu, Jul 30, 2009 at 4:21 PM, Russell King - ARM
> Linux<linux@arm.linux.org.uk> wrote:
>> It's worth pointing out that media errors should not cause a kernel
>> oops or BUG() - especially in the case of a synchronous write.
>>
>> So one way to look at this is you have the perfect setup at the moment
>> for jffs2 developers to fix this problem in addition to locating what
>> ever is causing the CRC errors.
>>
> 
> agree. I'll test on this with 2.6.28.4/ .31-rc4.

Could you try this patch?

http://lists.infradead.org/pipermail/linux-mtd/2009-August/026754.html
