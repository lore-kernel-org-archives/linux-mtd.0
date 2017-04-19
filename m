Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0pBD-00056P-OJ
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 12:57:57 +0000
Subject: Re: UBIFS doesn't supper NFS
To: Rock Lee <rockdotlee@gmail.com>, linux-mtd@lists.infradead.org
References: <CAL-1w2t6kw0AW5d3LX2QAcXO7ow9zJ9DBPCAYJieByo0Y9yzqw@mail.gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <77bff837-c458-b901-0e27-e43a56f703fa@nod.at>
Date: Wed, 19 Apr 2017 14:57:33 +0200
MIME-Version: 1.0
In-Reply-To: <CAL-1w2t6kw0AW5d3LX2QAcXO7ow9zJ9DBPCAYJieByo0Y9yzqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.04.2017 um 14:52 schrieb Rock Lee:
> Hi,
> There is no s_export_op in the super block of UBIFS, that means UBIFS
> doesn't support NFS. But I noticed there are some patches try to sovle
> this problem, for example:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-May/047092.html
> 
> But why UBIFS is still not able to support NFS?

Sorry, forgot to answer this questions.
All series before ignored the fact that UBIFS has only 32bit readdir cookies.

Thanks,
//richard
