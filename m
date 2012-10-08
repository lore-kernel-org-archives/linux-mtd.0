Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLGRN-0004ZQ-N3
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 16:44:26 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so4528467pbc.36
 for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2012 09:44:23 -0700 (PDT)
Message-ID: <507302D5.5050802@gmail.com>
Date: Mon, 08 Oct 2012 22:14:05 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: i.MX6S/GPMI-NAND issue on 3.5.4
References: <505CB1ED.8010909@gmail.com> <50723FCE.4000708@freescale.com>
In-Reply-To: <50723FCE.4000708@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/8/2012 8:21 AM, Huang Shijie wrote:
> 于 2012年09月22日 02:29, Vikram Narayanan 写道:
>> Hello,
>>
>> I'm facing some issue with GPMI-NAND driver on i.MX6 solo.
> Does the MX6Q solo support the NAND?

Yes. i.Mx6Solo supports NAND.

> I have the solo board in my hand. But it can not support the NAND.
> 
> You make the board yourself?
> If so, please check the pinmux for solo.

Yeah I figured out that pinctrl driver was the problem.Anyway thanks for
the pointing it out.

Regards,
Vikram
