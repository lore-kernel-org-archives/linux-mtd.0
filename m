Received: from nproxy.gmail.com ([64.233.182.205])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ewk6K-0001wD-Il
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 17:49:37 +0000
Received: by nproxy.gmail.com with SMTP id k27so160180nfc
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jan 2006 09:48:26 -0800 (PST)
Message-ID: <6934efce0601110948s40f7306bv28c022275d52e6d5@mail.gmail.com>
Date: Wed, 11 Jan 2006 09:48:26 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: James Hughes <JHughes@linx.co.uk>
In-Reply-To: <DB1B6B12D0E2F0469EB35A9586066B6ECE799D@stivesemail.stives.linx.gbr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <DB1B6B12D0E2F0469EB35A9586066B6ECE799D@stivesemail.stives.linx.gbr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FW: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Is the map being registered?
> > Is the logic in the map ever executing the probe?
> > You'll have to debug that first.

Please answer these questions before asking others.

> Although the driver is being registered, I get no output from any MTD stu=
ff
> at all (even with debugging turned on) - its almost as if its not there,
> although it is enabled in the kernel build. Is there something in rootfs
> that needs to be set up for MTD - as I have constructed my own rootfs, I =
may
> have missed something that I need.

You didn't answer either of my questions.  You said you created a map
file.  Is it being called?  If not, then you must ensure that it is.

> Can anyone point me in the directly of which files I need to look at that
> firstly register the MTD drivers, then run the probes,

Yes.  I did.

The map driver regarding which you didn't answer the simple questions,
is where the probing usually happens.

>so I know where to
> start my debugging. I don't have an emulator to debug the kernel yet - on=
ly
> (k)gdb if necessary.

At this point a few simple printk()s in the map driver would tell us a lot.
