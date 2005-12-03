Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EifRY-00009z-PW
	for linux-mtd@lists.infradead.org; Sat, 03 Dec 2005 17:01:28 -0500
Received: by zproxy.gmail.com with SMTP id m22so735416nzf
	for <linux-mtd@lists.infradead.org>;
	Sat, 03 Dec 2005 14:01:19 -0800 (PST)
Message-ID: <6934efce0512031401k53773958l5f1de36f2128d745@mail.gmail.com>
Date: Sat, 3 Dec 2005 14:01:19 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <43839A91.6010101@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
	<43839A91.6010101@mvista.com>
Cc: linux-mtd@lists.infradead.org, "Menon, Nishanth" <x0nishan@ti.com>
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/22/05, Todd Poynor <tpoynor@mvista.com> wrote:
> Menon, Nishanth wrote:
>
> > Sibley: buffer write error (status 0x190)
>
> According to the datasheet that looks like:
>
> SR[9] SR[8] SR[4]
> 0     1     1     =3D Error - Attempted rewrite to Object Mode region
>
> but I've no clue what causes it...
>
> --
> Todd
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


Oh you used the MTD's flash_eraseall -j /dev/mtdX.  Yeah...

That would do it.  That's got me before too I think.  This writes a
header to each block and then JFFS2 with writebuffer will step on that
already written to Programming Region and you give you this error.


Technical Explanation:

For M18 you can't do Word Programs to a Programming Region (1KB
region) after a Buffered Program has been done there _unless_ your
Buffered Program had a data pattern that puts the Programming Region
in Object Mode.  More details at
(http://developer.intel.com/design/flcomp/products/M18/techdocs.htm)

Moral of the story:  Don't write to the same 1KB chunk of M18 unless
you know very well what you are doing.  If you get 0x190 that what you
did.
