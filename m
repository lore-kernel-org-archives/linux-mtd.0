Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JeQ0-0008UW-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 18:38:45 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: tglx@linutronix.de, David Woodhouse <dwmw2@infradead.org>,
	Dave Ellis <DGE@sixnetio.com>
Subject: Re: Problem: 51MB partition max size on jffs2
Date: Thu, 5 Dec 2002 08:04:35 +1300
Cc: 'Ken Offer' <koffer@arlut.utexas.edu>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <00512BA4F9D3D311912A009027E9B8F407E4A3@NT> <14294.1039027619@passion.cambridge.redhat.com> <200212042001.08259.tglx@linutronix.de>
In-Reply-To: <200212042001.08259.tglx@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021204190914.6D7CD48FD@tiger.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 05 Dec 2002 08:01, Thomas Gleixner wrote:
> On Wednesday 04 December 2002 19:46, David Woodhouse wrote:
> > DGE@sixnetio.com said:
> > >  kmalloc() is limited to 128K and the 128MB Flash needs more than
> > > twice that,
> > >
> > > so I tried vmalloc() and it seems to be OK (at least with PPC 2.4.18
> > > patched for the new MTD code). Does anyone know if this change is
> > > safe?
> >
> > You need to change the corresponding kfree() to vfree().
>
> That's right. In actual CVS-code this problem is solved by building virtual
> blocks of 2,4 or 8 physical blocks.

Does this have an impact on performance?
