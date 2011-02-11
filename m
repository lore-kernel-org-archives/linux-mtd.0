Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnukC-0008Vb-Uj
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:17:13 +0000
Received: by wyf22 with SMTP id 22so2462829wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 07:17:11 -0800 (PST)
Subject: Re: Testing a device using mtd_stresstest
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Peverley <pev@sketchymonkey.com>
In-Reply-To: <AANLkTikH6AtyN45Z7wA4tpaxXsLhGUnZZj=bpC18F=xn@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
	<AANLkTimJFv1Uy2c70ewPUHYH58rQHT=VsDa3ioU9hJZh@mail.gmail.com>
	<AANLkTikH6AtyN45Z7wA4tpaxXsLhGUnZZj=bpC18F=xn@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 17:16:02 +0200
Message-ID: <1297437362.2760.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Karl Beldan <karl.beldan@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-11 at 14:25 +0000, David Peverley wrote:
> Sometimes... When they are I've manually marked blocks as bad and
> re-started the test run :-D I had wondered about whether it was blocks
> naturally failing with use, but some of these blocks haven't been (Ok,
> SHOULDNT have been!) erased anywhere near 100,000 times so I'm
> suspicious about this. When I looked into it I noted that the
> mtd_stresstest.ko doesn't mark blocks as bad ever so this is
> potentially something that would occur.

Yeah, I think the tests should not do this, they should just test and
report you issues.

>  However, nandtest.c in
> mtd-utils I notice *does* support marking of bad blocks during
> testing. Should I consider using this instead? I'm not sure what the
> relationship between these test tools is...? 

These are tools wirtten by different people at different times. Kernel
MTD tests were written by Nokia guys and I think the tests are more or
less consistent in how they behave.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
