Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV44q-0000vk-IL
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 14:20:09 +0000
Received: by ewy23 with SMTP id 23so77222ewy.4
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 06:20:03 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1263370012.2917.9.camel@localhost>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
	<1263331836.3445.4.camel@localhost.localdomain>
	<152584231001121615h2b52b7ddv33980c9c4a88f37b@mail.gmail.com>
	<152584231001122303g66f776bdo57f6f08307f77dd0@mail.gmail.com>
	<1263369336.2917.6.camel@localhost>
	<1263370012.2917.9.camel@localhost>
Date: Wed, 13 Jan 2010 09:20:01 -0500
Message-ID: <152584231001130620y36fe8a4atcdc7ac356d79df23@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Deepak Saxena <dsaxena@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2010 at 3:06 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2010-01-13 at 09:55 +0200, Artem Bityutskiy wrote:
>> On Wed, 2010-01-13 at 02:03 -0500, Jon Ringle wrote:
>> > Looking into drivers/mtd/maps/ixp4xx.c I see that the read function is
>> > ixp4xx_read16(). It seems to me that there is an alignment problem.
>> > The read starts at offset 545 which in unaligned with a 16-bit read
>> > that is done by ixp4xx_read16().
>>
>> Yeah, most probably. Too bad we do not have a test for this. Care to
>> extend MTD tests?
>
> I mean, add an 'mtd_align', and verify reading from various unaligned
> addresses. This will help you to verify your flash, and help the
> community as well.

I fixed the issue in the ixp4xx map driver. I will look into creating
a mtd_aligntest as time permits.

Jon
