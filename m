Received: from fw.osdl.org ([65.172.181.6] helo=mail.osdl.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUM9X-0005KP-Dh
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 04:31:04 -0500
Date: Wed, 17 Nov 2004 01:30:42 -0800
From: Andrew Morton <akpm@osdl.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-Id: <20041117013042.6bc0579d.akpm@osdl.org>
In-Reply-To: <1100683325.9201.45.camel@localhost.localdomain>
References: <20041117085555.GA22829@synertronixx3>
	<Pine.LNX.4.58.0411170906040.5169@phoenix.infradead.org>
	<20041117092127.GB2201@synertronixx3>
	<1100683325.9201.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc1-mm5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote:
>
>  On Wed, 2004-11-17 at 10:21 +0100, Konstantin Kletschke wrote:
>  > Am 2004-11-17 09:07 +0000 schrieb Artem B. Bityuckiy:
>  > 
>  > > I don't know what version of MTD is in you kernel, I would advice you to 
>  > > try the lastest MTD snapshot first.
>  > 
>  > Me neither, simply the stuff which is in 2.6.10-rc1-mm5.
>  > Well I think Andrew Morton does not patch mtd stuff in there...
> 
>  I believe he does when I've got stuff in bk://linux-mtd.bkbits.net/mtd-2.6 
>  for him to put there. Which means there'll probably be MTD stuff in his
>  next offering, since Linus only took the 'strictly bugfixes only' tree
>  out of the two I offered him last night.

yup, I currently have a 99k mtd patch.  -mm kernels always contain whatever
was in those 32 bk trees a few hours before -mm release.
