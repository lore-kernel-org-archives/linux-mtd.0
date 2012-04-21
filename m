Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLbEG-00068q-GH
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2012 14:24:01 +0000
Received: by lagy4 with SMTP id y4so9194801lag.36
 for <linux-mtd@lists.infradead.org>; Sat, 21 Apr 2012 07:23:58 -0700 (PDT)
Message-ID: <1335018085.28267.2.camel@brekeke>
Subject: Re: [PATCH] mtd : print out the page size and oob size after
 parsing out the nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Sat, 21 Apr 2012 17:21:25 +0300
In-Reply-To: <4F84E5F6.7050805@freescale.com>
References: <1333942897-7392-1-git-send-email-b32955@freescale.com>
 <4F840B56.403@freebox.fr> <4F84E5F6.7050805@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Florian Fainelli <ffainelli@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-04-11 at 10:01 +0800, Huang Shijie wrote:
> Hi,
> > Relying on the kernel to print something to assert the correctness of 
> > the NAND detection is really weak, you'd better query these properties 
> > in userland. Also, I am afraid everyone adds a new NAND property 
> > print-out.
> thanks.
> 
> If no one like this patch, just ignore it.

Yeah, relying on printks is not reliable, but printing the basic
geometry information very useful, I think.

-- 
Best Regards,
Artem Bityutskiy
