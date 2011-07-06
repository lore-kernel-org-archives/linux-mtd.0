MIME-Version: 1.0
In-Reply-To: <1309935216.3149.72.camel@sauron>
References: <1309319494-17951-1-git-send-email-leiwen@marvell.com>
	<1309771536-10597-4-git-send-email-leiwen@marvell.com>
	<1309935216.3149.72.camel@sauron>
Date: Wed, 6 Jul 2011 14:54:39 +0800
Message-ID: <CALZhoSSJmcCxEtMXMtfsBKpeOJzqbAt56_RB_Vpqihhuk3Aw=w@mail.gmail.com>
Subject: Re: [PATCH 3/4] MTD: pxa3xx_nand: enable multiple chip select support
From: Lei Wen <adrian.wenl@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 6, 2011 at 2:53 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> The problem is that in this patch you change =A0struct pxa3xx_nand_platfo=
rm_data,
> and in the next patch you amend the platform data declarations, which mea=
ns that
> the kernel will not compile between patches 3 and 4...

So... how about merge the patch 3 and 4 together?

>
> On Mon, 2011-07-04 at 02:25 -0700, Lei Wen wrote:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_info(&info->pdev->dev, "There is no na=
nd chip on cs %d!\n"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 , info->cs=
);
>
> Nitpick - keep the comma at the first line.

Opps, sorry for this.

Thanks,
Lei
