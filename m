Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fMxlN-0007xW-7P
 for linux-mtd@lists.infradead.org; Sun, 27 May 2018 15:39:18 +0000
Date: Sun, 27 May 2018 17:39:05 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: Re: [PATCH v6 0/5] mtd: cfi_cmdset_0002: Change write and erase
 functions
Message-ID: <20180527173905.6e9df536@bbrezillon>
In-Reply-To: <TY1PR01MB0954DBEFF399886473C1242FDC690@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180515171120.5629-1-smtpuser@allied-telesis.co.jp>
 <f74834424cb3f1f86e8803884b53be5f62d15c94.camel@infinera.com>
 <TY1PR01MB0954DBEFF399886473C1242FDC690@TY1PR01MB0954.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 May 2018 03:03:28 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> Hi Boris-san,
> 
> Could you please apply the patches if no problem?

Actually I never received your v6, and I can't find it in linux-mtd
either. Interestingly, it's in patchwork, so maybe a problem on my side.

> Or still should we wait if any other comment?

Not really, maybe add the Cc:stable tag if you think this is needed.

> Let me confirm these things since we are waiting to apply them for our product problem as resolution.
> 
> By the way I think that the commit message of patches can be changed to Jocke-san as "Reviewed-by" from "Cc" as below.
>   - Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>   + Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> 
> Since actually the changes have been reviewed by him as the mail below.

Normally you should wait for an official "Reviewed-by" tag. I just
asked Joakim.

> Also our company mail system has been changed so now I can send the patches with my email address as sender instead of the smtpuser address.

That's appreciated.

> If needed I will resend patches or send them as new version patches again to change the commit message and send address.

Yes please, send a new version.

Thanks,

Boris
