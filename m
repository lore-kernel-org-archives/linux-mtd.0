Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNwnK-00031Q-5c
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 08:49:27 +0000
Date: Wed, 30 May 2018 10:49:07 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v7 5/5] mtd: cfi_cmdset_0002: Change erase one block to
 enable XIP once
Message-ID: <20180530104907.7b37cd05@bbrezillon>
In-Reply-To: <TY1PR01MB095408736BF00FE88D19AC13DC6D0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180527232801.1666-1-ikegami@allied-telesis.co.jp>
 <20180527232801.1666-6-ikegami@allied-telesis.co.jp>
 <20180529205751.44b2ba92@bbrezillon>
 <TY1PR01MB095408736BF00FE88D19AC13DC6D0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
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

Hello,

On Tue, 29 May 2018 23:31:41 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> Hi Boris-san,
> 
> Thanks for your reviewing and advices.
> 
> > Is this really a bug fix? Doesn't look like a bug fix to me.  
> 
>   No as you mentioned it is not a bug fix but just a refactoring to reduce xip_enable() line.

Then you should drop the Cc: stable tag.

> 
> > Also, every time you add Cc stable you should try to find the commit
> > that introduced the bug. Sometime it's not possible because the bug
> > existed before git was in use, but most of the time you'll find the
> > offending commit using git blame.
> > 
> > A fixes tag should be formatted like that:
> > 
> > Fixes: <commit-id> ("commit subject")  
> 
>   Okay I will do that in future.
> 
>   This is just FYI.
>   I have just confirmed that the xip_enable() line itself was implemented by the commit 02b15e343aeef.
>   For this patch it is not a bug fix so I will not add the Fixes line into the commit message.

Right.

>   But if needed it please let me know that.

I checked the first patch and it seems it's one of these situation
where the code predates git, so no need to specify a Fixes tag.

Thanks,

Boris
