Received: from mail-ew0-f210.google.com ([209.85.219.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYP4k-0006qF-UH
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 19:21:51 +0000
Received: by ewy2 with SMTP id 2so1693864ewy.5
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 11:21:44 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1263724803.8276.138.camel@localhost.localdomain>
References: <152584231001141415x2086fed9rd8566b6609a87b7e@mail.gmail.com>
	<1263724803.8276.138.camel@localhost.localdomain>
Date: Fri, 22 Jan 2010 14:21:43 -0500
Message-ID: <152584231001221121u2ffc1816o18d71e6099f8fc6@mail.gmail.com>
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

On Sun, Jan 17, 2010 at 5:40 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2010-01-14 at 17:15 -0500, Jon Ringle wrote:
>> On ubi0, I have 3 volumes:
>> ubi0_0 kernel (static volume)
>> ubi0_1 squashfs (static volume)
>> ubi0_2 ubifs (dynamic volume)
>>
>> When I create the volumes, the static volumes are created first and
>> then the ubifs volume is created with whatever LEBs are left over. I
>> am using the squashfs and ubifs in a aufs2 union fs. When I need to
>> reflash either of the static volumes for an upgrade, and the new
>> images don't fit the space available in the LEBs reserved in the
>> corresponding static volume, I remove the ubifs volume to create space
>> and then recreate the ubifs volume again with what is remaining. This
>> is sub-optimal as this means that and data on the ubifs is now lost.
>
> Yes, this is not optimal. However, ubifs shrinking is not implemented.
> One could UBIFS ioctl to shring the FS, though, it should not be
> extremely difficult. It is about garbage-collecting the last LEBs to
> somewhere else, and amending the master block.
>
>> Is there a way to shrink a UBIFS if there are unused LEBs in the UBIFS?
>
> Not at the moment, this would need some development.

How about the opposite. If the static volumes became smaller freeing
up some LEBs. Can the UBIFS be expanded to make use of the freed LEBs?

Jon
