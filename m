Received: from mail-wm0-f67.google.com ([74.125.82.67])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBbt2-0000w9-Bf
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 06:59:45 +0000
Received: by mail-wm0-f67.google.com with SMTP id v4so16203744wmb.2
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 23:59:23 -0700 (PDT)
Subject: Re: [PATCH 21/30] men-chameleon-bus.txt: standardize document format
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <cover.1495156975.git.mchehab@s-opensource.com>
 <8efb749ce7beb2b22c298fb5c9d7d80044076b05.1495156975.git.mchehab@s-opensource.com>
From: Johannes Thumshirn <jth@kernel.org>
Message-ID: <8ba33ec0-ab26-de60-af88-cb1ab97cbbca@kernel.org>
Date: Fri, 19 May 2017 08:59:16 +0200
MIME-Version: 1.0
In-Reply-To: <8efb749ce7beb2b22c298fb5c9d7d80044076b05.1495156975.git.mchehab@s-opensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/19/2017 03:24 AM, Mauro Carvalho Chehab wrote:
> Each text file under Documentation follows a different
> format. Some doesn't even have titles!
>
> Change its representation to follow the adopted standard,
> using ReST markups for it to be parseable by Sphinx:
>
> - Adjust identations;
> - Remove title numbering;
> - mark literal blocks;
> - comment its TOC.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
Looks good,
Acked-by: Johannes Thumshirn <jthumshirn@suse.de>
