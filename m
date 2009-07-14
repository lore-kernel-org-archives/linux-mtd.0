Received: from mail-yx0-f195.google.com ([209.85.210.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQj8K-0005QJ-93
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:37:36 +0000
Received: by yxe33 with SMTP id 33so5020072yxe.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jul 2009 07:37:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090714143229.GG7572@pengutronix.de>
References: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
	<20090714135621.GF7572@pengutronix.de>
	<8bd0f97a0907140714t3326e26am99c65ea5fcc62647@mail.gmail.com>
	<20090714143229.GG7572@pengutronix.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 14 Jul 2009 10:37:07 -0400
Message-ID: <8bd0f97a0907140737p7b74779vb0f87771e9b460b4@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] cfi_cmdset_0001.c: put chip into read-array
	mode after unlocking
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Graf Yang <graf.yang@analog.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 14, 2009 at 10:32, Wolfram Sang wrote:
>> the CFI layers already go through steps to keep the memory in read
>> mode by default.
>
> Ah, okay. With this assumption, the patch makes sense. Still, the patch
> description should refer more to the above statement and not to watchdogs IMHO.

ok

>> the only way the watchdog could reconfigure the
>> flash is if it were setup to execute software instead of kick the
>> hardware, and that makes the system significantly less reliable.
>
> I meant fixing the watchdog in hardware: If the watchdog pulls the right
> #RESET, the flash will be in read-mode by default. If not, this is an important
> hardware issue.

you're assuming the hardware has this functionality in the first
place.  while it is still an issue that should be addressed in
hardware, it's not possible for board designers to do so ;).
-mike
