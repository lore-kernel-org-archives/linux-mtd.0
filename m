Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZrQ8-0006V5-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:13:36 +0100
Date: Wed, 31 Jul 2002 12:34:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_eraseblock() - errors
Message-ID: <20020731103419.GA23749@wohnheim.fh-wedel.de>
References: <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14572.1028067711@redhat.com>
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

On Tue, 30 July 2002 23:21:51 +0100, David Woodhouse wrote:
> It's actually possible to avoid the cosmetic annoyance by marking the node 
> as obsolete, so we don't check the CRC and hence don't bitch about it 
> failing. Older versions of JFFS2 did that, as does the current version in 
> 2.4.19-rc3. But it's harmless and expected behaviour.

How exactly is this done? On the next mount after the failed write? By
toggling bits in the status word of the node header?

If so, this will not work with any of the shiny STMicro chips with
hardware ECC, so I would have to tackle that one too, once we merge.

Jörn

-- 
Jörn Engel
mailto: joern@wohnheim.fh-wedel.de
http://wohnheim.fh-wedel.de/~joern
Phone: +49 179 6704074
