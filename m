Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195SWz-0001Mk-02
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 16:39:33 +0100
Date: Tue, 15 Apr 2003 17:39:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Esben Nielsen <esn@cotas.dk>
Message-ID: <20030415153934.GD7721@wohnheim.fh-wedel.de>
References: <200304151051.34585.h.schurig@mn-logistik.de>
	<200304151706.36445.esn@cotas.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200304151706.36445.esn@cotas.dk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 April 2003 17:06:36 +0200, Esben Nielsen wrote:
> 
> Yes, but are those writes syncronices with actual flash writes such I am sure 
> that a write is _physically_ complete when fsync() returns? 
> They certainly ought to be or many applications would get in trouble with 
> corrupt data at a sudden reboot.
> 
> Let us assume it is so. Then I need to tweak sqlite to only force an fsync() 
> when the JFFS2 layer is ready to commit anyway to avoid too many writes.
> Any idea of how to do that?

On NOR, there is absolutely no point in avoiding many writes. Write
the same amount of data in fewer bigger chunks and you have the same
problems.

If you can reduce the amount of data written to flash, do that.

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
