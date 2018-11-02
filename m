Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIguI-00050b-HC
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 21:23:08 +0000
From: Richard Weinberger <richard@nod.at>
To: Daniel Walker <danielwa@cisco.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, nkela@cisco.com,
 xe-linux-external@cisco.com, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Rod Whitby <rod@whitby.id.au>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Make JFFS2 endianness configurable
Date: Fri, 02 Nov 2018 22:22:53 +0100
Message-ID: <2265901.Da3O5o3T4q@blindfold>
In-Reply-To: <20181102211444.nqqqbd4w5diyqrfw@zorba>
References: <20181101225603.17806-1-nkela@cisco.com>
 <CAFLxGvy-0-A1Ta1vf=o4q0tcJAdr+uv9eQc7UrnwqF9NkJiWUw@mail.gmail.com>
 <20181102211444.nqqqbd4w5diyqrfw@zorba>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 2. November 2018, 22:14:44 CET schrieb Daniel Walker:
> > Make it a mount option and store the endianness mode in the super block.
> 
> It's actually a mkfs option currently. I'm not sure how that factors in,
> 
> from the mkfs.jffs2 man page,
> 
>        -l, --little-endian
>               Create a little-endian JFFS2 image.  Default is to make an image with the same endianness as the host.
> 
>        -b, --big-endian
>               Create a big-endian JFFS2 image.  Default is to make an image with the same endianness as the host.

As long this setting is not stored in the filesystem itself, it is useless.
IIRC it just controls the endianness setting for mkfs.jffs2's
t32() and t16() macros.

That's why I think of a mount option like "force_endian=".

Thanks,
//richard
