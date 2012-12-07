Message-ID: <50C1C784.4040209@ti.com>
Date: Fri, 7 Dec 2012 16:10:04 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: Re: [PATCH v3 1/3] mtd: nand: omap2: Update nerrors using ecc.strength
References: <1354189595-12784-1-git-send-email-avinashphilip@ti.com>
 <1354189595-12784-2-git-send-email-avinashphilip@ti.com>
 <50BF3819.9010200@ti.com>
 <518397C60809E147AF5323E0420B992E3EA1139B@DBDE01.ent.ti.com>
In-Reply-To: <518397C60809E147AF5323E0420B992E3EA1139B@DBDE01.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hebbar,
 Gururaja" <gururaja.hebbar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/5/2012 6:13 PM, Philip, Avinash wrote:
> On Wed, Dec 05, 2012 at 17:33:37, Nori, Sekhar wrote:
>> Hi Avinash,
>>
>> On 11/29/2012 5:16 PM, Philip, Avinash wrote:
>>> Update number of errors using nand ecc strength.
>>> Also add macro definitions BCH8_ERROR_MAX & BCH4_ERROR_MAX
>>
>> Can you please describe why the original method of setting nerrors was
>> incorrect? Was it causing any issues in any particular configuration?
> 
> It affects the reusability of the code. For example BCH8 with AM335x RBL 
> compatibility requires  14 bytes instead of 13 byte. So setting nerrors
> with
> 	nerrors = (info->nand.ecc.bytes == 13) ? 8 : 4;
> will break am335x RBL compatibility.

This should be summarized in the patch description so the motivation is
clear to those who read the history later.

Thanks,
Sekhar
