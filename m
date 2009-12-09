Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIJIU-0005WZ-VM
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 09:57:32 +0000
Subject: Re: UBIFS on Atmel Dataflash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
In-Reply-To: <4B1F7427.10002@stud.tu-ilmenau.de>
References: <hfnn6u$ah1$1@ger.gmane.org>
	<1260348786.19669.1231.camel@localhost>
	<4B1F7427.10002@stud.tu-ilmenau.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 11:57:18 +0200
Message-Id: <1260352638.19669.1251.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-09 at 10:55 +0100, Andre Puschmann wrote:
> Hi Artem,
> 
> thanks for your prompt reply.
> 
> Artem Bityutskiy wrote:
> > Yeah, I had a feeling we should not have assumed power of 2. But it was
> > so appealing, because we can avoid (slow) divisions when aligning data
> > to min. I/O unit boundary. I knew about DataFlash, but it is usually so
> > small that I did not expect anyone using UBIFS there.
> >
> > Are you sure you want ubifs on such a tiny flash? We were really
> > targeting to larger ones, say, starting from 64MiB at least.
> >   
> Mmh, the idea to run UBIFS came up due to a problem with JFFS2 on this
> device. So I wanted to use another writeable flash fs to  find out
> whether its a fs-problem or a mtd/dataflash one.
> 
> So you suggest to stick with JFFS2 in this case?

Yes, UBI/UBIFS flash overhead is higher, and it is not very appropriate
for small flashes because of this.

JFFS2 is better for small flashes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
