Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PhQaq-0000sT-Ex
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2011 17:52:45 +0000
Received: by iyj21 with SMTP id 21so4354930iyj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Jan 2011 09:52:42 -0800 (PST)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <4D3D9FA6.3050900@bvs-tech.com>
References: <327178.68946.qm@web180303.mail.gq1.yahoo.com>
	<4CEB89C6.3080603@bvs-tech.com>
	<20101123093643.GC6156@jasper.tkos.co.il>
	<4CEB8C39.1060801@bvs-tech.com>
	<20101123094414.GD6156@jasper.tkos.co.il>
	<4CEB8F7C.6070102@bvs-tech.com>
	<20110121192819.GA32112@angua.secretlab.ca>
	<4D3D6472.8030505@bvs-tech.com> <4D3D9FA6.3050900@bvs-tech.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 24 Jan 2011 10:52:22 -0700
Message-ID: <AANLkTikDHbKt5q+o2LK89hHZ3EUeeYzmQVJj8jXgQ+pB@mail.gmail.com>
Subject: Re: [PATCH 0/1] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
To: Alexis RODET <alexis.rodet@bvs-tech.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Brownell <david-b@pacbell.net>,
	spi-devel-general@lists.sourceforge.net,
	Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 24, 2011 at 8:49 AM, Alexis RODET <alexis.rodet@bvs-tech.com> wrote:
> Hi again,
>
> In facts I don't know which git URL to clone for getting linux-next as patch base, can you tell me ?
> I'm working on last stable release from git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6-stable.git.

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Be warned, it is rebased every night.

> I wonder also what to do if people keep committing new files with old structure name:
> What should I put to make the define generate a "deprecated" warning ?

The spi flash_platform_data structure is almost a complete subset of
the arm one.  Rather than renaming everything, why not simply
consolidate the structure definition?  Consolidating will have much
lower impact.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
