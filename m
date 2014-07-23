Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9utu-0000Y1-0z
 for linux-mtd@lists.infradead.org; Wed, 23 Jul 2014 11:40:02 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Bean Huo <beanhuo@outlook.com>
Subject: RE: [PATCH v6] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 23 Jul 2014 11:39:24 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EB06218@DBDE04.ent.ti.com>
References: <BLU436-SMTP223B6F83933407357F0FF3BA6F70@phx.gbl>
 <20140716180423.GV7537@ld-irv-0074>
 <BLU185-W53748517956B27745D7033A6F40@phx.gbl>
 <20140717011724.GW7537@ld-irv-0074>
In-Reply-To: <20140717011724.GW7537@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "christian.riesch@omicron.at" <christian.riesch@omicron.at>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris
>>On Thu, Jul 17, 2014 at 12:54:17AM +0000, Bean Huo wrote:
>> > I have just fixed up your patch myself, to use max() and to improve so=
me
>> > of the language. Let me know if the below works for you.
>>
>> hi,Brian
>> =A0Thanks once again.I test and it works Ok.It can be accepted now?
>
>Yes. Pushed to l2-mtd.git.
>
This works well with Spansion NOR device (S29GL512S10) present on
J6-EVM, using http://patchwork.ozlabs.org/patch/372866/.

Though it's already accepted in l2-mtd.git, but just for record.
Tested-by: Pekon Gupta <pekon@ti.com>


with regards, pekon
