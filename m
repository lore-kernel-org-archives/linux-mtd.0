From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH] mtd: stm32-quadspi: replace "%p" with "%pK"
Date: Fri, 06 Jul 2018 16:49:55 +0200
Message-ID: <1574993.BxlVuaNddV@blindfold>
In-Reply-To: <20180706164732.5776df5a@bbrezillon>
References: <20180706130525.22223-1-benjamin.gaignard@st.com>
 <32602293.7BQn8HeLUA@blindfold> <20180706164732.5776df5a@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 6. Juli 2018, 16:47:32 CEST schrieb Boris Brezillon:
> On Fri, 06 Jul 2018 16:44:44 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
> > Am Freitag, 6. Juli 2018, 15:05:25 CEST schrieb Benjamin Gaignard:
> > > The format specifier "%p" can leak kernel addresses.
> > > Use "%pK" instead.  
> > 
> > Does %pK really make sense for dev_dbg()?
> > When the driver is being debugged "leaking" is on purpose. :)
> 
> %p already gives you a hash of the pointer address. At least with %pK
> you can turn it off through a sysctl :).

Once again I mixed %p and %pK.
So then %pK is what we want. :D

Thanks,
//richard
