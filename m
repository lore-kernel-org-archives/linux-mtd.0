Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUoK0-00078o-S8
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 21:30:45 +0000
Received: by fg-out-1718.google.com with SMTP id e21so317397fga.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 13:30:38 -0800 (PST)
Subject: Re: Fail to mount ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
	<152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Jan 2010 23:30:36 +0200
Message-Id: <1263331836.3445.4.camel@localhost.localdomain>
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

On Tue, 2010-01-12 at 15:23 -0500, Jon Ringle wrote:
> On Mon, Jan 11, 2010 at 11:50 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > As this entry suggests:
> > http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
> >
> > - validate your flash/driver with the MTD tests - looks like you have a
> > problem there.
> 
> Trying to run mtd_readtest I get a seg fault:

Oh, yeas, you have NOR, the tests were made and used on NAND, and had
problems with NOR. But there was a fix recently:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/1ae356eafcdff6fa5c59d66072dc7577632a6d68

And you must be already have this one:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/4c2b8a62bb0e35f2db0f713b4101b265be7fa985

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
