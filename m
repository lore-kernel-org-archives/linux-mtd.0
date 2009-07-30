Received: from mail-yx0-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWdBQ-0000w1-5o
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 21:29:08 +0000
Received: by yxe4 with SMTP id 4so1737568yxe.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 14:29:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090730212155.GI16220@n2100.arm.linux.org.uk>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
	<20090730202637.GH16220@n2100.arm.linux.org.uk>
	<3972542e0907301408r7ae0c06bkf4417724dcec9459@mail.gmail.com>
	<20090730212155.GI16220@n2100.arm.linux.org.uk>
Date: Thu, 30 Jul 2009 16:29:02 -0500
Message-ID: <3972542e0907301429n45c4597ar36907386bf00637e@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 4:21 PM, Russell King - ARM
Linux<linux@arm.linux.org.uk> wrote:
> On Thu, Jul 30, 2009 at 04:08:58PM -0500, E Robertson wrote:
>> On Thu, Jul 30, 2009 at 3:26 PM, Russell King - ARM
>> Linux<linux@arm.linux.org.uk> wrote:
>> > On Thu, Jul 30, 2009 at 03:14:43PM -0500, E Robertson wrote:
>> >> I got 2.6.31-rc4 and patch it which wasn't painful.
>> >> However, no change.
>> >> Here are the results: My initramfs initially mount the two nand
>> >> partitions and that's where the initial
>> >> uncorrectable error comes from.
>> >
>> > It would really help if you enabled verbose BUG reporting, so that
>> > people get a clear indication that it's a BUG() statement that's
>> > being hit.
>> >
>>
>> Yes, that's where it is.
>
> It's worth pointing out that media errors should not cause a kernel
> oops or BUG() - especially in the case of a synchronous write.
>
> So one way to look at this is you have the perfect setup at the moment
> for jffs2 developers to fix this problem in addition to locating what
> ever is causing the CRC errors.
>

agree. I'll test on this with 2.6.28.4/ .31-rc4.
