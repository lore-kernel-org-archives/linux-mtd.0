Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoZtK-0007mb-Vg
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 16:36:03 +0000
Received: by pabrc13 with SMTP id rc13so26043313pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Oct 2015 09:35:41 -0700 (PDT)
Date: Tue, 20 Oct 2015 09:35:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: maps: rbtx4939-flash: fix compile error
Message-ID: <20151020163539.GG13239@google.com>
References: <1445283119-96697-1-git-send-email-computersforpeace@gmail.com>
 <CAH6sp9O7jwkcJWxh723CWtV8hFBTxq8QrjF7fwyye4h78uu6vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH6sp9O7jwkcJWxh723CWtV8hFBTxq8QrjF7fwyye4h78uu6vQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 20, 2015 at 09:21:04AM +0200, Frans Klaver wrote:
> On Mon, Oct 19, 2015 at 9:31 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > We got the syntax wrong here. Compile tested this time!
> >
> > Error:
> >
> >    drivers/mtd/maps/rbtx4939-flash.c: In function 'rbtx4939_flash_probe':
> >>> drivers/mtd/maps/rbtx4939-flash.c:99:11: error: request for member 'dev' in something not a structure or union
> >      info->mtd.dev.parent = &dev->dev;
> >               ^
> 
> *Sigh*
> 
> Thanks Brian.

No problem. Applied.
