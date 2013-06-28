Received: from m15-17.126.com ([220.181.15.17])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsZz4-0007Jn-3G
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 14:49:11 +0000
Date: Fri, 28 Jun 2013 22:48:43 +0800 (CST)
From: zhengjun  <zhengun23@126.com>
To: linux-mtd@lists.infradead.org
Subject: why use a very low-efficient method to check all the uncheked inode
 in garbage_collect_pass
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <7f412749.1fc36.13f8b41f860.Coremail.zhengun23@126.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I encountered a problem with my linux system=A3=A8uses jffs2 file system=A3=
=A9
After scan all inode on the flash, a background thread ( garbage_collect_th=
read) is start=A1=A3 Before collecting,
it begins with checking crc of all inodes in inode_cache_list. But unluckly=
 the checking work cost all most 3
minutes=A1=A3It costs the 98% of all cpu resource.
I found that the time is wasted on finding out the valid inode_cache with s=
pecified inode id (c->checked_ino)=A1=A3
checked_ino is counted from zero to c->higest_ino=A1=A3=20
In my system, there are 3000 files,but with higest_ino reached to 27262976=
=A1=A3
(Because the old file is replaced by new file, by first delete then copy)=
=A1=A3
So the most of time, jffs2_get_inode_cache can not find a valid inode with =
c->checked_ino=A1=A3
So the useless search works wastes a lot of time.
why?
why use a increased  index to find each indoe_cache in inode_cache_list=A3=
=AC but you never know which index is the valide ino.
The indode_cache_list is a hash table.
why not use a deep-first-search method to get each inode in hash table?
Just remember next valid ino in c->checked_ino.

Now I designed a new search method=A1=A3 It works much more efficiently.

Could you optimize these code for better work?  Thanks!

jffs2_garbage_collect_pass()
{
   ....
    if( c->unchecked_size )
    {
        ic =3D jffs2_get_inode_cache_next( c, & c->checked_ino );  // new s=
earch method

       if( !ic )
      {
         BUG();
      }
   }
....
}

struct jffs2_inode_cache * jffs2_get_inode_cache_next( struct jffs2_sb_info=
 * c, uint32_t * ino )
{
    struct jffs2_inode_cache * ret;
    uint32_t curIno;
    uint32_t ihash;

    curIno =3D *ino;
    ihash =3D curino % 128;

    ret =3D c->inode_cache_list[ihash];

    while( NULL !=3D ret )
    {
        if( ret->ino >=3D curInfo )
        {
             goto findinode;
        }
        ret =3D ret ->next;
    }
    for( ihash =3D ihash + 1; ihash < 128; ihash ++ )
    {
        if( NULL !=3D ( ret =3D c->inode_cache_list[ihash] ) )
            goto findinode;
    }
    return NULL;
findinode:
    if( ret->next )
    {
        *ino =3D ret->next->ino;
    } else
    {
        *ino =3D ihash + 1;
    }
   return ret; =20
}
