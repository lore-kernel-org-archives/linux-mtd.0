Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cisp1-0001jo-UO
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 01:12:53 +0000
Received: by mail-pg0-x234.google.com with SMTP id p5so13316897pga.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 17:12:31 -0800 (PST)
Date: Wed, 1 Mar 2017 10:12:24 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Hyunchul Lee <cheol.lee@lge.com>, kernel-team@lge.com
Subject: Re: [PATCH 0/3] ubifs: add lz4hc compression
Message-ID: <20170301011224.GC15972@Hyeoncheol-PC00>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
 <1488277025.3583.2.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1488277025.3583.2.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 28, 2017 at 12:17:05PM +0200, Artem Bityutskiy wrote:
> On Tue, 2017-02-28 at 14:16 +0900, Hyunchul Lee wrote:
> > Another compression type cannot be added any more in respect that
> > type of
> > ubifs_inode's compr_type is "unsigned:2" and there are 4 compression
> > types.  There may be overflow in assignment to compr_type, and
> > prevision 
> > version of ubifs is trying to decompress file with wrong compression
> > type.
> 
> But this is just an in-memory inode structure, and you can change it,
> just increase the size of 'compr_type'.

yes, it is an in-memory inode. but i think that there can be problem of 
backward compatibility. for example, if ubifs_ino_node's compr_type is
4 in flash, the previous version of ubifs could misinterpret it as 0,
because ubifs_inode's compr_type(2-bit) is assigned
ubifs_ino_nodes' compr_type at ubifs_iget.

thank you for comment.
Hyunchul
