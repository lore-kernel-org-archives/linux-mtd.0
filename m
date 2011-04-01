Received: from afflict.kos.to ([92.243.29.197])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5YPp-0002Hi-8e
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 07:05:06 +0000
Date: Fri, 1 Apr 2011 10:05:02 +0300
From: Riku Voipio <riku.voipio@iki.fi>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Is the mtd-utils common
Message-ID: <20110401070502.GA26112@afflict.kos.to>
References: <1300886551.12466.7.camel@ll-desktop>
	<1301582790.2828.103.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1301582790.2828.103.camel@localhost>
Cc: ll <vic7tor@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 31, 2011 at 05:46:30PM +0300, Artem Bityutskiy wrote:
> On Wed, 2011-03-23 at 21:22 +0800, ll wrote:
> > Today I upgrade my ubuntu from 10.04 to 10.10. After the upgrade, when I
> > use mkfs.ubifs and ubinize to create image. It make error when I mount
> > the /dev/ubi0_0. The error message below. Does the ubuntu upgrade change
> > the version of mkfs.ubifs? The linux kernel version is 2.6.37. Could
> > anyone help me? 
 
> But this has been fixed. I think Ubuntu picked broken mtd-utils. Contact
> Ubuntu guys and ask them to pick newer mtd-utils. CCed Riku, he's a
> debian guy, may be he can advice something.

I'm quite sorry of this mess - I didn't watch closely enough and apparently
that version was picked up from debian by ubuntu automatically. I'm not an
ubuntu developer so I cannot change the version there. You will need to file
a bug in ubuntu bug tracker and find some ubuntu developer to change the version.

Alternatively you can try building mtd-utils yourself or upgrading yo ubuntu natty
beta, which has newer version already.

Riku
