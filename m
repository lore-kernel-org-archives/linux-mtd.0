Date: Mon, 12 Feb 2018 12:08:06 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Lionel Debieve <lionel.debieve@st.com>
cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 haver@linux.vnet.ibm.com, u.kleine-koenig@pengutronix.de,
 joel@clambassador.com, schwarzerf@gmail.com,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH 1/1] mtd: ubi: Update ubi-media.h to dual license
In-Reply-To: <20180212105642.8662-2-lionel.debieve@st.com>
Message-ID: <alpine.DEB.2.21.1802121206440.1158@nanos.tec.linutronix.de>
References: <20180212105642.8662-1-lionel.debieve@st.com>
 <20180212105642.8662-2-lionel.debieve@st.com>
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

On Mon, 12 Feb 2018, Lionel Debieve wrote:

> Update license template using SPDX. Move the global layout
> of UBI headers to dual license helping UBI to be the standard
> solution for raw NAND management.

No objections from my side, but you really need to poke IBM about that. And
if that happens then the kernel header. where this is copied from needs to
be updated as well....

Thanks,

	tglx
