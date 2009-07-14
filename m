Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQimT-0003cP-Cb
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 14:15:02 +0000
Received: by gxk19 with SMTP id 19so5094900gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jul 2009 07:14:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090714135621.GF7572@pengutronix.de>
References: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
	<20090714135621.GF7572@pengutronix.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 14 Jul 2009 10:14:31 -0400
Message-ID: <8bd0f97a0907140714t3326e26am99c65ea5fcc62647@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] cfi_cmdset_0001.c: put chip into read-array
	mode after unlocking
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Graf Yang <graf.yang@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 14, 2009 at 09:56, Wolfram Sang wrote:
>> We should try and keep the flash in the default read-array mode when
>> possible so that we are much more likely to properly recover from
>> unexpected reboot events (such as watchdog expiring). =C2=A0If we only u=
nlock
>
> Hmm, the right thing to do would be fixing the watchdog to reset the flas=
h
> correctly, no? As your patch makes non-working watchdogs less obvious, I =
fear
> that lockups will then happen when it's too late (=3D devices are deploye=
d).

the CFI layers already go through steps to keep the memory in read
mode by default.  the only way the watchdog could reconfigure the
flash is if it were setup to execute software instead of kick the
hardware, and that makes the system significantly less reliable.
-mike
