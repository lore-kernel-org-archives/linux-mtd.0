Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIA2Q-00081q-CZ
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 09:45:04 +0000
Date: Mon, 14 May 2018 11:44:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, Joakim
 Tjernlund <Joakim.Tjernlund@infinera.com>, "PACKHAM Chris"
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v5 0/2] mtd: cfi_cmdset_0002: Changes to retry for flash
 erase
Message-ID: <20180514114440.54190a34@bbrezillon>
In-Reply-To: <TY1PR01MB09540ADA613B8D72668B9E64DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <TY1PR01MB09547A5F4FCDAA1FFB601C74DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180514091214.35ec45b8@bbrezillon>
 <TY1PR01MB09540ADA613B8D72668B9E64DC9C0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

On Mon, 14 May 2018 09:32:01 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> Hi Boris-san,
> 
> Thanks for your reviewing.
> 
> > Can you please use git send-email when you send your patch series, so
> > that they are properly threaded.  
> 
>   Yes I have just resend the v5 patch series by using git send-email.
>   But the source address is set as smtpuser <smtpuser@allied-telesis.co.jp>.
>   This is required on our company mail system currently.
>   But please do not reply to the address but reply to my email address below.
>     Tokunori Ikegami <ikegami at allied-telesis.co.jp>

There's still a problem: the patches do not appear as a thread. Can you
paste the git send-email command you use?

> 
>   Note: I am asking to resolve this issue to our IS department currently.
> 
>   I have just resend the patch series so please review the last patch series.
>   Very sorry for resending the patch series many times.

It seems that nothing has changed, so nothing more to review on my
side. And I'm still not entirely convinced by the fix, but if nobody
complains, I'll apply it. BTW, the changelog is really not clear, you
should have something like:

Changes since v4:
- blabla
- blablabla

Changes since v3:
- blabla
- blablabla

Changes since v2:
- blabla
- blablabla

Changes since v1:
- blabla
- blablabla
