Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qs4f-0002Zy-W1
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 18:10:50 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id E6DCD6D00BD
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 13:06:54 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id C8BCC6D00BC
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 17:06:54 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Jun 2003 12:58:58 -0400
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	<200306131153.42657.f.callaghan@ieee.org>
	<1055521884.3632.158.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055521884.3632.158.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <200306131258.58729.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: Please Help, problem mounting jffs2
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 13 June 2003 12:31 pm, David Woodhouse wrote:
> On Fri, 2003-06-13 at 16:53, Frank R Callaghan wrote:
> > Thanks Sid, but I don't think I'm getting that far :(
> >
> > # mount -t jffs2 /dev/mtdblock0 /var/fixed_flash &
> > # mtdblock_open
> > ok
> >
> > # ps ax
> >
> >     6         root          0   D   [kupdated]
> >
> >    87 ttyS1   root        468   D   mount -t jffs2 /dev/mtdblock0
> > /var/fixed_fl
> >    88 ttyS1   root        468   R   mount -t jffs2 /dev/mtdblock0
> > /var/fixed_fl
>
> Why are there two mounts running simultaneously? What if you compile
> with CONFIG_JFFS2_FS_DEBUG=3D1 and set the console loglevel to 9 before
> mounting? Is it actually _doing_ anything or is it just deadlocked?
>
> If it's just deadlocked (and you're not using 2.4.18) then what was the
> last thing it said _before_ stopping?

jffs2_dump_block_lists:
flash_size: 00100000
used_size: 00000000
dirty_size: 00000000
wasted_size: 00000000
unchecked_size: 00000000
free_size: 00100000
erasing_size: 00000000
bad_size: 00000000
sector_size: 00010000
jffs2_reserved_blocks size: 00050000
nextblock: NULL
gcblock: NULL
clean_list: empty
very_dirty_list: empty
dirty_list: empty
erasable_list: empty
erasing_list: empty
erase_pending_list: 000f0000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 000e0000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 000d0000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 000c0000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 000b0000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 000a0000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00090000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00080000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00070000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00060000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00050000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00040000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00030000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00020000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00010000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erase_pending_list: 00000000 (used 00000000, dirty 00000000, wasted 00000=
000,=20
un
checked 00000000, free 00010000)
erasable_pending_wbuf_list: empty
free_list: empty
bad_list: empty
bad_used_list: empty
Not rotating empty clean_list
Not rotating empty very_dirty_list
Not rotating empty dirty_list
Not rotating empty erasable_list
Rotating erase_pending_list by 0
Erase block at front of erase_pending_list is at 000e0000
Not rotating empty free_list
jffs2_do_fill_super(): Getting root inode
jffs2_read_inode(): inode->i_ino =3D=3D 1
jffs2_do_read_inode(): getting inocache
jffs2_get_ino_cache(): ino 1
jffs2_get_ino_cache found 00000000 for ino 1
jffs2_do_read_inode(): Got inocache at 00000000
jffs2_do_read_inode(): Creating inocache for root inode
jffs2_add_ino_cache: Add c058d260 (ino #1)
jffs2_do_read_inode_internal(): ino #1 nlink is 1
jffs2_get_inode_nodes(): ino #1
jffs2_read_inode() returning
jffs2_do_fill_super(): d_alloc_root()
JFFS2: Garbage collect thread is pid 95

kernel 2.4.19 + RTAI + mtd<CVS> yesterday
Oops that was DEBUG=3D3 oh well the more info the better ;)
dmesg -n will only let me set level=3D8 max !

TIA,
	Frank.
