Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PanZd-000454-C6
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 11:00:05 +0000
Date: Thu, 6 Jan 2011 12:00:03 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
Message-ID: <20110106120003.0ba35de9@wker>
In-Reply-To: <AANLkTikmbbECMLNZ-3d=Z32RcFvsiv=eDyAwJ2=n1sHi@mail.gmail.com>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
	<AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
	<1292942724.2286.57.camel@localhost>
	<AANLkTikmbbECMLNZ-3d=Z32RcFvsiv=eDyAwJ2=n1sHi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 30 Dec 2010 11:32:11 +0100
Guillaume LECERF <glecerf@gmail.com> wrote:

> 2010/12/21 Artem Bityutskiy <dedekind1@gmail.com>:
> > Yes, fair question, Anatolij?
> 
> Hi all.
> 
> Anatolij, what about such patches ?
> Note : this is totally untested ;)

NACK. This is wrong. We need to export the real physical write buffer
size of _one_ chip to UBI. Otherwise we will run into the same trouble
and will end up with an unmountable UBIFS partition again.
It doesn't even make sense to test your two patches, it won't work.

Thanks,
Anatolij
