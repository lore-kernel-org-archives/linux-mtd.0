From: =?iso-2022-jp?B?QmVhbiBIdW8gGyRCcDlJTElMGyhCIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Sun, 30 Nov 2014 16:11:06 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315EE639@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
 <20141126211240.GD21347@ld-irv-0074>
 <A765B125120D1346A63912DDE6D8B6315EE059@NTXXIAMBX02.xacn.micron.com>
 <20141127091448.GU3212@norris-Latitude-E6410>
In-Reply-To: <20141127091448.GU3212@norris-Latitude-E6410>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>Also, which SPI NOR is this enabled for? I don't see any Micron entries =
in spi_nor_ids[] which contain the SPI_NOR_QUAD_READ flag.
>>=20
>> Yes, we now don't see any Micron entries in spi_nor_ids[] which=20
>> contain the SPI_NOR_QUAD_READ flag. But Micron spi nor in=20
>> spi_nor_ids[] all support Quad I/O mode.

>Then add them! At least, for flash that support them (for all packages tha=
t might share the same ID).

Ok,I will add them for our Micron spi nor.

>> This patch is just for wanting to enable Micron Quad I/O mode.

>That's fine. But I'd welcome any follow-up patch to add the QUAD flag to t=
he right Micron table entries. Otherwise, this patch doesn't actually help =
anyone.

>BTW, given that you aren't changing any entries to spi_nor_ids[] yet, have=
 you actually tested this patch? Or are you only working off the specificat=
ions / datasheets?

Yes, I have tested my patch based on latest linux kernel ,the spi nor  are =
just our Micron spi nor,
such as 45nm MT25QL256Mb and Mt25TL245Mb.Before submitting a patch, our tea=
m will review and test it.
only past testing and confirm OK,this patch can be submitted.=20

>Thanks,
>Brian

Hi, Brian

Thanks again for your warming response. I rebase a new version patch based =
on latest l2-mtd.
Besides, we will submit patch by our personal email.
