Received: from nz-out-0506.google.com ([64.233.162.226])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQHpI-0002C2-8X
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 03:18:58 -0400
Received: by nz-out-0506.google.com with SMTP id z3so79982nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 00:18:55 -0700 (PDT)
Message-ID: <d843180a0708290011t64221292hb5d0dfc365fa78b9@mail.gmail.com>
Date: Wed, 29 Aug 2007 15:11:48 +0800
From: "He Yong" <hoffer1127@gmail.com>
To: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
Subject: Re: mtd->size overflow
In-Reply-To: <9b52d64c0708282351o4defa2edrdfc295488e20d6c4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <d843180a0708282321v62662b56h63249d5459b3a3b5@mail.gmail.com>
	<9b52d64c0708282351o4defa2edrdfc295488e20d6c4@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,Vinit
  can you give a patch fro that?  Thanks a lot!

-- He Yong

2007/8/29, Vinit Agnihotri <vinit.agnihotri@gmail.com>:
> I had same problem,
> I converted entire mtd sunsytem to work with 64-bit compatibility.
> You have make fields from mtd_info, erase_info & 2 more structures to 64-bits
> these fields are size, offset & similar ones...
>
> --vinit
>
> On 8/29/07, He Yong <hoffer1127@gmail.com> wrote:
> > Hi,
> >   I'm using two 2G Bbyte nand flash chip (totally 4GB) under kernel 2.6.20.4,
> > the   chip->chipsize=0x80000000, and when decide the mtd->size = 2 *
> > 0x80000000 = 0x00000000 (overflowed).
> > is there an official way to solve this problem?
> >
> > Thanks!!
> >
> > --
> > Best Regards!
> >
> > He Yong
> >
> > School of Information Security,
> > Shanghai Jiaotong University,
> > Dong chuan Road #800,
> > Minhang, Shanghai, P.R.China
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
>
> --
> I feel free now
>


-- 
Best Regards!

He Yong

School of Information Security,
Shanghai Jiaotong University,
Dong chuan Road #800,
Minhang, Shanghai, P.R.China
