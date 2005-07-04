Received: from nproxy.gmail.com ([64.233.182.207])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DpTaG-0002ZE-A3
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 12:14:13 -0400
Received: by nproxy.gmail.com with SMTP id n15so171740nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Jul 2005 09:14:05 -0700 (PDT)
Message-ID: <2cd57c90050704091420198987@mail.gmail.com>
Date: Tue, 5 Jul 2005 00:14:05 +0800
From: Coywolf Qi Hunt <coywolf@gmail.com>
To: Paolo Galtieri <pgaltieri@mvista.com>
In-Reply-To: <1118327333.2401.42.camel@playin.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1118327333.2401.42.camel@playin.mvista.com>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: patch to create sysfs char device nodes
Reply-To: coywolf@lovecn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/9/05, Paolo Galtieri <pgaltieri@mvista.com> wrote:
> Hi,
>   with DEVFS going away I discovered that no character device nodes are
> created if a flash device is present which contains filesystems. The
> mtd-utils package requires the existence of character device nodes for
> performing erase, lock and unlock functions.  The problem is that the
> flash device driver has not been modified to use sysfs instead of devfs.
>=20
> I have attached a patch to mtdchar.c which uses the sysfs interface to
> create the appropriate nodes.  Please let me know if you have comments.

I encountered the same problem days ago. Thanks for the patch. A patch
based on yours will be sent in the next mail.

--=20
Coywolf Qi Hunt
http://ahbl.org/~coywolf/
