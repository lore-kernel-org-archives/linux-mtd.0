Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJICu-0004oZ-2J
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 11:36:01 +0000
Received: by mail-oi0-x242.google.com with SMTP id g14so4001873oib.3
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jun 2017 04:35:39 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170609125603.4ed0a8ff@bbrezillon>
References: <20170609104829.3488073-1-arnd@arndb.de>
 <20170609125603.4ed0a8ff@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Jun 2017 13:35:38 +0200
Message-ID: <CAK8P3a0+dfCXevLZHESVedN7vRCwzUvML0GACyzGL3-U4B6NAQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fsl_ifc: remove unused variable
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Pavel Machek <pavel@ucw.cz>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 9, 2017 at 12:56 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri,  9 Jun 2017 12:47:43 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>
>> This one was accidentally introduced without any references,
>> and it causes a harmless warning:
>>
>> drivers/mtd/nand/fsl_ifc_nand.c: In function 'fsl_ifc_read_page':
>> drivers/mtd/nand/fsl_ifc_nand.c:696:7: error: unused variable 'res' [-Werror=unused-variable]
>>
>> Fixes: 79f40cc12fd3 ("mtd: nand: fsl_ifc: fix handing of bit flips in erased pages")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> If you don't mind, I'll squash the change in the initial commit.

Sure, that's always the best way to do it when the commits are not yet stable.

       Arnd
