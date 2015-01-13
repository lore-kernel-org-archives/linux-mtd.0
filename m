Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB3VB-0007hD-21
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 15:35:29 +0000
Received: by mail-la0-f54.google.com with SMTP id pv20so3216810lab.13
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 07:35:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150109201743.GW9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
Date: Tue, 13 Jan 2015 13:35:02 -0200
Message-ID: <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, Jan 9, 2015 at 6:17 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> OK, I still don't think you've got things right here.
>
> Are you testing this with a two-flash system? What sort of tests?

Yes, there are two qspi flashes on imx6sx-sdb board.

The test I do are:

- module unload/load - When I was adding dts support for imx6sx-sdb I
would like to be able to load/unload the qspi driver. This is not
possible currently, and this was the motivation for this series.

- Read the two flashes.

root@freescale /$ dd if=/dev/mtd0 of=/dev/null bs=1M count=1
1+0 records in
1+0 records out
1048576 bytes (1.0MB) copied, 0.047851 seconds, 20.9MB/s

root@freescale /$ dd if=/dev/mtd1 of=/dev/null bs=1M count=1
1+0 records in
1+0 records out
1048576 bytes (1.0MB) copied, 0.052515 seconds, 19.0MB/s

Not sure what is the correct way to fix this though.

Regards,

Fabio Estevam
