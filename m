Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8fdM-0002qV-Lt
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 01:42:05 +0000
Received: by mail-la0-f45.google.com with SMTP id gq15so936695lab.4
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jan 2015 17:41:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150107011242.GA30740@shldeISGChi005.sh.intel.com>
References: <1417814086-30512-1-git-send-email-festevam@gmail.com>
 <20150106064931.GB13447@norris-Latitude-E6410>
 <20150107011242.GA30740@shldeISGChi005.sh.intel.com>
Date: Tue, 6 Jan 2015 23:41:42 -0200
Message-ID: <CAOMZO5CO2QYdmXUECizoV+76v9Woc=v31HHYjcORYUXoYxLibQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Fix module unbound
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Frank Li <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, Jan 6, 2015 at 11:12 PM, Huang Shijie <shijie.huang@intel.com> wrote:

> The qspi controller can connect with two SPI flashes at the same time.
> Most of the time, we only connect one flash to it.
>
> Use this property can makes the DTS file simple. If we remove this
> propery, we have to add a long same child node for the qspi.
>
> But i think it is ok to remove it, if Brian thinks it is odd.
>
> Hi Fabio, could you please create a correct patch based on Brian's sample patch?
>
> If you do not have time, please tell me. :)

It would be nice if you could generate such patch, if possible. Thanks
