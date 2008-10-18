Received: from bubetka.logix.cz ([208.84.148.239] helo=maxipes.logix.cz)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrIUE-0006eW-40
	for linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 20:33:22 +0000
Message-ID: <48FA486E.5030503@logix.net.nz>
Date: Sun, 19 Oct 2008 09:34:54 +1300
From: Michal Ludvig <mludvig@logix.net.nz>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: nandwrite/ubi memory corruption?
References: <48F71315.5080707@logix.net.nz>
	<1224168560.4466.2.camel@sauron>	<1224168977.4466.4.camel@sauron>
	<48F7BBC1.8090804@logix.net.nz>	<1224241375.4466.11.camel@sauron>
	<1224245398.4466.26.camel@sauron>
In-Reply-To: <1224245398.4466.26.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Fri, 2008-10-17 at 14:02 +0300, Artem Bityutskiy wrote:
>> On Fri, 2008-10-17 at 11:10 +1300, Michal Ludvig wrote:
>>> Nothing was apparently broken after ubiformat, system kept running
>>> smoothly. But I can't use ubiformat for writing kernel image, can I?
>> No, but I do not think it would be very difficult to add this
>> functionality.
> 
> Wait. Sorry, your kernel sit in different partition and that partition
> is not UBI. [...] Just debug nandwrite and fix it.

Just that? Easy ;-)
I'll have a look at it but as I don't know much about the whole flash /
mtd interface it may be a bit of challenge.

Michal
