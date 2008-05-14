Received: from yw-out-1718.google.com ([74.125.46.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jw74a-0007O5-Ji
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 02:50:33 +0000
Received: by yw-out-1718.google.com with SMTP id 5so3324270ywm.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 May 2008 19:50:31 -0700 (PDT)
Message-ID: <386072610805131950l196c6bbera7242bf517a2b838@mail.gmail.com>
Date: Wed, 14 May 2008 10:50:31 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH 1/1] [MTD/MAPS] Blackfin Async Flash Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
In-Reply-To: <20080513191616.GC18026@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1210653525-19437-1-git-send-email-cooloney@kernel.org>
	<20080513080727.GA15795@logfs.org>
	<8bd0f97a0805130542x46f5e7fejf1347f1c71f567fb@mail.gmail.com>
	<20080513150143.GA18026@logfs.org>
	<8bd0f97a0805130815q2ffa1d34ue87f5eb1422b6f42@mail.gmail.com>
	<20080513153441.GB18026@logfs.org>
	<8bd0f97a0805131042x2a74115dqc3831a604583bbd5@mail.gmail.com>
	<20080513191616.GC18026@logfs.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, will.newton@gmail.com,
	Mike Frysinger <vapier.adi@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 14, 2008 at 3:16 AM, J=F6rn Engel <joern@logfs.org> wrote:
>
> On Tue, 13 May 2008 13:42:04 -0400, Mike Frysinger wrote:
>  > On Tue, May 13, 2008 at 11:34 AM, J=F6rn Engel <joern@logfs.org> wrote=
:
>  > > On Tue, 13 May 2008 12:38:45 +0800, Bryan Wu wrote:
>  > > > +#define pr_devinit(fmt, args...) ({ static const __devinitdata ch=
ar __fmt[] =3D fmt; printk(__fmt, ## args); })
>  > >
>  > >  That bit is obvious.  But why do you use pr_devinit() instead of
>  > >  printk()?  What does it gain you?
>  >
>  > why do we have __init and __devinit in the first place ?
>
>  Ah.  Now I finally understand what this code does.
>
>  Might be worth moving it to include/linux/kernel.h, along with
>  pr_init().  And watch an avalanche of janitor patches use these new
>  toys. :)
>

Yes, I agree. Mike, could you consider providing a patch to add
pr_devinit to common code?
IMO, your weapon can be shared by others.

Thanks
-Bryan
