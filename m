Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drQ7U-0004vp-90
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 14:55:30 +0000
Received: by mail-wm0-x22b.google.com with SMTP id i189so41829920wmf.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 Sep 2017 07:55:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 11 Sep 2017 16:55:05 +0200
Message-ID: <CAFLxGvz+_m0u6naPErkYMH2o53muj5TxNVSH82uKF-_FX9SesA@mail.gmail.com>
Subject: Re: Actual usage of files in ubifs
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 Jonas Holmberg <jonashg@axis.com>, Cristian Ionescu-Idbohrn <cii@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 11, 2017 at 11:47 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> Is there a (simple) way to find out exactly how much space each specific
> file uses in an ubifs fils system?
>
> I looked into running mkfs.ubifs with some form of option to give me the
> info, the closest I got was -g 3 which output a lot of sizes but it was
> not obvious exactly what they meant.
>
> I suppose it would be fully possible to add code to mkfs.ubifs to output
> this information, as it surely must be there at some point, since it
> selects the compression algorithm on a file per file basis, debending on
> the amount of compression acheived for each algorithm.

Well, how exactly should it be?
I guess you want more than the compressed size on flash.
Do you also want to know how much bytes a file occupies in the index
tree and the inode itself?
This is non-trivial.

-- 
Thanks,
//richard
