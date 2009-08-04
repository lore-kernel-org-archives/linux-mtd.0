Received: from mail-yw0-f172.google.com ([209.85.211.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYJxV-0000eN-7T
	for linux-mtd@lists.infradead.org; Tue, 04 Aug 2009 13:21:45 +0000
Received: by ywh2 with SMTP id 2so10777219ywh.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Aug 2009 06:21:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A7705A9.3040402@users.sourceforge.net>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
	<20090730202637.GH16220@n2100.arm.linux.org.uk>
	<3972542e0907301408r7ae0c06bkf4417724dcec9459@mail.gmail.com>
	<20090730212155.GI16220@n2100.arm.linux.org.uk>
	<3972542e0907301429n45c4597ar36907386bf00637e@mail.gmail.com>
	<4A7705A9.3040402@users.sourceforge.net>
Date: Tue, 4 Aug 2009 08:21:36 -0500
Message-ID: <3972542e0908040621y551af6edna10c8e8d089ff544@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 3, 2009 at 10:43 AM, Anders
Grafstr=F6m<grfstrm@users.sourceforge.net> wrote:
> E Robertson wrote:
>> On Thu, Jul 30, 2009 at 4:21 PM, Russell King - ARM
>> Linux<linux@arm.linux.org.uk> wrote:
>>> It's worth pointing out that media errors should not cause a kernel
>>> oops or BUG() - especially in the case of a synchronous write.
>>>
>>> So one way to look at this is you have the perfect setup at the moment
>>> for jffs2 developers to fix this problem in addition to locating what
>>> ever is causing the CRC errors.
>>>
>>
>> agree. I'll test on this with 2.6.28.4/ .31-rc4.
>
> Could you try this patch?
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026754.html
>
>

I have tried this patch before. I think I found a post in april for
it. With it, on occasions it worked but other times
it did not. I will retry it a few more times to refresh myself to be
sure it was not an unrelated issue.
