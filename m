Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZtCb-0006mT-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 14:07:45 +0100
Date: Wed, 31 Jul 2002 15:07:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_eraseblock() - errors
Message-ID: <20020731130742.GA661@wohnheim.fh-wedel.de>
References: <20020731121648.GA18892@wohnheim.fh-wedel.de> <20020731115703.GB28984@wohnheim.fh-wedel.de> <20020731103419.GA23749@wohnheim.fh-wedel.de> <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com> <2881.1028115952@redhat.com> <4164.1028116749@redhat.com> <6102.1028117866@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6102.1028117866@redhat.com>
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

On Wed, 31 July 2002 13:17:46 +0100, David Woodhouse wrote:
> Should be caught by jffs2_can_mark_obsolete() which checks the device type.

True. Ok, never mind.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
