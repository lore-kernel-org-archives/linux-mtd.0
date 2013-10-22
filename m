Received: from moutng.kundenserver.de ([212.227.126.186])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYbju-0002hi-6P
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 13:11:20 +0000
Message-ID: <5266794F.8020504@ammonit.com>
Date: Tue, 22 Oct 2013 15:10:39 +0200
From: =?ISO-8859-15?Q?Steffen_K=FChn?= <sk@ammonit.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: problem with ecc errors and ubifs
References: <52666705.8040000@ammonit.com>
 <alpine.DEB.2.00.1310221356080.28562@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1310221356080.28562@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Ricard,

thanks for your answer.

> The risk would be that eventually the number of errors would grow past
> the ECC capability and subsequently lead to unreadable data. If there
> indeed is a bug in the scrubbing mechanism, I agree it would be better
> to just correct the bits and hope not too many of them flip. But it
> would be better to try and fix the problem with scrubbing...

I agree with you that a fix of the scrubbing mechanism would be better.
Unfortunately, the problem is very hard to reproduce (and debug).

And perhaps it is already solved? My kernel is not the newest. But it is
not possible to change the version because we have some patches (related
to other hardware) which only works with kernel 3.2.

Do you know about some important bug fixes which have something to do
with the "scrubbing" in the last months?

Best
Steffen
