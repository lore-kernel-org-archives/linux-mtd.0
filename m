Date: Thu, 12 Dec 2013 12:14:27 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH V2 0/4] mtd: spi-nor: add a new framework for SPI NOR
Message-ID: <20131212041425.GA1460@gmail.com>
References: <1386318764-15882-1-git-send-email-b32955@freescale.com>
 <52A881CF.4020001@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52A881CF.4020001@ti.com>
Cc: marex@denx.de, angus.clark@st.com, broonie@linaro.org, lee.jones@linaro.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 11, 2013 at 08:46:31PM +0530, Sourav Poddar wrote:
> As you see in my patches, once we take care of the above points and
> add support
> for memory mapped in m25p80 and qspi, then while doing a read in
> m25p80 we can
> do memcpy at the beginning of m25p80_read and can bypass the entire SPI
> framework for memory mapped read operation. Throughput almost gets
> doubles with this,
> as compared to normal SPI operations.
> 
> So, my intention of reviving this here is to add one more feature
> set, which I suppose
> spi nor framework should handle and to see what needs to be added
> more for this feature.

I already read your patch.

My quadspi driver also uses the memory map mode.
The memory map mode is the default mode for the quadspi driver's read.


You can setup the registers for memory map in the probe() or some other
places.  And use the spi_nor->read() hook to do the memcpy in your driver.


thanks
Huang Shijie
