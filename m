Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzHaw-00039p-2u
 for linux-mtd@lists.infradead.org; Tue, 03 Oct 2017 07:26:24 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Kees Trommel <ctrommel@aimvalley.nl>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs robustness with early power cut warning
Date: Tue, 03 Oct 2017 09:26:29 +0200
Message-ID: <1964048.Gvr1Jm0yVx@blindfold>
In-Reply-To: <7b89bbfe-8503-a50a-0271-09d69a99eeec@aimvalley.nl>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <CAFLxGvwwjFwn1hyme=jgkUQsBJcyK0gXqSNdoXa9WbCB0U4NBQ@mail.gmail.com>
 <7b89bbfe-8503-a50a-0271-09d69a99eeec@aimvalley.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 3. Oktober 2017, 08:53:13 CEST schrieb Kees Trommel:
> Richard,
> 
> > Out of curiosity, did you also try to freeze or schedule the calling task?
> 
> No I did not. When the GPIO gets active the board will die (power off) so no
> need to freeze/block the calling task because it soon will die too. 

I just wondered whether the calling task does not do something stupid after 
being flooded with -EPERM upon every filesystem access.
Think of a larger software stack that communicates over a bus with other 
systems.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
