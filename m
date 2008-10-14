Date: Tue, 14 Oct 2008 14:10:33 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <1223979634.6770.767.camel@macbook.infradead.org>
Message-ID: <alpine.LFD.1.10.0810141404570.6452@casper.infradead.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > +config MTD_PHYSMAP_PFOWBASE
> > +       hex "PFOW base address for LPDDR chips"
> > +       depends on MTD_PHYSMAP && MTD_LPDDR
> > +       default "0x00000000"
> 
> I'd rather not extend the MTD_PHYSMAP_xxx options; in fact I'd prefer to
> phase them out completely. The platform device and the device tree
> should be perfectly sufficient. 

I did this to support physmap "compat mode" option as well as mode using platform
device. For now both modes works well.
If "compat mode" options are becoming obsolete it is not a problem to kick off new features from it. 

Thanks,
Alexey
