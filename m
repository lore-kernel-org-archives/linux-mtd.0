Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMDES-00015z-RR
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 06:58:45 +0000
Received: by iaky10 with SMTP id y10so19781668iak.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 23:58:43 -0700 (PDT)
Subject: Re: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Xi Wang <xi.wang@gmail.com>
In-Reply-To: <1335160854.28267.30.camel@brekeke>
Date: Mon, 23 Apr 2012 02:58:38 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF33F54F-FFF7-4F44-98DC-374C16C29A68@gmail.com>
References: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
 <1335095871.2097.3.camel@golum>
 <8EF5D079-1EBB-46D7-9A0A-A6054D94C958@gmail.com>
 <1335160854.28267.30.camel@brekeke>
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 23, 2012, at 2:00 AM, Artem Bityutskiy wrote:
>=20
> I think JFFS2 has its own limit on the maximum size of the symlink
> target. Probably it is PAGE_CACHE_SIZE, but not sure.

Is it this one?

fs/jffs2/dir.c:297

static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, =
const char *target)
{
        ...
        int targetlen =3D strlen(target);

        /* FIXME: If you care. We'd need to use frags for the target
           if it grows much more than this */
        if (targetlen > 254)
                return -ENAMETOOLONG;
	...

}

I guess the magic value 254 is JFFS2_MAX_NAME_LEN defined in
include/linux/jffs2.h.

- xi=
