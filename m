Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmRf0-0008SG-Sf
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 14:01:47 +0000
Received: by eyd9 with SMTP id 9so2078134eyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 06:01:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
Date: Mon, 7 Feb 2011 14:01:44 +0000
Message-ID: <AANLkTi=bWHno_87bRZU83fM6e7v8fKvNi2erpF6vQTNU@mail.gmail.com>
Subject: Re: Testing a device using mtd_stresstest
From: Andrew Murray <amurray@mpcdata.com>
To: David Peverley <pev@sketchymonkey.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7 February 2011 13:44, David Peverley <pev@sketchymonkey.com> wrote:
> We've also noticed that every so often we see "uncorrectable error:"
> messages from nand_ecc.c - do you have any suggestions as to where to
> start investigating here? So far I can't find a pattern to occurrences
> or a regular way to reproduce.

Are you using hardware ECC?

We switched from SW ECC to HW ECC and discovered that YAFFS2 was
writing over the ECC in the OOB. It may be wroth checking for any such
overlap of OOB use between the kernel-mtd/YAFFS2 and whatever boot
loaders you may have.

We worked around this issue by using in-band tags in our YAFFS2 image.

Thanks,

Andrew Murray
