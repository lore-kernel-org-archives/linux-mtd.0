Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYW74-0007YQ-5l
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 08:47:37 +0000
Message-ID: <550A8D19.90404@dave.eu>
Date: Thu, 19 Mar 2015 09:47:21 +0100
From: Andrea Marson <andrea.marson@dave.eu>
MIME-Version: 1.0
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Disturb is a block level affect, as long as partition A and B are in different blocks there will be no disturb between them.   Disturbs, does not damage cells; ERASE returns cells to undisturbed levels.
I think there are two options here: MTD partitioning and UBI 
partitioning. AFAIK one should prefer UBI partitioning to preserve 
device-wide wear leveling. Boris, am I right?

> Officially I would say don't use SLC emulation, but technically I know what your doing.   The reason I say no is because we have very precise recipes designed to create very tight distibutions, and although the first pass distributions might look like an SLC, they are really designed with the expectation of the upper page being programmed.  Not a true SLC.
> With MLC lithography of 25 nm and less  the difference between each level (L0, L1, L2 and L3) is just a few 10's of electrons.  The distribution have to be very tight, in order to meet retention requirements.
This is quite interesting, however I'm afraid I have not fully 
understood it. Let me try to rephrase it. Please correct me if I'm wrong.

1) Technically speaking, it is possible to use an MLC memory in SLC 
mode, even if this is not recommended because MLC is not designed for 
this usage.

2) As indicated by Boris, the easiest way to implement this thing is to 
avoid the use of paired pages, according to paired page table provided 
by datasheet.

3) This technique does not transform an MLC NAND to an SLC magically. 
Thus data retention and lifetime are not increased. However all paired 
pages issues disappear. It is not clear if there are further drawbacks 
that reduce flash reliability if used this way.

Thank you,
Andrea
