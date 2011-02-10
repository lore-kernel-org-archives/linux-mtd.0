Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnVfQ-0003nM-6l
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 12:30:37 +0000
Received: by iwn38 with SMTP id 38so1224361iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Feb 2011 04:30:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=UgsLq3=7ma9MPJJBVxtNvyr=ThtLPy8qzC3Bk@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
	<AANLkTi=UgsLq3=7ma9MPJJBVxtNvyr=ThtLPy8qzC3Bk@mail.gmail.com>
Date: Thu, 10 Feb 2011 12:30:33 +0000
Message-ID: <AANLkTi=2vgGGUdD71c4P8MASyC1zuKTKrqTpidF2i-R6@mail.gmail.com>
Subject: Re: Testing a device using mtd_stresstest
From: David Peverley <pev@sketchymonkey.com>
To: Andrew Murray <amurray@mpcdata.com>
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

Hi Andy!

Actually, we're using SW ECC so I'd assumed that we should be free of
this particular issue. It in our configuration MTD is controlling the
OOB area which reserves the first two bytes for BB marking and the
last 24 bytes for ECC. The remaining 38 bytes are in oobfree for YAFFS
to use. As I understand it the yaffs packed tags struct stored there
is 12 bytes so I *think* it's OK?

Cheers,

~Pev

On 7 February 2011 13:56, Andrew Murray <amurray@mpcdata.com> wrote:
> On 7 February 2011 13:44, David Peverley <pev@sketchymonkey.com> wrote:
>>
>> We've also noticed that every so often we see "uncorrectable error:"
>> messages from nand_ecc.c - do you have any suggestions as to where to
>> start investigating here? So far I can't find a pattern to occurrences
>> or a regular way to reproduce.
>
> Are you using hardware ECC?
> We switched from SW ECC to HW ECC and discovered that YAFFS2 was writing
> over the ECC in the OOB. It may be wroth checking for any such overlap of
> OOB use between the kernel-mtd/YAFFS2 and whatever boot loaders you may
> have.
> We worked around this issue by using in-band tags in our YAFFS2 image.
> Thanks,
> Andrew Murray
