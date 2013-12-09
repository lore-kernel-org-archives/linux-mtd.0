Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vprx6-0002gl-Nb
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 03:56:13 +0000
Received: by mail-pd0-f180.google.com with SMTP id q10so4402159pdj.39
 for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2013 19:55:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1386556564.19311.1.camel@phoenix>
References: <1386556564.19311.1.camel@phoenix>
Date: Mon, 9 Dec 2013 11:55:50 +0800
Message-ID: <CAFRkauA+ZOHYJ4chwBB=MXKcTnR8cNcz1OjDW8BgyiYRT1XEFw@mail.gmail.com>
Subject: Re: Mount jffs2 on spi nor flash issue
From: Axel Lin <axel.lin@ingics.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/12/9 Axel Lin <axel.lin@ingics.com>:
> Hi list,
> I'm trying to mount a jffs2 on a spi nor flash but I got hangup after below messages:
>
> VFS: Mounted root (jffs2 filesystem) on device 31:1.
> devtmpfs: mounted
> Freeing unused kernel memory: 92K (00364000 - 0037b000)
>
> ( I can mount the jffs2 image on my host using mtdram to test mount.
> However, I got hang up when using jffs on my target machine.
> The nor-flash is compatible to MX25L3205D.)
>
> After setting CONFIG_JFFS2_FS_DEBUG=1, I got below messages:

> [JFFS2 DBG] (1) jffs2_build_inode_fragtree: Add 01e77160 (v 1, 0x0-0x1000, ov 0) to fragtree
> [JFFS2 DBG] (1) jffs2_add_full_dnode_to_inode: adding node 0x00-0x1000 @0x00000830 on flash, newfrag *01e5f078
> [JFFS2 DBG] (1) jffs2_truncate_fragtree: truncating fragtree to 0x000b9dc4 bytes
>
> Then my debug code shows it hangs at below while loop: (fs/jffs2/compr_zlib.c)
> while((ret = zlib_inflate(&inf_strm, Z_FINISH)) == Z_OK)
>         ;
>
In my another test, the latest message shows "read_dnode: the node has no data."

[JFFS2 DBG] (37) jffs2_add_fd_to_list: add dirent "lib", ino #190
[JFFS2 DBG] (1) jffs2_truncate_fragtree: truncating fragtree to 0x000b9dc4 bytes
[JFFS2 DBG] (37) jffs2_add_fd_to_list: add dirent "bin", ino #189
[JFFS2 DBG] (37) read_more: read more 28 bytes
[JFFS2 DBG] (37) read_dnode: the node has no data.

So it seems the hangup is because of reading "/bin/sh" fails. ( I pass
init=/bin/sh to boot args ).

Regards,
Axel
