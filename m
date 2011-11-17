Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RR9bc-0007WZ-HV
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 21:34:49 +0000
Received: by bkat2 with SMTP id t2so3397057bka.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 13:34:46 -0800 (PST)
Subject: Re: [UBI] Unable to attach UBI volume
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Skuczynski <mareksk7@gmail.com>
Date: Thu, 17 Nov 2011 23:34:43 +0200
In-Reply-To: <CAN2PfcaTWNW=G6qFvxgRMtNTyeBwBypay8hakvPGSc5_-nSoug@mail.gmail.com>
References: <CAN2PfcaTWNW=G6qFvxgRMtNTyeBwBypay8hakvPGSc5_-nSoug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321565684.2272.10.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-08 at 10:59 +0100, Marek Skuczynski wrote:
> Hi,
>    After overnight test using fsstress and forced system reboot I have
> a problem to attach an UBI volume.
>    Probably the root cause of such problem has been already resolved,
> so I would appreciate if you can point
>    the fixes out.  My Linux kernel version is 2.6.31.14
If it was fixed - you should find the fix in one of the back-port trees.

Did you enable errors emulation in UBI debugging options? If yes - that
is the reason. If no - looks like the pool of reserved eraseblocks for
bad block handling is exhausted an you do not have enough good
eraseblocks.

Please, send more information about your setup - is it MLC NAND? Take a
look here:
http://linux-mtd.infradead.org/faq/ubifs.html#L_how_debug
http://linux-mtd.infradead.org/faq/ubi.html#L_how_send_bugreport

Did you validate your flash with MTD tests?

Artem.
