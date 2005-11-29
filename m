Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh7j5-0004b3-W0
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 15:49:04 +0000
Date: Tue, 29 Nov 2005 16:48:50 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-ID: <20051129154849.GB1904@wohnheim.fh-wedel.de>
References: <20051129180659.6f872e14.vwool@ru.mvista.com>
	<20051129153542.GA1904@wohnheim.fh-wedel.de>
	<438C763C.9060206@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <438C763C.9060206@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD ioctl interface rework to get rid of
	MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 November 2005 18:39:40 +0300, Vitaly Wool wrote:
> 
> However, I think we should return error for MEMSETOOBSEL/MEMGETOOBSEL 
> for userland apps to learn they can't change oobinfo any more.

No objections from my side.

Jörn

-- 
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein
