Received: from py-out-1112.google.com ([64.233.166.176])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I05aj-0005bh-Sv
	for linux-mtd@lists.infradead.org; Sun, 17 Jun 2007 20:59:39 -0400
Received: by py-out-1112.google.com with SMTP id u77so3157872pyb
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Jun 2007 17:59:36 -0700 (PDT)
Message-ID: <625fc13d0706171759q72a007d4m270deb2a8935c4df@mail.gmail.com>
Date: Sun, 17 Jun 2007 19:59:35 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubi: Error freeing ubi->vtbl while unloading
In-Reply-To: <1182084567.4403.17.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <9b52d64c0706150301v33006e58h9a86c1f126437e32@mail.gmail.com>
	<1182084567.4403.17.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Vinit Agnihotri <vinit.agnihotri@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/17/07, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Fri, 2007-06-15 at 15:31 +0530, Vinit Agnihotri wrote:
> > I downloaded latest git & backported ubi to make it work in linux
> > kernel 2.6.18.3.
> >
> > Machine details
> >  AMD opteron 64bit SMP, linux kernel version 2.6.18.3
> >
> > However while unloading ubi I discovered slab corruption. Ths problem
> > is as follows.
> >
> > ubi->vtbl is allocated using vmalloc() in vtbl.c empty_create_lvol(),
> > but it is freed in build.c with kfree()
>
> Thanks, fixed the patch, added Signed-off-by and committed.

You added Vinit's sign off, which was missing in the first place.  Not
that I really care, but you shouldn't do that for other people.  Since
you had to fix the patch anyway, you could have done a "Reported-By:"
or something similar and it wouldn't have raised my paranoia flags at
all.

josh
