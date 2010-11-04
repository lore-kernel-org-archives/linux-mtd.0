Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDoPr-0005t4-RF
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2010 01:15:01 +0000
Received: by pvg7 with SMTP id 7so510336pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Nov 2010 18:14:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
Date: Thu, 4 Nov 2010 10:14:57 +0900
Message-ID: <AANLkTikUSTnPedgdP19_bNbhOtSdfApdyCLKMyn+6Ext@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program feature for 4kb
	page onenand
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

One concern is that after apply patch, there are some 1-bit ECC
warnings so UBI scrubbing messages are displayed.

Are there these message at your board?

Thank you,
Kyungmin Park

On Wed, Nov 3, 2010 at 7:55 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> Implement cache program feature for 4KB page onenand.
> This feature improves the write data performance.
> The observed 128KB data program speed change is
> from 8827KB/s to 14156 KB/s when the feature is enabled.
>
> Roman Tereshonkov (3):
> =A0mtd: onenand: add option and variable for cache program feature
> =A0mtd: onenand: fix omap2 code to handle cache program feature
> =A0mtd: onenand: implement cache program feature for 4kb page onenand
>
> =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 +++++++++---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 22 +++++++++++++++++++---
> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 12 ++++++++++++
> =A03 files changed, 40 insertions(+), 6 deletions(-)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
