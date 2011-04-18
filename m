Subject: Re: [PATCH V2 2/2] mtd: msm_nand: Add initial msm nand driver support.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4DABE8FE.5040300@parrot.com>
References: <1302938249-4601-1-git-send-email-mnalajal@codeaurora.org>
	<4DABE8FE.5040300@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Apr 2011 10:56:06 +0300
Message-ID: <1303113366.2815.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	Dima Zavin <dima@android.com>,
	Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
	Murali Nalajala <mnalajal@codeaurora.org>,
	Brian Swetland <swetland@google.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-18 at 09:32 +0200, Matthieu CASTET wrote:
> Hi,
> 
> Murali Nalajala a écrit :
> > Add initial msm nand driver support for Qualcomm MSM platforms.
> > This driver is capable of handling both 2k and 4k page support
> > nand devices.
> > 
> > This driver was originally developed by Arve Hjønnevåg at google.
> > Its source is available at
> > http://android.git.kernel.org/?p=kernel/msm.git under
> > android-msm-2.6.35 branch.
> > 
> > CC: Dima Zavin <dima@android.com>
> > CC: Brian Swetland <swetland@google.com>
> > CC: Arve Hjønnevåg <arve@android.com>
> > Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
> > ---
> > Changes in V2
> > * Turn most of the pr_info() calls into pr_debug().
> > 
> >  drivers/mtd/devices/Kconfig    |   11 +
> >  drivers/mtd/devices/Makefile   |    1 +
> >  drivers/mtd/devices/msm_nand.c | 1597 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/mtd/devices/msm_nand.h |   77 ++
> >  4 files changed, 1686 insertions(+), 0 deletions(-)
> >  create mode 100644 drivers/mtd/devices/msm_nand.c
> >  create mode 100644 drivers/mtd/devices/msm_nand.h
> > 
> 
> For the record, I am not sure it is a great idea to make nand drivers
> independent of the nand layer.

This is not acceptable. Nand drivers should use the nand_base framework.
If the framework is limiting, buggy, slow, etc for your case (which is
quite possible) - the framework should be improved.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
