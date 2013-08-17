Received: from mail-vb0-x234.google.com ([2607:f8b0:400c:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAex4-0004U5-VY
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 11:45:51 +0000
Received: by mail-vb0-f52.google.com with SMTP id f12so2273431vbg.11
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 04:45:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130817070912.GA2645@zuhnb712.ap.bm.net>
References: <20130817070912.GA2645@zuhnb712.ap.bm.net>
Date: Sat, 17 Aug 2013 13:45:27 +0200
Message-ID: <CAFLxGvx-PE7yDqEQQw7Ms6wTq0C=FYRQvRCt1E0LJOy=0WHXzA@mail.gmail.com>
Subject: Re: meaning of use_nand_ecc parameter
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Woody Wu <narkewoody@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 17, 2013 at 9:09 AM, Woody Wu <narkewoody@gmail.com> wrote:
> Hi,
>
> By catting /proc/yaffs2, I see use_nand_ecc=1 and no_tags_ecc = 0. I
> don't quit understand what these values means to me.
>
> For use_nand_ecc, does it means that yaffs is depending on MTD's ecc
> functions and not its own ecc?

As yaffs2 is not mainline, you ask better the yaffs2 guys. :-)

-- 
Thanks,
//richard
