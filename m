Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMuji-0003Ww-SQ
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 09:11:48 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH v2 1/6] mtd: spi-nor: change return value of read/write
Date: Wed, 5 Aug 2015 11:11:20 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hou Zhiqiang <B48286@freescale.com>, Huang Shijie <shijie.huang@intel.com>
References: <cover.1438626500.git.hramrach@gmail.com>
 <201508041842.03871.marex@denx.de>
 <CAOMqctQfvWJZM1vGqvQrt_-R0NV1VC83NrrobZnuGTLEZzqFFw@mail.gmail.com>
In-Reply-To: <CAOMqctQfvWJZM1vGqvQrt_-R0NV1VC83NrrobZnuGTLEZzqFFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508051111.21068.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, August 05, 2015 at 10:27:05 AM, Michal Suchanek wrote:
> On 4 August 2015 at 18:42, Marek Vasut <marex@denx.de> wrote:
> > On Tuesday, August 04, 2015 at 08:42:51 AM, Michal Suchanek wrote:
> >> On 3 August 2015 at 23:46, Marek Vasut <marex@denx.de> wrote:
> >> > On Monday, August 03, 2015 at 08:39:01 PM, Michal Suchanek wrote:
> >> >> Change the return value of spi-nor device read and write methods to
> >> >> allow returning amount of data transferred and errors as
> >> >> read(2)/write(2) does.
> >> >> 
> >> >> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> >> >> ---
> >> >> 
> >> >>  include/linux/mtd/spi-nor.h | 4 ++--
> >> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >> 
> >> >> diff --git a/include/linux/mtd/spi-nor.h
> >> >> b/include/linux/mtd/spi-nor.h index e540952..7d782cb 100644
> >> >> --- a/include/linux/mtd/spi-nor.h
> >> >> +++ b/include/linux/mtd/spi-nor.h
> >> >> @@ -185,9 +185,9 @@ struct spi_nor {
> >> >> 
> >> >>       int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int
> >> >>       len,
> >> >>       
> >> >>                       int write_enable);
> >> >> 
> >> >> -     int (*read)(struct spi_nor *nor, loff_t from,
> >> >> +     ssize_t (*read)(struct spi_nor *nor, loff_t from,
> >> >> 
> >> >>                       size_t len, size_t *retlen, u_char *read_buf);
> >> >> 
> >> >> -     void (*write)(struct spi_nor *nor, loff_t to,
> >> >> +     ssize_t (*write)(struct spi_nor *nor, loff_t to,
> >> >> 
> >> >>                       size_t len, size_t *retlen, const u_char
> >> >>                       *write_buf);
> >> >>       
> >> >>       int (*erase)(struct spi_nor *nor, loff_t offs);
> >> > 
> >> > You realize that if someone does bisect and has only this patch
> >> > applied, the compiler will complain loudly about mismatching data
> >> > types, right ?
> >> > 
> >> > :)
> >> 
> >> Yes, the compiler prints a warning. However, only the return value
> >> which is not used changes so it should not cause any real problem.
> > 
> > Are you certain that ssize_t is equal to int , always , everywhere ? :-)
> 
> No, it's larger or equal.

Not per any standard to my knowledge, but yeah.  I don't think it's a good
idea to do this change alone.

> > Note that it is possible to do such conversion even without introducing
> > compiler warnings along the way -- just do the data type conversion first
> > and the other changes in subsequent patches. It will be clear that one
> > patch does one thing then.
> 
> If this is the only concern with these patches it is easily amended ;-)

It'd be nice if the others reviewed it as well, additional feedback would be 
nice.

Best regards,
Marek Vasut
