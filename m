Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dG1dR-0004h2-TR
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 11:17:55 +0000
Date: Wed, 31 May 2017 13:17:22 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH 12/29] rtc.txt: standardize document format
Message-ID: <20170531111722.oq3ce5cpzkbmcm3i@piout.net>
References: <cover.1495157082.git.mchehab@s-opensource.com>
 <de62f8091ae4e7d2af980e6cd79071348622cdc8.1495157082.git.mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de62f8091ae4e7d2af980e6cd79071348622cdc8.1495157082.git.mchehab@s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/05/2017 at 22:25:56 -0300, Mauro Carvalho Chehab wrote:
> Each text file under Documentation follows a different
> format. Some doesn't even have titles!
> 
> Change its representation to follow the adopted standard,
> using ReST markups for it to be parseable by Sphinx:
> 
> - adjust identation of the titles;
> - mark a table as such;
> - don't capitalize chapter names.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
>  Documentation/rtc.txt | 44 +++++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
