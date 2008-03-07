Received: from an-out-0708.google.com ([209.85.132.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXhRU-0002ya-1t
	for linux-mtd@lists.infradead.org; Fri, 07 Mar 2008 18:37:16 +0000
Received: by an-out-0708.google.com with SMTP id c3so143184ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Mar 2008 10:37:10 -0800 (PST)
Date: Fri, 7 Mar 2008 12:37:01 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Grant Erickson <gerickson@nuovations.com>
Subject: Re: Creating an Empty JFFS2 File System
Message-ID: <20080307123701.55c3ebf8@weaponx>
In-Reply-To: <C3F6C181.DD74%gerickson@nuovations.com>
References: <C3F6C181.DD74%gerickson@nuovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 07 Mar 2008 09:55:13 -0800
Grant Erickson <gerickson@nuovations.com> wrote:

> Is creating an empty JFFS2 file system supported or is this a deprecated
> capability? The following steps seem to be incorrect or failing:
> 
>     # flash_eraseall -q -j /dev/mtd9
>     # mount -t jffs2 /dev/mtdblock9 /mnt
>     Cowardly refusing to erase blocks on filesystem with no valid JFFS2
>     nodes
>     empty_blocks 0, bad_blocks 0, c->nr_blocks 3840
> 
> Or, is the only way to accomplish this to create a NULL JFFS2 image with
> mkfs.jffs2 and then nandwrite it?

Just erase it completely without the -j option and mount.  JFFS2 will go
through and erase them all again and add the cleanmarkers itself.

josh
