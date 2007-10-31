Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1InLl0-0006L0-Dr
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 18:09:57 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1InLkt-00057Q-SX
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 22:09:44 +0000
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2007 22:09:43 +0000
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2007 22:09:43 +0000
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Subject: Re: UBI Used In Commercial Products ??
Date: Wed, 31 Oct 2007 22:09:38 +0000 (UTC)
Message-ID: <loom.20071031T215155-403@post.gmane.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

> Does anyone on this list know if UBI is currently being used in any
> commercially released products ??
> If so, does anyone know which ones ??

I am probably missing something here, but how can UBI be useful by itself?
I would think until UBIFS is ready there is not much one can do with it.
Please tell me I am wrong ;-)

I am not aware of any non-commercial solution that can be used on a system
that:
1. Has lots (gigabytes) of flash
2. Must be power-fail safe.
3. Must boot in seconds even after power cycle
4. Does not have internal battery or super-capacitor to allow for sync on
power failure.

I hope UBI+UBIFS will be able to do that but it is not ready yet. Another
possibility is logfs but it is not ready either.

Sorry if that is a bit off-topic.

Regards,

Sergei Sharonov
