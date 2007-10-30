Received: from rn-out-0910.google.com ([64.233.170.185]
	helo=rn-out-0102.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Imyqy-0003gm-21
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2007 17:42:34 -0400
Received: by rn-out-0102.google.com with SMTP id e25so780265rng
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Oct 2007 14:42:27 -0700 (PDT)
Message-ID: <79ac09b60710301442n7d7573fcu8e7dd71fe715c98@mail.gmail.com>
Date: Tue, 30 Oct 2007 16:42:26 -0500
From: Duke <ezbonites@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: jffs2: too few erase blocks
In-Reply-To: <20071030201945.GA16322@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <79ac09b60710261000y2c5a56d4x34ba3f00f657630f@mail.gmail.com>
	<20071028180223.GB14076@mail.shareable.org>
	<1193626747.2915.87.camel@shinybook.infradead.org>
	<20071029143818.GA29885@lazybastard.org>
	<20071029205125.GA27773@mail.shareable.org>
	<20071029215457.GB1027@lazybastard.org>
	<20071029224638.GA7122@mail.shareable.org>
	<20071030160948.GD13455@lazybastard.org>
	<79ac09b60710301308m294ae82m79e6ee982208ca35@mail.gmail.com>
	<20071030201945.GA16322@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Jamie Lokier <jamie@shareable.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/30/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Tue, 30 October 2007 15:08:11 -0500, Duke wrote:
> >
> > After all is said and done, can the minimum number of jffs2 blocks be
> > determined? Or it varies from system to system? Or flash system type
> > (NOR flash in my case).
>
> It can.  Please read jffs2_calc_trigger_levels() in fs/jffs2/build.c.
> Maybe those numbers can even be lowered a little.  But you get to do the
> math, if that is your wish.
>
Ok. From what I've calculated and tested I wouldn't be able to meet
the minimum so I'm trying to use one big jffs2 partition and devide by
dirs.
The problem I'm having with this is not being able to untar files into
a directory essentially overwriting the old files. This seem to be
because untaring takes too much memory. Is there a better way to
replace these directory files (which is about 200 files)?
