Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qWi3-000675-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2001 10:28:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BBAFBF8.D5B58E18@laurel.datsi.fi.upm.es> 
References: <3BBAFBF8.D5B58E18@laurel.datsi.fi.upm.es> 
To: =?iso-8859-1?Q?Jes=FAs=20S=E1nchez?= <jsanchez@laurel.datsi.fi.upm.es>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD JEDEC driver installation 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 10:34:21 +0100
Message-ID: <14116.1002533661@redhat.com>
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

jsanchez@laurel.datsi.fi.upm.es said:
>  I want to install the mtd driver for a AM29FC16B flash chip. This
> chip is not a CFI compatible chip, it is a JEDEC one. I would like to
> know how to install the driver, and how to access the flash through
> the file system. 

First, make sure your chip is listed in drivers/mtd/chips/jedec_probe.c - if 
it isn't, add the relevant entry into the jedec_table[].

Then, provide a 'map' driver for access to your chip. This could be as 
simple as the 'nora' driver if the flash is connected sensibly, or you 
could configure the 'physmap' driver to work correctly (you also need to 
make it call do_map_probe("jedec_probe", ....) instead of the current 
"cfi_probe").

--
dwmw2
