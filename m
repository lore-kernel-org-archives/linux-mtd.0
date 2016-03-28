Received: from wtarreau.pck.nerim.net ([62.212.114.60] helo=1wt.eu)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akSNP-0005LP-UQ
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 08:18:21 +0000
Date: Mon, 28 Mar 2016 10:17:55 +0200
From: Willy Tarreau <w@1wt.eu>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Benson Young <benson6877@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>
Subject: Re: ubiblock RW
Message-ID: <20160328081755.GA17870@1wt.eu>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
 <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
 <1458906697.615.20.camel@gmail.com>
 <20160325205011.GA1106@laptop.cereza> <56F5ACBD.8070201@nod.at>
 <20160326060137.GA9296@1wt.eu> <56F85851.5020508@nod.at>
 <1459148213.19765.14.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459148213.19765.14.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 28, 2016 at 09:56:53AM +0300, Artem Bityutskiy wrote:
> You can add a per-volume R/O flag if needed, yes. Expose it to user-
> space. This may be a useful thing irrespectively. I am not sure how it
> helps with ubiblock though.
> 
> Ideally, the ubiblock R/W enabled flag should be stored in ubiblock,
> not in UBI, not in MTD, because you want ubiblock to have full control
> over it. You do not want a user go and change the flag via the UBI
> interface whenever the user feels like, right?
> 
> To have this kind of flag in ubiblock, it needs an on-flash superblock
> or something. If you are not going to introduce it, which I believe is
> the case, then the only option left in my opinion is a ubiblock module
> parameter.
> 
> If I am a ubiblock user who needs the write support, and this naive
> write support is good enough for me, I want it enabled by default on my
> product. A module parameter with a sound name like 'dangerous-write-
> support' or something would work fine for me.

Thanks Artem for the explanation. I think it all makes sense indeed.

Willy
