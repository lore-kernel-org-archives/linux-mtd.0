Received: from wproxy.gmail.com ([64.233.184.231])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZE7Q-0000mA-MO
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 17:33:52 -0400
Received: by wproxy.gmail.com with SMTP id i3so1813512wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Apr 2006 14:33:42 -0700 (PDT)
Message-ID: <f9d2a5e10604271433y34b72c19p22bb10c79b305d97@mail.gmail.com>
Date: Thu, 27 Apr 2006 14:33:42 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: "Andy Hawkins" <a.hawkins@cabletime.com>
In-Reply-To: <003301c66852$c7371280$153335bf@cabletime.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
	<003301c66852$c7371280$153335bf@cabletime.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/25/06, Andy Hawkins <a.hawkins@cabletime.com> wrote:
> Hi,
>
> > Should mtd handle bad blocks when using squashfs?
>
> I suspect you will have to write a simple 'translation layer' that
> automatically skips bad blocks. This is something we had to do in our
> device.
>
> Basically, if (for example) block 4 is bad, then any request for block 4
> should actually return block 5. Also, any request for block 5 should retu=
rn
> block 6 etc. etc. etc.
>

Even worse, NAND flash bits occasionally flip for no reason, ie, even
when the sector isn't bad. If you read a sector, and get an ecc
correction, you should rewrite the sector to a free sector, and then
mark the current sector as free.

So in other words, even with a read only filesystem, you need a good
FTL, unless you really don't care if units stop booting after a year
or two.
