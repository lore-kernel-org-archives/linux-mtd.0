Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCE7H-0003RF-LG
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 21:39:56 +0000
Received: by obbgp5 with SMTP id gp5so3964071obb.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2015 14:39:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
References: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
Date: Mon, 6 Jul 2015 23:39:34 +0200
Message-ID: <CAFLxGvz4=hjkawWa4SWD6P588J7RUOX4=X+pdU8Rd0WrynOOBQ@mail.gmail.com>
Subject: Re: autoresize causes insufficient reservation of PEBs for bad PEB
 handling
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Egli, Samuel" <samuel.egli@siemens.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Samuel,

On Mon, Jul 6, 2015 at 1:04 PM, Egli, Samuel <samuel.egli@siemens.com> wrote:
> Hi all,
>
> I have difficulties to understand why I get the following warning message
> at linux start up:
>
> ...
> [    4.777488] UBI warning: print_rsvd_warning: cannot reserve enough PEBs \
> for bad PEB handling, reserved 40, need 80
> ...
>
> My assumption is that if I don't specify the size of one volume
> UBI will choose the right size for the volume and reserve the
> right amount of PEBs for bad block handling. With 20/1024 set,vi I
> expect indeed to have 80 blocks reserved. But somehow this
> does not work. I observed that I get this warning when vol_flags
> is set to autoresize. In this case only 40 blocks get reserved.
> Using for all volumes the vol_size parameter and omitting
> autoresize, I can avoid this situation and I get my 80 blocks reserved.
>
> However, I don't understand why and it seems odd to me that
> autoresize would work this way.
>
> Can somebody confirm this observations or explain why this
> works like this. Maybe I'm also doing something wrong.

I'm a bit puzzled. Can you please share the full kernel log?
Maybe some other UBI warning brings light into that.
Please also share the output of ubinfo -a with and without autoresize.

The re-size mechanism will use ubi->avail_pebs for the new volume size.
ubi->avail_pebs should honor the number of reserved PEBs.
If you have a lot of bad/corrupted PEBs the situation may be different.

-- 
Thanks,
//richard
