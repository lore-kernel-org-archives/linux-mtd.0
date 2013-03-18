Message-ID: <51478949.2080400@infradead.org>
Date: Mon, 18 Mar 2013 14:38:17 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Mar 18 (mtdcore)
References: <20130318161841.a8f926f51a0b00033e2ee94c@canb.auug.org.au>
In-Reply-To: <20130318161841.a8f926f51a0b00033e2ee94c@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/17/13 22:18, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130315:
> 


when CONFIG_PROC_FS is not enabled:

  CC [M]  drivers/mtd/mtdcore.o
drivers/mtd/mtdcore.c: In function 'init_mtd':
drivers/mtd/mtdcore.c:1183:2: error: 'proc_mtd' undeclared (first use in this function)
drivers/mtd/mtdcore.c:1183:2: note: each undeclared identifier is reported only once for each function it appears in
drivers/mtd/mtdcore.c: In function 'cleanup_mtd':
drivers/mtd/mtdcore.c:1208:2: error: 'proc_mtd' undeclared (first use in this function)
make[3]: *** [drivers/mtd/mtdcore.o] Error 1



-- 
~Randy
