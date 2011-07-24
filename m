Received: from mail-fx0-f43.google.com ([209.85.161.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qkt7R-0001DW-Ax
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2011 07:28:58 +0000
Received: by fxg17 with SMTP id 17so5890391fxg.16
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Jul 2011 00:28:53 -0700 (PDT)
Subject: Re: ubifs: missing FAQ item regarding default compression options?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Sun, 24 Jul 2011 10:28:45 +0300
In-Reply-To: <CAGq3pz7XqJvapBQyiAuwvKMZekmXC-Nc4UugUB5H4ApHZo8aDw@mail.gmail.com>
References: <CAGq3pz7XqJvapBQyiAuwvKMZekmXC-Nc4UugUB5H4ApHZo8aDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1311492529.2855.2.camel@koala>
Mime-Version: 1.0
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

On Sun, 2011-07-24 at 00:02 +0100, Daniel Drake wrote:
> Hi,
> 
> OLPC is looking more seriously at making the switch from jffs2 to
> ubifs. We did this for a few months but we found that ubifs has
> significantly higher (10-15%) disk space requirements for the same
> data, compared with jffs2. We switched back to jffs2 because of this,
> promising to look at ubifs again later (i.e. now).
> 
> What I didn't realise clearly at the time is that mkfs.jffs2 defaults
> to zlib compression, and mkfs.ubifs defaults to LZO compression. So,
> this was not a fair test. If I switch ubifs to zlib compression, it
> produces results very similar to jffs.
> 
> For example, for one OS image, mkfs.jffs2 + sumtool produced a 664mb
> file. mkfs.ubifs (with zlib selected) + ubinize created a 668mb image
> of the same data - very comparable.
> 
> Should this be a FAQ entry? Others who aren't aware of this difference
> in default compression options may run into the same non-issue.

Hi Daniel,

sure, send a patch against the mtd-www repo:

git://git.infradead.org/mtd-www.git

and add this piece of information. The web site is very simple and
you'll find out how to edit it easily. Then type "make" to build it.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
