Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9ROn-0007bz-3n
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 16:47:49 +0100
Message-ID: <3F8C1A60.5070401@imc-berlin.de>
Date: Tue, 14 Oct 2003 17:46:40 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Magnus_M=E5rtensson?= <magnus.martensson@axis.com>
References: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: word line disturbance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Magnus Mårtensson wrote:

> Hi.
> I had a discussion with flash manufacturer Atmel last week regarding a phenomenon that we had seen. 
> The phenomenon was called "word line disturbance" and it could occur if you tried to program only ones
> to a location that already contained ones. The result could be that some bit on another address got tainted. Ex
> writing 0xffff to address A could result in the content on address B changing from 0xffff to 0xfffe.
> ...

Which types of flash memory are effected by this interessting "feature"?

Steven
