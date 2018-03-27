Date: Tue, 27 Mar 2018 23:06:33 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
cc: Lionel Debieve <lionel.debieve@st.com>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, joel@clambassador.com,
 schwarzerf@gmail.com, linux-arm-kernel@lists.infradead.org,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, haver@linux.vnet.ibm.com
Subject: Re: [PATCH 1/1] mtd: ubi: Update ubi-media.h to dual license
In-Reply-To: <CAFLxGvxcWLxHyTzgbGssqOEUp2=TU07mLk1-XHavL4HU8N7caQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1803272305350.1618@nanos.tec.linutronix.de>
References: <20180212105642.8662-1-lionel.debieve@st.com>
 <20180212105642.8662-2-lionel.debieve@st.com>
 <CAFLxGvxcWLxHyTzgbGssqOEUp2=TU07mLk1-XHavL4HU8N7caQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Mar 2018, Richard Weinberger wrote:

> On Mon, Feb 12, 2018 at 11:56 AM, Lionel Debieve <lionel.debieve@st.com> wrote:
> > Update license template using SPDX. Move the global layout
> > of UBI headers to dual license helping UBI to be the standard
> > solution for raw NAND management.
> 
> So the goal is re-implementing UBI under a non-GPL license?
> 
> If we get a clear ack from all major UBI copyright holders, fine by me.

I already acked that for the u-boot SPL code. So yes:

Acked-by: Thomas Gleixner <tglx@linutronix.de>
