Subject: Re: [PATCHv2] MTD: Suppress warnings in inline_map_read()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <e970485f0e9f4c9e1cb6e594a45dd11308683197@localhost.localdomain>
References: <1270891582.4704.102.camel@macbook.infradead.org>
	<e970485f0e9f4c9e1cb6e594a45dd11308683197@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 10:46:28 +0300
Message-ID: <1272354388.26036.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-04-10 at 11:18 -0700, Kevin Cernekee wrote:
> With gcc 4.4.3 -O2 on MIPS32:
> 
> drivers/mtd/chips/cfi_util.c: In function 'cfi_qry_present':
> include/linux/mtd/map.h:390: warning: 'r' may be used uninitialized in this function
> include/linux/mtd/map.h:375: note: 'r' was declared here
> include/linux/mtd/map.h:390: warning: 'r' may be used uninitialized in this function
> include/linux/mtd/map.h:375: note: 'r' was declared here
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Pushed to l2-mtd-2.6 / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
