Received: from uproxy.gmail.com ([66.249.92.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQbxA-0005jS-9C
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 23:12:02 -0400
Received: by uproxy.gmail.com with SMTP id j3so666409ugf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Apr 2006 20:11:34 -0700 (PDT)
Message-ID: <625fc13d0604032011j530df95dj903c5743062fc444@mail.gmail.com>
Date: Mon, 3 Apr 2006 22:11:34 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3hd5anj51.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060329232520.1677d2b3.akpm@osdl.org>
	<442C0494.2040609@zytor.com> <20060330114014.53150d1b.akpm@osdl.org>
	<442C6B78.3060706@zytor.com> <m3hd5anj51.fsf@maxwell.lnxi.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/3/06, Eric W. Biederman <ebiederman@lnxi.com> wrote:
> "H. Peter Anvin" <hpa@zytor.com> writes:
>
> > There seems to be a few options, in order from least work to more work:
> >
> > - Removing the blkmtd driver and tell people to use block2mtd;
> > - Have kinit intercept blkmtd configuration options and emulate them us=
ing
> > block2mtd;
> > - Adjust blkmtd to have a configuration interface, and then make kinit =
configure
> > it.
>
> Block devices are not especially interesting when working with flash chip=
s, as they
> are an emulation layer.  The character devices are much more interesting,
> and the native filesystems don't go through a block or a character device=
.
> So killing blkmtd sounds like a reasonable thing to do.

Erm, you've got the idea behind blkmtd a bit backwards.  It's not to
make an MTD device show up as a block device.  It's to make a block
device show up as an MTD device.  Quite useful for testing JFFS2, etc
when one doesn't have immediate access to flash chips.  But that is
all beside the point.

> So I suggest what happens is that we deprecate blkmtd in Documentation/Fe=
atureRemoval
> of 2.6.17 and delete it in the -mm tree.
>
> Then you can merge klibc.
>
> Does any one have a problem with that plan?

I believe this sounds good.

josh
