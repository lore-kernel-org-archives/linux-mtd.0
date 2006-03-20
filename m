Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLKBA-0004Rp-5v
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 08:12:20 -0500
Date: Mon, 20 Mar 2006 14:11:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Todd Poynor <tpoynor@mvista.com>
Message-ID: <20060320131151.GB31001@wohnheim.fh-wedel.de>
References: <20060317151241.GG28927@wohnheim.fh-wedel.de>
	<441AEAE0.1080609@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <441AEAE0.1080609@mvista.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] move mtd_fake_writev where it belongs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 March 2006 08:59:12 -0800, Todd Poynor wrote:
> Jörn Engel wrote:
> >Patch applies to current -linus.  Should I send it to akpm?
> 
> But now it is no longer "fake" but in fact "default", no?

Or "generic", yeah.  I was lazy.  Do you care enough to send an
updated patch?

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
