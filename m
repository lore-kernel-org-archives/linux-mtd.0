Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBFfu-000872-Rz
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 17:13:14 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])i37FP1j9012532
	for <linux-mtd@lists.infradead.org>; Wed, 7 Apr 2004 17:25:02 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id SAA17598
	for <linux-mtd@lists.infradead.org>;
	Wed, 7 Apr 2004 18:13:09 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <4074287A.8070501@imc-berlin.de>
Date: Wed, 07 Apr 2004 18:12:42 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
CC: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
References: <D73A25AA6E54D511AD74009027B1110F5BB16A@ORION>
In-Reply-To: <D73A25AA6E54D511AD74009027B1110F5BB16A@ORION>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Blakeslee wrote:
> I just debugged something like this ealier.  There are timeout values that
> need to be increased for slow access.

But still the system should not crash like this in case of an timeout
(maybe cause by an old flash), don't you think?

I guess somethings wrong with the waitqueue chip->wq ...

> 		} else {
>...
> 			chip->state = FL_READY;
> 			wake_up(&chip->wq);
> 			cfi_spin_unlock(chip->mutex);
> 			DISABLE_VPP(map);
 > ...

Steven Scholz
