Received: from pandora.arm.linux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abZ3R-0003cb-Lq
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 19:36:59 +0000
Date: Thu, 3 Mar 2016 19:36:25 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 0/3] fix memremap on ARM
Message-ID: <20160303193625.GZ19428@n2100.arm.linux.org.uk>
References: <20160303171347.GY19428@n2100.arm.linux.org.uk>
 <CAKv+Gu_5vmxsigsCfsvcjFa-hhOP6vxnMavsQ45oKgMeYzgUSg@mail.gmail.com>
 <CAPcyv4ijokZMTNPsxVOafMUCT_CHyScTkCGbR94mcYOhQOKNqA@mail.gmail.com>
 <CAKv+Gu80AJ+UDGLWpr=1sYT57J+6X8-KZ5HCYSEz9JpgWaTQxA@mail.gmail.com>
 <CAPcyv4j-Pz8uMTnz+OJZGguQqS1jOG4U+JkpsO7cBRFvs=-Ehg@mail.gmail.com>
 <CAKv+Gu_z0B9rK4NJgrZFXLXWhgi+LVj6E9555vx60LSEoRy9tg@mail.gmail.com>
 <CAPcyv4h8ez_nNUNVcOdHzjYB-Fh-VrB24p5aepN_GZ2g3jSxMQ@mail.gmail.com>
 <CAKv+Gu8U+3r-H0Oyru0J9RoS744kzbJDjYkm=_FVSRFjzR5pxQ@mail.gmail.com>
 <CAPcyv4iDMGsksCh4cHU3xooodn1e2tfSc70xTo-B_C2Ppnwsrw@mail.gmail.com>
 <CAKv+Gu8uGiy85vC=2sMuMCCP0J7e0qwnAxACR25bePC0zHw=8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu8uGiy85vC=2sMuMCCP0J7e0qwnAxACR25bePC0zHw=8w@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 03, 2016 at 07:07:05PM +0100, Ard Biesheuvel wrote:
> OK. But I'd still like Russell to indicate whether he agrees with all
> of this, i.e., wire up memremap() to perform MT_MEMORY_RW mappings in
> the vmalloc area of memory regions that may be potentially be covered
> by highmem as well.

I'm happy to go that way: go back to ioremap_cached() for pxa2xx-flash
and switch memremap() to MT_MEMORY_RW - I think that makes total sense.

I think it is worth putting a comment against ioremap_cached() saying
that it's for pxa2xx-flash.c though, and deprecated for new uses.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
