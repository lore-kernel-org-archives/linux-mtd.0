Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hEcG-0006gG-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 20:24:36 +0100
Date: Tue, 20 Aug 2002 21:24:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Christopher Hoover <ch@murgatroid.com>
Cc: "'Jamey Hicks'" <jamey.hicks@hp.com>,
        "'David Woodhouse'" <dwmw2@infradead.org>,
        "'Conn Clark'" <clark@esteem.com>,
        "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is writeable?
Message-ID: <20020820192408.GA19731@wohnheim.fh-wedel.de>
References: <3D623224.1090604@hp.com> <000301c24867$6a81ad70$7800000a@derelict>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000301c24867$6a81ad70$7800000a@derelict>
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

On Tue, 20 August 2002 09:34:12 -0700, Christopher Hoover wrote:
> You have a different flavor flash.  My platform uses Intel C3
> StrataFlash parts.  The flash is completely locked after any power
> cycle.   If I don't unlock the jffs2 partition somehow someway, I can't
> write to it.
> 
> I suppose we could add yet another mount option for this
> ("really_and_truly_rw"!).

If this is a problem (feature/whatever) of one flash type, why not
encapsulate it in the low level driver? It would keep the jffs2 code
clean of what could be considered a bugfix.

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
