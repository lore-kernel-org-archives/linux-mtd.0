Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDHQe-0000SN-CC
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 14:01:38 +0000
Received: by pvg7 with SMTP id 7so917321pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2010 07:01:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
Date: Tue, 2 Nov 2010 23:01:35 +0900
Message-ID: <AANLkTikxkdX4CGn5ofMRzwoHch-PoOEgPaYXrg_50cpx@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: onenand: add cache program feature for 4kb page
	onenand
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thank you for your works.

I'll check your patch in my board, 2KiB & 4KiB pagesize.

Thank you,
Kyungmin Park

On Tue, Nov 2, 2010 at 8:25 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> Implement cache program feature for 4KB page onenand.
> This feature improves the write data performance.
> The observed 128KB data program speed change is
> from 8827KB/s to 14156 KB/s when the feature is enabled.
>
> Roman Tereshonkov (3):
> =A0mtd: onenand: add option and variable for cache program feature
> =A0mtd: onenand: introduce not "real" commands for cache program
> =A0 =A0feature.
> =A0mtd: onenand: implement cache program feature for 4kb page onenand
>
> =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 ++++++++--
> =A0drivers/mtd/onenand/onenand_base.c | =A0 39 ++++++++++++++++++++++++++=
++++++++-
> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 12 +++++++++++
> =A0include/linux/mtd/onenand_regs.h =A0 | =A0 =A02 +
> =A04 files changed, 60 insertions(+), 5 deletions(-)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
