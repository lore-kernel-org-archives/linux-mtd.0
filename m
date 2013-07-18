Received: from mail-oa0-x22b.google.com ([2607:f8b0:4003:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UziN2-0002Sq-VY
 for linux-mtd@lists.infradead.org; Thu, 18 Jul 2013 07:11:25 +0000
Received: by mail-oa0-f43.google.com with SMTP id i7so3758214oag.2
 for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2013 00:11:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7f412749.1fc36.13f8b41f860.Coremail.zhengun23@126.com>
References: <7f412749.1fc36.13f8b41f860.Coremail.zhengun23@126.com>
Date: Thu, 18 Jul 2013 12:41:02 +0530
Message-ID: <CAGhJ=78J+jHtChQbC5ShmjxJxRUjC+fgMK94jLEAkdZKNWm_QA@mail.gmail.com>
Subject: Re: why use a very low-efficient method to check all the uncheked
 inode in garbage_collect_pass
From: Abhijit Lamsoge <avlamsox@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

unsubscribe linux-mtd

On Fri, Jun 28, 2013 at 8:18 PM, zhengjun <zhengun23@126.com> wrote:
> I encountered a problem with my linux system=EF=BC=88uses jffs2 file syst=
em=EF=BC=89
> After scan all inode on the flash, a background thread ( garbage_collect_=
thread) is start=E3=80=82 Before collecting,
> it begins with checking crc of all inodes in inode_cache_list. But unluck=
ly the checking work cost all most 3
> minutes=E3=80=82It costs the 98% of all cpu resource.
> I found that the time is wasted on finding out the valid inode_cache with=
 specified inode id (c->checked_ino)=E3=80=82
> checked_ino is counted from zero to c->higest_ino=E3=80=82
> In my system, there are 3000 files,but with higest_ino reached to 2726297=
6=E3=80=82
> (Because the old file is replaced by new file, by first delete then copy)=
=E3=80=82
> So the most of time, jffs2_get_inode_cache can not find a valid inode wit=
h c->checked_ino=E3=80=82
> So the useless search works wastes a lot of time.
> why?
> why use a increased  index to find each indoe_cache in inode_cache_list=
=EF=BC=8C but you never know which index is the valide ino.
> The indode_cache_list is a hash table.
> why not use a deep-first-search method to get each inode in hash table?
> Just remember next valid ino in c->checked_ino.
>
> Now I designed a new search method=E3=80=82 It works much more efficientl=
y.
>
> Could you optimize these code for better work?  Thanks!
>
> jffs2_garbage_collect_pass()
> {
>    ....
>     if( c->unchecked_size )
>     {
>         ic =3D jffs2_get_inode_cache_next( c, & c->checked_ino );  // new=
 search method
>
>        if( !ic )
>       {
>          BUG();
>       }
>    }
> ....
> }
>
> struct jffs2_inode_cache * jffs2_get_inode_cache_next( struct jffs2_sb_in=
fo * c, uint32_t * ino )
> {
>     struct jffs2_inode_cache * ret;
>     uint32_t curIno;
>     uint32_t ihash;
>
>     curIno =3D *ino;
>     ihash =3D curino % 128;
>
>     ret =3D c->inode_cache_list[ihash];
>
>     while( NULL !=3D ret )
>     {
>         if( ret->ino >=3D curInfo )
>         {
>              goto findinode;
>         }
>         ret =3D ret ->next;
>     }
>     for( ihash =3D ihash + 1; ihash < 128; ihash ++ )
>     {
>         if( NULL !=3D ( ret =3D c->inode_cache_list[ihash] ) )
>             goto findinode;
>     }
>     return NULL;
> findinode:
>     if( ret->next )
>     {
>         *ino =3D ret->next->ino;
>     } else
>     {
>         *ino =3D ihash + 1;
>     }
>    return ret;
> }
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
