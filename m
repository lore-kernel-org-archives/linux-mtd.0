Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
Content-Type: text/plain
Date: Tue, 14 Oct 2008 11:20:34 +0100
Message-Id: <1223979634.6770.767.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nico@cam.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-08 at 22:39 +0100, Alexey Korolev wrote:
> +config MTD_PHYSMAP_PFOWBASE
> +       hex "PFOW base address for LPDDR chips"
> +       depends on MTD_PHYSMAP && MTD_LPDDR
> +       default "0x00000000"

I'd rather not extend the MTD_PHYSMAP_xxx options; in fact I'd prefer to
phase them out completely. The platform device and the device tree
should be perfectly sufficient. 

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
