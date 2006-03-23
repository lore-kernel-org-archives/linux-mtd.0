Received: from wproxy.gmail.com ([64.233.184.195])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FMPa6-0006vK-Oc
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 08:10:34 -0500
Received: by wproxy.gmail.com with SMTP id 68so441536wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Mar 2006 05:10:25 -0800 (PST)
Message-ID: <625fc13d0603230510w46124dd0g9cbbf30ca4b68656@mail.gmail.com>
Date: Thu, 23 Mar 2006 07:10:24 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Mirco Fuchs" <mircofuchs@web.de>
In-Reply-To: <457792036@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <457792036@web.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.16 compile error with latest cvs mtd source
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/23/06, Mirco Fuchs <mircofuchs@web.de> wrote:
> Hello,
>
> i have a problem compiling the 2.6.16 kernel for my csb637 board. I think=
 this
> is an mtd related question because it works without patching the kernel
> against the  mtd source code.
>
> I have gcc 3.4.4 and binutils 2.16 and glibx 2.3.5.
>
> The first step was compiling the 2.6.16 kernel without patching against t=
he
> mtd cvs sources. --> The compilation was successfull.
>
> But patching the kernel against the head of the mtd cvs repo resulted in =
the
> following warnings and errors:
>
> (I used the command 'patchkernel.sh -2cyv $KERNELDIR' for patching)

Did you enable CONFIG_OBSOLETE_INTERMODULE in your .config?  That was
added in the 2.6.16 kernel because the inter_module stuff should
really go away sometime.

Alternatively, the MTD subsystem should also probably select that
Kconfig option so users don't see this.  But MTD needs a sync anyway.

josh
