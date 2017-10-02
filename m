Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dz3qH-0000OQ-MV
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 16:45:19 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Doug Crawford <dcraw101@gmail.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs robustness with early power cut warning
Date: Mon, 02 Oct 2017 18:45:27 +0200
Message-ID: <7850553.GNXqutYARo@blindfold>
In-Reply-To: <CAAEsGzKs1kM4TJVKrrsS_GjxQ3kMQa0zwmX2_z3qRpCdS-Xhag@mail.gmail.com>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <CAFLxGvyT_meoP8rRc-gJi-Yk3VoxeJrF4L=gyo93iK9EAR=HFg@mail.gmail.com>
 <CAAEsGzKs1kM4TJVKrrsS_GjxQ3kMQa0zwmX2_z3qRpCdS-Xhag@mail.gmail.com>
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

Am Montag, 2. Oktober 2017, 18:14:28 CEST schrieb Doug Crawford:
> I think my use case might be a little different. This 500 millisecond
> early power down warning is intended to be recoverable if the power is
> restored in that period.  The effect I am looking for is that any new
> fsync or sync commands made during this 500 ms window will pause or
> block, but if the power is restored then the sync will be successful.

Hmm, if I understand your correctly, all you need is freeze/thaw support in 
UBIFS.
Upon power-loss you freeze the filesystem and if power recovers you can thaw 
it.

Does this information help? :-)

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
