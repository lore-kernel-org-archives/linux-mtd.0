Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JvwER-000783-1l
	for linux-mtd@lists.infradead.org; Tue, 13 May 2008 15:15:59 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3001696wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 May 2008 08:15:58 -0700 (PDT)
Message-ID: <8bd0f97a0805130815q2ffa1d34ue87f5eb1422b6f42@mail.gmail.com>
Date: Tue, 13 May 2008 11:15:57 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH 1/1] [MTD/MAPS] Blackfin Async Flash Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
In-Reply-To: <20080513150143.GA18026@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1210653525-19437-1-git-send-email-cooloney@kernel.org>
	<20080513080727.GA15795@logfs.org>
	<8bd0f97a0805130542x46f5e7fejf1347f1c71f567fb@mail.gmail.com>
	<20080513150143.GA18026@logfs.org>
Cc: dwmw2@infradead.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org, will.newton@gmail.com,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 13, 2008 at 11:01 AM, J=F6rn Engel wrote:
> On Tue, 13 May 2008 08:42:08 -0400, Mike Frysinger wrote:
>  > On Tue, May 13, 2008 at 4:07 AM, J=F6rn Engel wrote:
>  > > On Tue, 13 May 2008 12:38:45 +0800, Bryan Wu wrote:
>  > >  >
>  > >  > +#define pr_devinit(fmt, args...) ({ static const __devinitdata c=
har __fmt[] =3D fmt; printk(__fmt, ## args); })
>  > >
>  > >  Is this still needed?
>  >
>  > yes
>
>  Can you elaborate a bit?

it's still used, therefore the definition cannot be dropped.  just
look at the probe function.
-mike
