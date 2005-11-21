Received: from zproxy.gmail.com ([64.233.162.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeCCQ-00035O-Bk
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 08:59:18 -0500
Received: by zproxy.gmail.com with SMTP id i11so759326nzi
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Nov 2005 05:59:12 -0800 (PST)
Message-ID: <625fc13d0511210559y209008e4v12ac983ba77c69c1@mail.gmail.com>
Date: Mon, 21 Nov 2005 07:59:12 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: alfred hitch <alfred.hitch@gmail.com>
In-Reply-To: <29f916510511202301j77983cedh7fd9392df018806a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <29f916510511202301j77983cedh7fd9392df018806a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: files getting corrupted ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/05, alfred hitch <alfred.hitch@gmail.com> wrote:
> Hi,
>
> Need suggestions on a problem we are facing after a lot of usage and rebo=
ots.

NEEDINFO.  kernel version, MTD version, flash chip type, etc.

>
> ( Very basic questions )
>
> On the jffs2 (rw) partition, with MTD layer used to acceess it.
> We are observing executable file corruptions.
> If we jtag again, things are ok:
>  -> Meaning flash isn't corrupted (?)
>
>  -> It's an executable, so will adding sync anyways make a difference
> to reboot we have (not normal reboot command), but will it make any
> difference as it's to clear file i/o buffer s ?

Depends on the flash chip type.  Anything that uses the write buffer
will benefit from sync before reboot.  Even better, remount the fs as
read-only before reboot.

>
>  Read on an article on net that in basics of embedded design:
> ( http://www.linuxdevices.com/articles/AT2055943458.html )
>
>  -> Wear levelling should always been considered, wont MTD serve purpose =
here ?

No, MTD doesn't do wear leveling.  JFFS2 does.

>
>  -> What will be a good strategy for read / write of
> /var/log/messages, if writting in delayed / buffer forms isnt
> acceptable ?

One that writes as infrequently as possible to flash.

>
> -> jffs rw partition can affect due to frequent  write's
> executables(read only) in partition also
>  Executable in question happened to be sh(shell) !  a diff shows
> certain from middle of file were lost !

If you really want a section of flash to be read-only, partition it that wa=
y.

josh
