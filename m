Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SzQb-0007LU-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 11:49:26 +0000
Date: Tue, 22 Jan 2002 13:00:21 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Adam Wozniak <adam.wozniak@comdev.cc>, linux-mtd@lists.infradead.org
Subject: Re: optimum geometry
Message-ID: <20020122130021.A12669@wohnheim.fh-wedel.de>
References: <20020122112104.C27725@wohnheim.fh-wedel.de> <3C487D9A.D85DDC3D@comdev.cc> <3C48504B.68F8FE7F@comdev.cc> <20020118010528.A22777@swing.comdev.cc> <28158.1011372920@redhat.com> <3C487D9A.D85DDC3D@comdev.cc> <4896.1011653373@redhat.com> <20020122112104.C27725@wohnheim.fh-wedel.de> <2181.1011695016@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2181.1011695016@redhat.com>; from dwmw2@infradead.org on Tue, Jan 22, 2002 at 10:23:36AM +0000
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> Yes, you're right. The overhead per-block is 12 bytes, but probably more
> important than that is the fact that more nodes have to be split up between
> blocks rather than being written out in one go - meaning an extra 70-odd 
> byte header, and worse compression.

I did a quick test and had 292 saved Bytes per eraseblock. Compared to
your numbers, 2/3 of the savings are due to better compression, so the
numbers can only be a rough measure.
With f being the filesystem size and e being the erase block size, the
optimum should be roughly: e = sqrt(60*f)

Reasoning:
Going from e to e/2, you waste 300*f/e Bytes.
Going up from e to 2*e, you waste 5*e Bytes.
Minimum is reached, when both effects are equal, thus:
5*e = 300*f/e
e^2 = 60f
e = sqrt(60f)

But again, this depends on compression, so take it with a grain of
salt.

Jörn

-- 
If you treat your beta-testers as if they're your most valuable
resource, they will respond by becoming your most valuable resource.
-- Eric Raymond in "The cathedral and the bazaar"
