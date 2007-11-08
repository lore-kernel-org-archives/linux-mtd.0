Received: from nz-out-0506.google.com ([64.233.162.232])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqBR7-0004kX-K6
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 12:45:07 -0500
Received: by nz-out-0506.google.com with SMTP id z3so197697nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Nov 2007 09:44:58 -0800 (PST)
Message-ID: <6934efce0711080944o6bfe8478ufd417d35900f4e12@mail.gmail.com>
Date: Thu, 8 Nov 2007 09:44:57 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH 6/8] MTD: add physical address to point() api -- PCI RAM
	card pmc551
In-Reply-To: <20071108101253.GA18903@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <6934efce0711071923q7fecf4a4pac2fed1e8e7db0ee@mail.gmail.com>
	<20071108101253.GA18903@lazybastard.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/8/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Wed, 7 November 2007 19:23:41 -0800, Jared Hulbert wrote:
> > @@ -803,7 +810,7 @@ static int __init init_pmc551(void)
> >               }
> >
> >               /* Keep a reference as the add_mtd_device worked */
> > -             pci_dev_get(PCI_Device);
> > +             //pci_dev_get(PCI_Device);
> >
> >               printk(KERN_NOTICE "Registered pmc551 memory device.\n");
> >               printk(KERN_NOTICE "Mapped %dMiB of memory from 0x%p to 0=
x%p\n",
>
> What is this hunk doing?

Making me look dumb.
