Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FffSO-00045c-Pd
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 11:58:11 -0400
Date: Mon, 15 May 2006 17:57:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: syed khader <khader_s_s@yahoo.com>
Message-ID: <20060515155759.GC10730@wohnheim.fh-wedel.de>
References: <20060515151556.21775.qmail@web37902.mail.mud.yahoo.com>
	<20060515154606.GB10730@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060515154606.GB10730@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CRC errors when continuous fseek/fputs on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 May 2006 17:46:06 +0200, Jörn Engel wrote:
> 
> fopen(...,"w") will set fpos to 0.  fseek(..., -4, SEEK_CUR) then sets
> it _back_.  I would assume that an integer underflow happens next and
> fpos is close to 2^31, 2^32, 2^63 or 2^64.  What is certain is that
> your testcase is not a valid piece of code.

I am an idiot.  fseek doesn't go negative, as you write first.

> Can you try to change your testcase in two ways:
> o replace fopen/fseek/fwrite etc. with open/seek/write etc.
> o seek to something large directly after open
> and retest with that?

However, I always dislike extra layers when debugging.  So
replacing fopen and friends with open is still a good idea.

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
