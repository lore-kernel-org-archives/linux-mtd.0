Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MA26K-0005Ft-QI
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 13:26:31 +0000
Subject: Re: UBIFS: "sync" mount option does not work
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?Aur=E9lien_G=C9R=D4ME?= <ag@debian.org>
In-Reply-To: <20090529132059.GA11054@roxor.cx>
References: <20090528170621.GJ18372@roxor.cx>
	<1243591249.11172.106.camel@localhost.localdomain>
	<1243591427.11172.108.camel@localhost.localdomain>
	<20090529132059.GA11054@roxor.cx>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 May 2009 16:26:16 +0300
Message-Id: <1243603576.11172.111.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Adrian.Hunter@nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-29 at 15:20 +0200, Aurélien GÉRÔME wrote:
> Hi Artem,
> 
> On Fri, May 29, 2009 at 01:03:47PM +0300, Artem Bityutskiy wrote:
> > Please, use this patch as a band-aid so far. Not sure it'll
> > land upstream in this form.
> 
> Sure, thanks a lot!
> It works fine and it is now integrated to the kernel of my custom
> board.

Glad it helped. Please, watch the UBIFS back-port trees for
fixes fixes. We find and fix bugs still.

Also note, there is a known UBIFS&NOR flash issue related to
power cuts. Watch the "UBIFS Corrupt during power failure".
Hopefully Eric will come with more data and we could fix that.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
