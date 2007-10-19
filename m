Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iisyi-0003l1-1m
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 15:37:34 +0100
Date: Fri, 19 Oct 2007 16:33:03 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Subject: Re: [RFC] root=/dev/mtdblock@name
Message-ID: <20071019143303.GD26913@lazybastard.org>
References: <c384c5ea0710190455h195aa8eeub0bc775da3377183@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c384c5ea0710190455h195aa8eeub0bc775da3377183@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 October 2007 13:55:08 +0200, Leon Woestenberg wrote:
> 
> we have a small patch for 2.6.19 that allows us to specify a root
> filesystem on MTD using named partitions, i.e. such as RedBoot fis
> partitions.
> 
> root=/dev/mtdblock@name
> 
> Is this something that would be accepted upstream? If so, I'll forward
> the patch to the current MTD GIT tree.

What would that gain us that drivers/mtd/mtdsuper.c does not already
offer?

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
