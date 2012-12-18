Received: from mail-pb0-f43.google.com ([209.85.160.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tkms0-0003Eu-Px
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2012 02:25:25 +0000
Received: by mail-pb0-f43.google.com with SMTP id um15so66156pbc.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2012 18:25:22 -0800 (PST)
Message-ID: <50CFD40B.3010302@gmail.com>
Date: Tue, 18 Dec 2012 07:55:15 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: UBI IO errors with GPMI NAND
References: <50CBF18B.3050208@gmail.com> <50CFCBDC.6090102@freescale.com>
In-Reply-To: <50CFCBDC.6090102@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

On 12/18/2012 7:20 AM, Huang Shijie wrote:
> 于 2012年12月15日 11:42, Vikram Narayanan 写道:
>> I'm using a i.Mx6 Solo based custom board with the below NAND chip.
> The gpmi-nand can not run in the imx6 solo board. Please check the
> PINMUX for the gpmi. It is not ready.

I adapted the PINMUX for Solo variant. Is there any other thing other 
than PINUMX which restricts the usage on i.Mx6 solo?

Regards,
Vikram
