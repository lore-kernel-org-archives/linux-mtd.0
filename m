Subject: Re: [PATCH] MTD: Suppress warnings in inline_map_read()
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <fb80b9139bec21ac8bd4ddcec0abeb9c1ad39ad5@localhost.localdomain>
References: <fb80b9139bec21ac8bd4ddcec0abeb9c1ad39ad5@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 10 Apr 2010 10:26:22 +0100
Message-ID: <1270891582.4704.102.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-09 at 15:45 -0700, Kevin Cernekee wrote:
> With gcc 4.4.3 -O2 on MIPS32:
> 
> drivers/mtd/chips/cfi_util.c: In function 'cfi_qry_present':
> include/linux/mtd/map.h:390: warning: 'r' may be used uninitialized in this function
> include/linux/mtd/map.h:375: note: 'r' was declared here
> include/linux/mtd/map.h:390: warning: 'r' may be used uninitialized in this function
> include/linux/mtd/map.h:375: note: 'r' was declared here
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

I suspect 'else BUG()' would be a better fix.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
