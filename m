Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW8Vz-0003Lq-So
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 11:39:44 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
Date: Thu, 21 Aug 2008 13:39:36 +0200
References: <48AD00F8.1030004@gmail.com> <48AD2AFF.5060609@de.ibm.com>
	<1219308560.2988.247.camel@pmac.infradead.org>
In-Reply-To: <1219308560.2988.247.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808211339.37187.arnd@arndb.de>
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	carsteno@de.ibm.com, =?iso-8859-15?q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 August 2008, David Woodhouse wrote:
> On Thu, 2008-08-21 at 10:44 +0200, Carsten Otte wrote:
> >
> > Exporting profiling data for a file system in another file system 
> > (/proc) seems not very straigtforward to me. I think it is worth 
> > considering to export this information via the same mount point.
> 
> I would have said sysfs, rather than 'the same mount point'.
> 

Let me throw in debugfs as my preferred option. sysfs is for stable
interfaces, while profiling generally fits into the debugging category.

	Arnd <><
