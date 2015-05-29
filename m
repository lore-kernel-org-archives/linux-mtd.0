Date: Fri, 29 May 2015 10:08:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: use cfi-util in jedecprobe
Message-ID: <20150529170818.GU27753@ld-irv-0074>
References: <7230287.A5AxNMN3qP@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7230287.A5AxNMN3qP@wuerfel>
Cc: Denys Vlasenko <dvlasenk@redhat.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Fri, May 29, 2015 at 10:39:28AM +0200, Arnd Bergmann wrote:
> A recent change to move cfi helper functions out of line
> is causing build errors when cfi-util is a loadable module
> and jedecprobe is built-in:
> 
> drivers/built-in.o: In function `jedec_reset':
> (.text+0x140694): undefined reference to `cfi_send_gen_cmd'
> drivers/built-in.o: In function `jedec_probe_chip':
> (.text+0x140794): undefined reference to `cfi_build_cmd_addr'
> 
> This adds a 'select' for the module containing these functions
> from the jedecprobe code, to ensure it is always reachable.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 4612c715a6ea6 ("mtd: cfi: deinline large functions")

Already caught and fixed:

http://patchwork.ozlabs.org/patch/477464/

Thanks!
