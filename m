Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfWwC-0006eQ-7p
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 17:37:39 +0000
Received: by pacfv12 with SMTP id fv12so113488536pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2015 10:37:15 -0700 (PDT)
Date: Fri, 25 Sep 2015 10:37:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?=
 <peterpandong@micron.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "fransklaver@gmail.com" <fransklaver@gmail.com>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "zajec5@gmail.com" <zajec5@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "baruch@tkos.co.il" <baruch@tkos.co.il>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "rogerq@ti.com" <rogerq@ti.com>,
 "asierra@xes-inc.com" <asierra@xes-inc.com>, bpqw <bpqw@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Liu =?utf-8?B?5YiY576kIChmcmFua2xpdSk=?= <frankliu@micron.com>,
 Kamil Debski <Kamil.Debski@imgtec.com>,
 Ionela Voinescu <Ionela.Voinescu@imgtec.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Subject: Re: [PATCH 12/12] mtd: nand-bbt: move nand_bbt.c to mtd folder
Message-ID: <20150925173712.GM31505@google.com>
References: <87F60714EC601C4C83DFF1D2E3D390A0326CC82E@NTXXIAMBX02.xacn.micron.com>
 <87F60714EC601C4C83DFF1D2E3D390A0326CC91F@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A0326CC91F@NTXXIAMBX02.xacn.micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

First of all, thanks for taking the time to try to address my
long-delayed comments. I hope to give this a proper look soon. (I also
hope you can fix the email threading soon! I know that's a pain...)

But first, a simpler comment:

On Fri, Sep 25, 2015 at 06:48:05AM +0000, Peter Pan 潘栋 (peterpandong) wrote:
> Since struct nand_chip is removed from nand_bbt.c, BBT is now
> shareable. Both NAND and SPI NAND can use it. So move nand_bbt.c
> from nand/ foler to mtd/ folder and create MTD_NAND_BBT config.
> Both NAND and SPI NAND should depend on MTD_NAND_BBT.
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/Kconfig         |    7 +
>  drivers/mtd/Makefile        |    1 +
>  drivers/mtd/nand/Kconfig    |    2 +-
>  drivers/mtd/nand/Makefile   |    2 +-
>  drivers/mtd/nand/nand_bbt.c | 1289 -------------------------------------------
>  drivers/mtd/nand_bbt.c      | 1289 +++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 1299 insertions(+), 1291 deletions(-)
>  delete mode 100644 drivers/mtd/nand/nand_bbt.c
>  create mode 100644 drivers/mtd/nand_bbt.c
> 
[...]
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> deleted file mode 100644
> index 47c1084..0000000
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ /dev/null
> @@ -1,1289 +0,0 @@

[snip deleting entire file]

> diff --git a/drivers/mtd/nand_bbt.c b/drivers/mtd/nand_bbt.c
> new file mode 100644
> index 0000000..47c1084
> --- /dev/null
> +++ b/drivers/mtd/nand_bbt.c
> @@ -0,0 +1,1289 @@

[snip adding the whole file again -- exactly the same I hope?]

When moving files, it helps if you can use the '-M' (or
'--find-renames') option to git-format-patch. That will give much
smaller output that's easier to review. And if you had to change
anything in the move, it should also help highlight exactly what
changed, instead of including the entire file "diff".

Regards,
Brian

P.S. Incidentally, this should also work around your issues with the
copyright symbol. But then, I suspect that some people have used these
sorts of non-ASCII characters just to fish out issues with mail
clients/MTAs like yours :)
