Message-ID: <4FB9FCDE.9070803@freescale.com>
Date: Mon, 21 May 2012 16:29:18 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] GPMI-NAND: Define ecc.strength
References: <1337571865-8016-1-git-send-email-marex@denx.de>
 <1337587991.2483.65.camel@sauron.fi.intel.com>
In-Reply-To: <1337587991.2483.65.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B405=E6=9C=8821=E6=97=A5 16:13, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2012-05-21 at 05:44 +0200, Marek Vasut wrote:
>> The ecc.strength wasn't set, resulting in the following crash:
> How about ccing -stable? Can you find out which commit broke the driver=
?
>
The commit cfbc855b (mtd: nand:add sanity check of ecc strength to=20
nand_scan_tail()

Huang Shijie
