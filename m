Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FllQj-0004dr-IW
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 07:33:39 -0400
Date: Thu, 1 Jun 2006 13:33:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
Message-ID: <20060601113319.GA5662@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<20060530185017.GG26220@wohnheim.fh-wedel.de>
	<1149062982.32620.67.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605310947550.16927@localhost.localdomain>
	<1149086997.32620.101.camel@sauron.oktetlabs.ru>
	<Pine.LNX.4.64.0605311105170.16927@localhost.localdomain>
	<447DC80E.6040604@yandex.ru>
	<Pine.LNX.4.64.0605311314060.16927@localhost.localdomain>
	<447EAD4E.2010709@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <447EAD4E.2010709@yandex.ru>
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 June 2006 13:03:10 +0400, Artem B. Bityutskiy wrote:
> 
> I bet you understand what I meant. I meant, that you may implement this 
> "layer" a way it'll have no overhead comparing to the way Joern offers. 
> May be layer is not the very appropriate word here. It's not like 
> network layers. I just wanted to put my idea in a bit different angle.

I don't understand how that layer would not introduce overhead.  But
maybe you have some explanation in diff -up format.  That would
certainly make things easier to understand.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
