Received: from mail-ew0-f220.google.com ([209.85.219.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NbnTq-0002jo-7b
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 04:01:47 +0000
Received: by ewy20 with SMTP id 20so4700389ewy.20
	for <linux-mtd@lists.infradead.org>;
	Sun, 31 Jan 2010 20:01:40 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1264610155.1973.46.camel@localhost>
References: <152584231001141415x2086fed9rd8566b6609a87b7e@mail.gmail.com>
	<1263724803.8276.138.camel@localhost.localdomain>
	<152584231001221121u2ffc1816o18d71e6099f8fc6@mail.gmail.com>
	<1264609500.1973.42.camel@localhost>
	<152584231001270834l49147b4di6c825acd42a76f8d@mail.gmail.com>
	<1264610155.1973.46.camel@localhost>
Date: Sun, 31 Jan 2010 23:01:40 -0500
Message-ID: <152584231001312001s51aa46c3y8c992d7f14c69f1a@mail.gmail.com>
Subject: Re: shrinking ubifs?
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 27, 2010 at 11:35 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2010-01-27 at 11:34 -0500, Jon Ringle wrote:
>> On Wed, Jan 27, 2010 at 11:25 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > On Fri, 2010-01-22 at 14:21 -0500, Jon Ringle wrote:
>> >> How about the opposite. If the static volumes became smaller freeing
>> >> up some LEBs. Can the UBIFS be expanded to make use of the freed LEBs?
>> >
>> > That works automatically. UBIFS expands automatically, but up to the
>> > size which you specified with the '-c' mkfs.ubifs option.
>>
>> Can the same thing be done using ubimkvol?
>> ubimkvol -m -N ubifs /dev/ubi0
>
> Sorry, I don't understand the question...

I create my ubi volumes from an initramfs environment that is compiled
against klibc. So far, I haven't been able to build mkfs.ubifs against
klibc, so I create my ubifs volume by using ubimkvol and then mounting
it as ubifs.

Jon
