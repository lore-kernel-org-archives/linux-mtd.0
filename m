Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bktAa-0004mw-4q
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 13:27:12 +0000
Subject: Re: [PATCH v2 00/21] UBI: various rework/cleanup/fixes
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <2b3593fb-7402-2718-b83c-33510fb6d1a9@nod.at>
Date: Fri, 16 Sep 2016 15:26:01 +0200
MIME-Version: 1.0
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 05.09.2016 17:04, Boris Brezillon wrote:
> Hi,
> 
> Here is a set of cleanup patches (+one fix in patch 4 for a bug that
> is unlikely to happen).
> 
> Note that I'm not doing that for fun. I'm currently trying to patch UBI
> to support the 'LEB consolidation' concept (which is the solution we're
> heading to for reliable MLC NAND support), and the duplication of
> similar code blocks makes this transition harder to code/review.
> 
> If you want to see the big picture, here is my development branch [1].
> It contains the current state of MLC support in UBI. It's not finished
> yet, but should give a good idea why the cleanup changes are needed. 

Thanks for this cleanup. Beside of some minor things, see other mails,
I like this series a lot and will merge it in 4.9.

Thanks,
//richard
