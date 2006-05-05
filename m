Received: from nz-out-0102.google.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fc8Rz-0005xI-M1
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 18:07:06 -0400
Received: by nz-out-0102.google.com with SMTP id z6so788465nzd
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 May 2006 15:07:02 -0700 (PDT)
Message-ID: <c0c067900605051507o6c53c42cgf677d51154d5e75c@mail.gmail.com>
Date: Fri, 5 May 2006 18:07:02 -0400
From: "Dan Merillat" <harik.attar@gmail.com>
To: "David Vrabel" <dvrabel@arcom.com>
In-Reply-To: <c0c067900605051348u5f7edf0esd23ff0ced74f904e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
	<445B0CF1.8020400@arcom.com>
	<c0c067900605051348u5f7edf0esd23ff0ced74f904e@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 5/5/06, David Vrabel <dvrabel@arcom.com> wrote:
> >
> > Perhaps the cache invalidating operation in the MTD map driver you're
> > using is wrong?

And no such luck there, either.

static void pxa25x_map_inval_cache(struct map_info *map, unsigned long from=
,
                ssize_t len)
{
        consistent_sync((char *)map->cached + from, len, DMA_FROM_DEVICE);
}

map_info.inval_cache=3Dpxa25x_map_inval_cache;

Is that wrong? It is getting called after writes to flash.


>
> > If you suspect memory timings may be an issue I would advise slowing th=
e
> > timings under Linux to the lowest possible.  The experiment you describ=
e
> > here changes two variables (the software and the timings) which is not
> > good practice.

Tried it the other way around as well, set msc0 to boot-up paranoid
mode: 0x7ff07ff8 or longest waits on all reads/writes and no
burst-mode read.  No go, same deal.

# mount / -o remount,rw
# touch /tmp/test
# ls
JFFS2 notice: (1) read_unknown: node header CRC failed at 0x048f70.
But it must have been OK earlier.
Node totlen on flash (0x00800080) !=3D totlen from node ref (0x0000004c)
JFFS2 warning: (1) jffs2_do_read_inode_internal: no data nodes found for in=
o #47
/bin/sh: ls: Input/output error

(xscale-gdb) monitor long 0xff000000
Read long at 0xff000000 : 0x00800080
(xscale-gdb) monitor short 0xff0000aa =3D 0xff
Wrote short to 0xff0000aa : 0xff
(xscale-gdb) monitor long 0xff000000
Read long at 0xff000000 : 0xea000212

same deal, I can remount RO and use the filesystem (aside from /bin/ls
which is marked invalid until I reboot)

Trying vanilla 2.6.16.14 now.
