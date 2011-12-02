Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWWuX-0006lM-C5
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2011 17:28:34 +0000
Received: by wgbdt11 with SMTP id dt11so1015663wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2011 09:28:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
 <1322728943.2332.13.camel@koala>
 <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
Date: Fri, 2 Dec 2011 09:28:30 -0800
Message-ID: <CAN8TOE-YkQvm76ZXxh-CBF05y6BoHY+FM95-TtJdAiP0knhZtg@mail.gmail.com>
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Brian Norris <computersforpeace@gmail.com>
To: Grazvydas Ignotas <notasas@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, dedekind@infradead.org,
 Jan Weitzel <j.weitzel@phytec.de>, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 2, 2011 at 2:20 AM, Grazvydas Ignotas <notasas@gmail.com> wrote:
> On Thu, Dec 1, 2011 at 10:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Tue, 2011-11-29 at 10:00 +0100, Jan Weitzel wrote:
>>> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
>>
>> Pushed to l2-mtd-2.6.git, thank you!
>
> This breaks build here, did you really test it, Jan?
>
> drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
> drivers/mtd/nand/omap2.c:1078: error: 'struct omap_nand_platform_data'
> has no member named 'options'

This is exactly what I was asking already. I don't see 'options' in
'struct omap_nand_platform_data' in
'arch/arm/plat-omap/include/plat/nand.h', even in linux-next.

Brian
