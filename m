Date: Thu, 5 Dec 2013 15:33:49 +0800
From: Huang Shijie <b32955@freescale.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: add a new framework for SPI NOR
Message-ID: <20131205073348.GB8936@shlinux2.ap.freescale.net>
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA51905@DBDE04.ent.ti.com>
 <529EE5F1.9080806@st.com> <201312041636.20875.marex@denx.de>
 <529FE81C.4000608@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA51E1A@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA51E1A@DBDE04.ent.ti.com>
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, Angus Clark <angus.clark@st.com>,
 "broonie@linaro.org" <broonie@linaro.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 05:43:05AM +0000, Gupta, Pekon wrote:
> >From: Huang Shijie [mailto:b32955@freescale.com]
> >
> >>=E4=BA=8E 2013=E5=B9=B412=E6=9C=8804=E6=97=A5 23:36, Marek Vasut =E5=86=
=99=E9=81=93:
> >> I disagree we should bloat the API with features, that will be used =
by "possible
> >> future controllers" or "possible single controller", right from the =
start. The
> >> real question here is, can the API be designed in such a way, that t=
he SR
> >> polling will happen in software NOW and only when a controller appea=
rs that can
> >> do polling in HW will the API be extended to support it ?
> >ok. Let's add this feature in the future when a real case occurs.
> >
> Sorry got lost.. Can you please summarize following plans for your next=
 patch:
>=20
> (1) Polling of status registers should be=20
>   (a) done in S/W (generic driver)
>   (b) done controller driver, which can be optimized for specific hardw=
are
>=20
For (b), we can implement the @wait_till_ready hook for the controller dr=
iver.

For (a), we use the default hook for @wait_till_ready.



> (2) How do you plan to have timeout value, (as serial flash can be pret=
ty slow
>    to access) ?
>   (a) independent for each access
>        - read timeouts per sector, which can be multiplied with read_le=
n/sector_size
>        - write timeout per sector, which can be multiplied with write_l=
en/sector_size
>        - erase timeout per block, which can be multiplied with erase_le=
n/block_size
>   (b) Any other method, or leave it to controller driver ?
>=20

Since i have no idea about this kind of spi-nor controller, so I prefer t=
he (b).=20

> In my view, before proceeding to writing down a patch, I think
> we should come-up with a doc/Readme, which defines all API and interfac=
e
> structs (taking Angus' proposal as baseline). And then refine that spec=
 first.
> Otherwise there may be too many revisions spent on patch RFC's ..=20
>=20
> Any thoughts ?
> And is there a space in kernel_docs for such specs ?

maybe the best solution is I send out the new version as soon as possible=
.

thanks
Huang Shijie
