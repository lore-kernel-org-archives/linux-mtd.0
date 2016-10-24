Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byaKH-0006rE-Vz
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 08:09:47 +0000
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34244)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1byaJt-000p2B-UP
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 04:09:25 -0400
Received: by mail-lf0-f52.google.com with SMTP id b81so180177368lfe.1
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 01:09:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OS2PR01MB007355EE4F7CBD8647D65CD8DFC50@OS2PR01MB0073.jpnprd01.prod.outlook.com>
References: <OS2PR01MB007355EE4F7CBD8647D65CD8DFC50@OS2PR01MB0073.jpnprd01.prod.outlook.com>
From: Jagan Teki <jagan@openedev.com>
Date: Mon, 24 Oct 2016 13:39:19 +0530
Message-ID: <CAD6G_RRTiToQScvOSCyrUn7XR9oLhoi574FabypAfPtSoMRF9g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for mr25h40
To: IWAMOTO Masahiko <iwamoto@allied-telesis.co.jp>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 YAMAMOTO Hiroyuki <hyamamo@allied-telesis.co.jp>,
 PACKHAM Chris <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 5, 2016 at 1:52 PM, IWAMOTO Masahiko
<iwamoto@allied-telesis.co.jp> wrote:
>
> Add Everspin mr25h40 512KB MRAM to the list of supported chips.
>
> Signed-off-by: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>

Reviewed-by: Jagan Teki <jagan@openedev.com>

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
