Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ost9d-0005gZ-1a
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 08:03:47 +0000
Received: by bwz13 with SMTP id 13so5153792bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 01:03:43 -0700 (PDT)
Subject: Re: mks.jffs2 uid/gid for root inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arno Steffen <arno.steffen@googlemail.com>
In-Reply-To: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
References: <AANLkTikScro_GmWvVb6SCq5wTzMAfN+c_4Od2SBY+OpO@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 11:02:12 +0300
Message-ID: <1283846532.2979.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-03 at 14:12 +0200, Arno Steffen wrote:
> I use mkfs.jffs2 to generate a partition out of a directory tree (not
> the hole root-filesystem).
> It seem the owner of the root point of this directory tree is always
> root:root, althouh it might have other owners.
> 
> Example
> 
> mkfs.jffs2 -lnp -e 0x20000 -r /opt/rootfs/opt -o /mnt/hgfs/share/fs_opt.jffs2
> 
> In my NFS-rootfs /opt/rootfs/opt is owned by user but flashing the
> created jffs file will be mounted as owner root.
> From my point of view this is a bug, as it doesn't care about the real
> owner of this part of filetree.
> Or did I misused the -r option?
> 
> I hope you can give me a comment or some feedback, how to change this behaviour.

Sounds like a bug. I'll take a look at this as soon as I have some time.
Or you can send a patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
