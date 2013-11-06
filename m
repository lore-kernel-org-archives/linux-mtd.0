Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve7Vy-0007qM-34
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 18:07:40 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Wei Yongjun
 <weiyj.lk@gmail.com>
Subject: RE: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
Date: Wed, 6 Nov 2013 18:06:25 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA31818@DBDE04.ent.ti.com>
References: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
 <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
 <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
In-Reply-To: <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "tony@atomide.com" <tony@atomide.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Daniel Mack <zonque@gmail.com>,
 "yongjun_wei@trendmicro.com.cn" <yongjun_wei@trendmicro.com.cn>,
 "avinashphilip@ti.com" <avinashphilip@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> > On Thu, Oct 31, 2013 at 7:18 PM, Jingoo Han <jg1.han@samsung.com>
> >> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >>
> >> Fix to return a negative error code from the error handling
> >> case instead of 0, as done elsewhere in this function.
> >
> > Commit message is right? :-(
>=20
> It sounds OK by my reading. Unless you're having trouble parsing what
> "as done elsewhere in this function" is being applied to. (IOW, is the
> rest of the function returning a negative error code on the error
> paths, or is it returning 0? Of course the answer is the former, but
> it's possible to misread it.) If it helps, I can try to tweak the
> wording a bit when applying this patch.
>=20
> Pekon, can I get an Acked-by?
>=20
Yes sure .. Sorry I was away from both mailbox and boards.
Acked-by: Pekon Gupta <pekon@ti.com>

And thanks much Wei Yongjun for fixing this .


with regards, pekon
