From: David Woodhouse <dwmw2@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20041117092127.GB2201@synertronixx3>
References: <20041117085555.GA22829@synertronixx3>
	<Pine.LNX.4.58.0411170906040.5169@phoenix.infradead.org>
	<20041117092127.GB2201@synertronixx3>
Content-Type: text/plain
Date: Wed, 17 Nov 2004 09:22:04 +0000
Message-Id: <1100683325.9201.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@osdl.org, linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc1-mm5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-11-17 at 10:21 +0100, Konstantin Kletschke wrote:
> Am 2004-11-17 09:07 +0000 schrieb Artem B. Bityuckiy:
> 
> > I don't know what version of MTD is in you kernel, I would advice you to 
> > try the lastest MTD snapshot first.
> 
> Me neither, simply the stuff which is in 2.6.10-rc1-mm5.
> Well I think Andrew Morton does not patch mtd stuff in there...

I believe he does when I've got stuff in bk://linux-mtd.bkbits.net/mtd-2.6 
for him to put there. Which means there'll probably be MTD stuff in his
next offering, since Linus only took the 'strictly bugfixes only' tree
out of the two I offered him last night.

> I wonder, how to put the files from latest mtd snapshot into this
> kernel, simply copying files over?

Check the MTD code out from CVS and use the 'patchin.sh' script from the
patches/ directory.

-- 
dwmw2
