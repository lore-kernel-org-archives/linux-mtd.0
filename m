Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmROq-0008FW-4H
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 13:45:04 +0000
Received: by iyh42 with SMTP id 42so1630016iyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 05:45:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1297002281.4460.6.camel@localhost>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
Date: Mon, 7 Feb 2011 13:44:58 +0000
Message-ID: <AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
Subject: Re: Testing a device using mtd_stresstest
From: David Peverley <pev@sketchymonkey.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Many thanks for the response ;

> MTD code is currently broken and CONFIG_MTD_NAND_VERIFY_WRITE causes
> errors when sub-pages are used. You should either disable this
> configuration option or fix MTD. We have this in our FAQ:
>
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail
I'm not sure what the implication of this is ; I understand that this
will cause the subpage test to fail with CONFIG_MTD_NAND_VERIFY_WRITE
enabled. However, the FAQ I had discounted as we use YAFFS2 and not
UBIFS. Given that should I still disable the write verify? At the
moment I'm inclined to leave it enabled as it seems to be regularly
catching failures that should not occur, such as the stress-test
failures noted.

We've also noticed that every so often we see "uncorrectable error:"
messages from nand_ecc.c - do you have any suggestions as to where to
start investigating here? So far I can't find a pattern to occurrences
or a regular way to reproduce.

Thanks again!

~Pev

On 6 February 2011 14:24, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Hi,
>
> On Mon, 2011-01-31 at 12:12 +0000, David Peverley wrote:
>> Question 1 : The =C2=A0mtd_subpagetest (which I suspect should fail as t=
he
>> device doesn't support sub-pages). I googled around and found a
>> reference that maybe I should add NAND_NO_SUBPAGE_WRITE to the
>> options. I tried this and it made no difference. Out of curiosity I
>> grepped through drivers/mtd and found that *no* drivers actully use
>> this bit anyway...! Is it reasonable to ignore this or ought I address
>> it? Should I set the flag and expect it to have an effect?
>
> MTD code is currently broken and CONFIG_MTD_NAND_VERIFY_WRITE causes
> errors when sub-pages are used. You should either disable this
> configuration option or fix MTD. We have this in our FAQ:
>
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail
>
>
>> Question 2 : The mtd_stresstest test fails after anywhere between 1000
>> and 200,000 operations. I'm certain this is a Bad Sign. It fails in
>> nand_base.c:nand_write_page() in the verification step enabled by
>> MTD_NAND_VERIFY_WRITE. When I tested this on our previous board (that
>> ostensibly works fine) it failed the stress test after 2.6M operations
>> instead. Should I be expecting to never see a failure of the stress
>> test or is an occasional verify failure reasonably expected?
>
> Yes, the test is expected to never fail. You should try to dig and
> understand why is it failing and what is the reason.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
