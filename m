Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu0q7-0001WD-GL
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 08:51:34 +0000
Subject: Re: ubifs error when do bonnie++ test
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jason Liu <liu.h.jason@gmail.com>
In-Reply-To: <1239785405.3390.173.camel@localhost.localdomain>
References: <e8775dd00904012244o30200226p4e748d89d2a9b9c7@mail.gmail.com>
	<49D47252.3020701@nokia.com>
	<e8775dd00904020249k6dd1146chfae6e74c11a01f82@mail.gmail.com>
	<1239366421.3390.12.camel@localhost.localdomain>
	<e8775dd00904122350h23a9983axd507c88f283150f@mail.gmail.com>
	<1239689874.3390.88.camel@localhost.localdomain>
	<e8775dd00904150144w54bb1c31j1c50648190ede7f2@mail.gmail.com>
	<1239785405.3390.173.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2009 11:51:10 +0300
Message-Id: <1239785470.3390.174.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-15 at 11:50 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-04-15 at 16:44 +0800, Jason Liu wrote:
> > We use 2 MLC nand flash to simulate this virtual device. Each NAND
> > chip is 4K page size with 218 OOB size.
> > We can parallel program each NAND chip in order to improve the write
> > performance.
> 
> I see. Then you want to teach your setup understand sub-pages.
> In your case the sub-page will be 2K. 

Sorry, s/2K/4K/

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
