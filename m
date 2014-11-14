From: bpqw <bpqw@micron.com>
To: Graham Moore <grmoore@opensource.altera.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [V5 PATCH 1/1] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Fri, 14 Nov 2014 02:06:04 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315EBFB7@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315EA24E@NTXXIAMBX02.xacn.micron.com>
 <54613259.4070903@opensource.altera.com>
 <alpine.DEB.2.02.1411111336010.1356@lava-test-server>
 <A765B125120D1346A63912DDE6D8B6315EB0DA@NTXXIAMBX02.xacn.micron.com>
 <alpine.DEB.2.02.1411130945300.19890@lava-test-server>
In-Reply-To: <alpine.DEB.2.02.1411130945300.19890@lava-test-server>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, bpqw <bpqw@micron.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> This maybe your spi controller is still extended mode, Once EVCR bit 7=20
>> is set to 0, the spi nor device will operate in quad I/O.Command-address=
-data line is 4-x-4.
>> So after send WRITE EVCR command , spi controller also  must transfer=20
>> to quad I/O Mode,and set its Command-address-data line also Should be 4-=
x-4 .

>Thanks, this helped.  I added some code to snoop the command stream for WR=
ITE EVCR with quad mode,=20
>and then set up the quad mode in the controller.  Seems kinda ugly, but wo=
rking now.

>-Graham

Yes ,if enable spi nor Quad I/O, firstly, must check spi controller if supp=
ort Quad I/O protocol,
and after enable spi nor Quad I/O mode ,spi controller also must be transfe=
rred to Quad I/O protocol.
Their two side must be matched together.
Maybe spi controller can do this changes.

Hi,Brian

Can you give me some tips about this patch? Thanks!

-Bean Huo
