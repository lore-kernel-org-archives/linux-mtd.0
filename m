Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dqyb2-0003Dd-Vj
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 15:33:16 -0400
Date: Fri, 8 Jul 2005 21:32:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Timofey Kutergin <tkutergin@mail.ru>
Message-ID: <20050708193257.GA30728@wohnheim.fh-wedel.de>
References: <E1DkzLA-000NfS-00.tkutergin-mail-ru@f23.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1DkzLA-000NfS-00.tkutergin-mail-ru@f23.mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: working mphysmap.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 June 2005 11:08:04 +0400, Timofey Kutergin wrote:
> 
> Attached is working mphysmap.c which can be configured via menuconfig (no commandline support). It uses existing Multiple CFI flash devices window.
> In our system it successfully configured two independent flash devices

Thanks!  I'll have a look next week and add your changes to cvs.  Do
you want a copyright line for your changes?

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson 
