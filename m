Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPpsz-0002OC-T8
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 06:51:34 +0000
Received: by lagy4 with SMTP id y4so1271600lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 23:51:31 -0700 (PDT)
Date: Thu, 3 May 2012 09:51:27 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
Message-ID: <20120503095127.6931d370@pixies.home.jungo.com>
In-Reply-To: <jnrm65$im4$1@dough.gmane.org>
References: <jnrm65$im4$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Grant,

On Wed, 2 May 2012 16:08:38 +0000 (UTC) Grant Edwards <grant.b.edwards@gmail.com> wrote:
> [apologies if this isn't the right forum for mkfs.jffs2 questions]
> 
> According the the mkfs.jffs2 man page (from mtd-utils 1.4.8):
> 
>   -s, --pagesize=SIZE
>   
>      Use page size SIZE.  The default is 4 KiB.  This size is the
>      maximum size of a data node.
> 
> I'm using NAND flash with an erase size of 128K.
> 
> I've got a directory tree with 68 files. A few are largish (100KB),
> but most of them small (a few hundred bytes or less).  They contain a
> total of 680K bytes of data and take up 900K of space on an ext2
> filesystem.
> 
> When I do a "mkfs.jffs2 -e128 -l -n" I get a jffs2 image with a size
> of 300K.  That seems reasonable.
> 
> If I specify a page size of 4K (which according to the man page is the
> default) by doing "mkfs.jffs2 -e128 -s4KiB -n -l", I get a jffs2 image
> with a size of 12MB.
> 
> According to the man page the default page size is 4K, so specifying a
> page size of 4K shouldn't change anything, right?
> 
> Why does specifying a page size of 4K make the jffs2 image 40X larger?
> 
> The NAND flash I'm using has to be written in 4K blocks -- isn't that
> the "page size"?

Looks like mkfs.jffs2 sets 
	case 's':
		page_size = strtol(optarg, NULL, 0);

and does not further parse KiB/MiB tokens.

So my buest guess, try to specify '-s 4096' instead of '4KiB'.

Regards,
Shmulik
