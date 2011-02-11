Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnuh6-0008SD-9C
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:14:01 +0000
Received: by fxm19 with SMTP id 19so2874426fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 07:13:58 -0800 (PST)
Subject: Re: Testing a device using mtd_stresstest
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Peverley <pev@sketchymonkey.com>
In-Reply-To: <AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 17:12:49 +0200
Message-ID: <1297437169.2760.54.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-07 at 13:44 +0000, David Peverley wrote:
> I'm not sure what the implication of this is ; I understand that this
> will cause the subpage test to fail with CONFIG_MTD_NAND_VERIFY_WRITE
> enabled. However, the FAQ I had discounted as we use YAFFS2 and not
> UBIFS. Given that should I still disable the write verify? At the
> moment I'm inclined to leave it enabled as it seems to be regularly
> catching failures that should not occur, such as the stress-test
> failures noted.

I do not know YAFFS, ask Charles, but I _think_ YAFFS does not use
sub-pages, so you han have that option enabled.

For sure, if you do not use sub-pages and it catches problems - have it
enabled and nail the problems down.

> We've also noticed that every so often we see "uncorrectable error:"
> messages from nand_ecc.c - do you have any suggestions as to where to
> start investigating here? So far I can't find a pattern to occurrences
> or a regular way to reproduce.

Not really - this can be incorrect timings or bad HW. I cannot give you
good suggestions.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
