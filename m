Message-ID: <4F03BCE1.80006@freescale.com>
Date: Wed, 4 Jan 2012 10:43:45 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v2] MTD/GPMI bugfix : reset the BCH module when it is
 not MX23
References: <1325233646-3343-1-git-send-email-b32955@freescale.com>
 <20111230143658.GA9141@pengutronix.de> <4EFE7236.10609@freescale.com>
 <20111231154338.GA27544@pengutronix.de>
 <CAMiH66HsFn4+6-whEC6G-qSPda3+3pBzd50i7iHh9Pg9TXHTXw@mail.gmail.com>
 <20120101223335.GA3756@pengutronix.de>
 <CAMiH66Fwh-su6ucLDMM7hhCjH7MJPeavt1u4O=_jWn5w=DyfKA@mail.gmail.com>
 <20120103111114.GA9083@pengutronix.de>
In-Reply-To: <20120103111114.GA9083@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Cc: baruch@tkos.co.il, koen.beel.barco@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Artem.Bityutskiy@intel.com,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
> Due to Errata #2847 of the MX23, the BCH cannot be soft reset on this
> chip, otherwise it will lock up. So we skip resetting BCH on the MX23.
> On the other hand, the MX28 needs the reset, because one case has been
> seen where the BCH produced ECC errors constantly after 10000
> consecutive reboots. The latter case has not been seen on the MX23 yet,
> still we don't if it could happen there as well.
>
> ===
>
> What do you think?
>
ok, thanks. I will add this comment to the patch.

Huang Shijie
