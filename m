Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pntvr-0007PR-AJ
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:25:12 +0000
Received: by iyh42 with SMTP id 42so2441317iyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:25:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimJFv1Uy2c70ewPUHYH58rQHT=VsDa3ioU9hJZh@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
	<AANLkTimJFv1Uy2c70ewPUHYH58rQHT=VsDa3ioU9hJZh@mail.gmail.com>
Date: Fri, 11 Feb 2011 14:25:07 +0000
Message-ID: <AANLkTikH6AtyN45Z7wA4tpaxXsLhGUnZZj=bpC18F=xn@mail.gmail.com>
Subject: Re: Testing a device using mtd_stresstest
From: David Peverley <pev@sketchymonkey.com>
To: Karl Beldan <karl.beldan@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Karl,

Sometimes... When they are I've manually marked blocks as bad and
re-started the test run :-D I had wondered about whether it was blocks
naturally failing with use, but some of these blocks haven't been (Ok,
SHOULDNT have been!) erased anywhere near 100,000 times so I'm
suspicious about this. When I looked into it I noted that the
mtd_stresstest.ko doesn't mark blocks as bad ever so this is
potentially something that would occur. However, nandtest.c in
mtd-utils I notice *does* support marking of bad blocks during
testing. Should I consider using this instead? I'm not sure what the
relationship between these test tools is...?

Cheers,

~Pev

On 11 February 2011 13:58, Karl Beldan <karl.beldan@gmail.com> wrote:
> On Mon, Feb 7, 2011 at 2:44 PM, David Peverley <pev@sketchymonkey.com>
> wrote:
>>
>> Hi Artem,
>>
>> Many thanks for the response ;
>>
>> > MTD code is currently broken and CONFIG_MTD_NAND_VERIFY_WRITE causes
>> > errors when sub-pages are used. You should either disable this
>> > configuration option or fix MTD. We have this in our FAQ:
>> >
>> > http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail
>> I'm not sure what the implication of this is ; I understand that this
>> will cause the subpage test to fail with CONFIG_MTD_NAND_VERIFY_WRITE
>> enabled. However, the FAQ I had discounted as we use YAFFS2 and not
>> UBIFS. Given that should I still disable the write verify? At the
>> moment I'm inclined to leave it enabled as it seems to be regularly
>> catching failures that should not occur, such as the stress-test
>> failures noted.
>>
>> We've also noticed that every so often we see "uncorrectable error:"
>> messages from nand_ecc.c - do you have any suggestions as to where to
>> start investigating here? So far I can't find a pattern to occurrences
>> or a regular way to reproduce.
>>
>
> By any chance, wouldn't those "uncorrectable errors" happen to be within the
> same pages/blocks each time ?
> --
> Karl
