Received: from alln-iport-4.cisco.com ([173.37.142.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIgmS-00008M-QW
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 21:15:02 +0000
Date: Fri, 2 Nov 2018 14:14:44 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, nkela@cisco.com,
 xe-linux-external@cisco.com, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Rod Whitby <rod@whitby.id.au>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Make JFFS2 endianness configurable
Message-ID: <20181102211444.nqqqbd4w5diyqrfw@zorba>
References: <20181101225603.17806-1-nkela@cisco.com>
 <20181102000236.rqho7txtb7gv543t@zorba>
 <20181102003434.GW32577@ZenIV.linux.org.uk>
 <20181102140420.jiuhcsrahoeqe5vk@zorba>
 <CAFLxGvy-0-A1Ta1vf=o4q0tcJAdr+uv9eQc7UrnwqF9NkJiWUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvy-0-A1Ta1vf=o4q0tcJAdr+uv9eQc7UrnwqF9NkJiWUw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 02, 2018 at 09:15:06PM +0100, Richard Weinberger wrote:
> On Fri, Nov 2, 2018 at 3:04 PM Daniel Walker <danielwa@cisco.com> wrote:
> > Do you have any thought on how to implement it ? I was think abstracting the
> > endian functions in the nodelist.h
> 
> Yes, see what UFS does.
> 
> > static inline jint16_t cpu_to_je16(jint16_t x) {
> >         if (check_big_endian()) {
> >                 return cpu_to_be16(x);
> >         } else if (check_little_endian()) {
> >                 return cpu_to_le16(x);
> >         }
> > }
> >
> > but how would you setup the checking ?
> 
> Make it a mount option and store the endianness mode in the super block.

It's actually a mkfs option currently. I'm not sure how that factors in,

from the mkfs.jffs2 man page,

       -l, --little-endian
              Create a little-endian JFFS2 image.  Default is to make an image with the same endianness as the host.

       -b, --big-endian
              Create a big-endian JFFS2 image.  Default is to make an image with the same endianness as the host.


Daniel
