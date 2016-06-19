Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEfeE-0006Pb-4L
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 16:32:34 +0000
Subject: Re: [PATCH v3 1/8] MTD: xway: add some more documentation
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1466352497-6806-1-git-send-email-hauke@hauke-m.de>
 <1466352497-6806-2-git-send-email-hauke@hauke-m.de>
 <20160619181443.07ea27ba@bbrezillon>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <3e2b991b-05fc-f5be-ac90-f60aa29ac757@hauke-m.de>
Date: Sun, 19 Jun 2016 18:32:09 +0200
MIME-Version: 1.0
In-Reply-To: <20160619181443.07ea27ba@bbrezillon>
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

On 06/19/2016 06:14 PM, Boris Brezillon wrote:
> On Sun, 19 Jun 2016 18:08:10 +0200
> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> 
>> This adds some register documentation which should make it easier to
>> understand how this controller works.
> 
> This commits also adds some new definitions and replace (1 << x) by
> BIT(x).
> Can you update the commit description accordingly?
> 

Ok, I will add it.
