Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsoTy-0001Xx-Ja
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 08:27:07 +0000
Message-ID: <55545C40.8070805@nod.at>
Date: Thu, 14 May 2015 10:26:40 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: readtest: don't clobber error reports
References: <1431466424-32001-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1431466424-32001-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.05.2015 um 23:33 schrieb Brian Norris:
> Commit 2a6a28e7922c ("mtd: Make MTD tests cancelable") accidentally
> clobbered any read failure reports.
> 
> Coverity CID #1296020
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> regression in v4.1-rc1, so I'll probably want to queue this for 4.1

Sounds sane. Thanks for fixing!

Thanks,
//richard
