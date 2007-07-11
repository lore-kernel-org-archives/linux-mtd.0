Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8iXl-0005Y4-Pr
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 16:12:15 -0400
Date: Wed, 11 Jul 2007 22:08:46 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Chuck Meade <chuckmeade@mindspring.com>
Subject: Re: jffs2 eraseblock size, and actual flash device eraseblock size
Message-ID: <20070711200846.GA837@lazybastard.org>
References: <4689F10B.9040401@mindspring.com> <469527A3.7030203@mindspring.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <469527A3.7030203@mindspring.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 July 2007 14:55:31 -0400, Chuck Meade wrote:
> 
> Any ideas at all on this?  I am looking for input on the following:
> 1. If it is a workable solution to have the same jffs2 image being used
>    on devices of two different erase block sizes.

Unlikely.

> 2. If so, which is the preferrable method, to generate the jffs2 image
>    specifying the smaller or the larger of the two erase block sizes,
>    and why?

If you choose the larger size you will have data loss.  The smaller size
may or may not work.  I leave the required analysis to you.  I'd bet
small coins against you, large notes if you have summary enabled on your
image.

Jörn

-- 
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein
