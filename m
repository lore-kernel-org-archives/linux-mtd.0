Date: Thu, 30 Mar 2017 17:39:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: next-20170330 build: 2 failures 8 warnings (next-20170330)
Message-ID: <20170330173927.5665a0da@bbrezillon>
In-Reply-To: <20170330150742.wflswzqhg53mozx2@sirena.org.uk>
References: <E1ctZXC-0008DB-4g@optimist>
 <20170330150742.wflswzqhg53mozx2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On Thu, 30 Mar 2017 16:07:42 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Mar 30, 2017 at 01:50:39PM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an ARM allmodconfig due to:
> 
> > 	arm-allmodconfig
> > ../drivers/mtd/nand/atmel/nand-controller.c:2126:25: error: 'atmel_nc_id_table' undeclared here (not in a function)
> > ../include/linux/module.h:212:27: error: '__mod_of__atmel_nc_id_table_device_table' aliased to undefined symbol 'atmel_nc_id_table'  
> 
> caused by d09703f9459c94c78e029 (mtd: nand: Cleanup/rework the
> atmel_nand driver), it tries to export atmel_nc_id_table as the DT ID
> table but the variable is called atmel_nand_controller_of_ids. 

Pushed a fixed version to nand/next.

Thanks for the report.

Boris
