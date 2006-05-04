Received: from nz-out-0102.google.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fbihk-0002aB-SB
	for linux-mtd@lists.infradead.org; Thu, 04 May 2006 14:37:41 -0400
Received: by nz-out-0102.google.com with SMTP id z6so523645nzd
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 May 2006 11:37:35 -0700 (PDT)
Message-ID: <c0c067900605041137r2f90ebc7kd56a24c10c08152@mail.gmail.com>
Date: Thu, 4 May 2006 14:37:35 -0400
From: "Dan Merillat" <harik.attar@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.64.0605040909570.28543@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
	<Pine.LNX.4.64.0605032257120.28543@localhost.localdomain>
	<c0c067900605040020n74a74da8s4ed1c3cd0abc3fed@mail.gmail.com>
	<Pine.LNX.4.64.0605040909570.28543@localhost.localdomain>
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/4/06, Nicolas Pitre <nico@cam.org> wrote:
> On Thu, 4 May 2006, Dan Merillat wrote:
>
> > > > Write error in obliterating obsoleted node at 0x00102318: -30
> > >
> > > -30 is -EROFS.
> > >
> > > Did you unlock the flash sectors before mounting JFFS2?
> >
> > I wish it were that simple.
>
> Still, did you unlock the flash sectors?

YES, I unlocked the flash sectors.  Both partiions, all regions.  And
if the WP# line is being dropped/raised it would re-protect all the
sectors, which it's not.  I can run the commandline flash_unlock and
flash_erase (which, of course, trash everything and I have to re-flash
afterwards.)

Also, if the sectors are locked, then it's still a bug to stay in
status register mode.  A read-only flash is a valid configuration, and
should result in a read-only filesystem, not an unusable filesystem.

I verified again and again, I don't know why I got a EROFS and I wish
to god I hadn't pasted it.  No other run has gotten me this result
unless I deliberatly lock the sectors before starting linux.  I just
verified with a very slow erase all, re-upload jffs2 filesystem over
115200 serial, re-flash, crc32 verify the contents, and fill the
remaining flash with 0x0.   U-boot has no problems performing any of
this, so the flash is indeed unlocked.  Then I started linux and ended
up with the same deal, after a write whatever the first read happens
to be returns 0x0080 and gets all sorts of wacky corruption errors.
