Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190obF-0006ps-3L
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 21:12:45 +0100
Date: Wed, 2 Apr 2003 22:12:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Siddharth Choudhuri <choudhri@cs.tamu.edu>
Message-ID: <20030402201233.GA17890@wohnheim.fh-wedel.de>
References: <Pine.GSO.4.44.0304021225270.18949-100000@unix.cs.tamu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.44.0304021225270.18949-100000@unix.cs.tamu.edu>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: newbie: struct flchip in flashchip.h...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 April 2003 12:28:47 -0600, Siddharth Choudhuri wrote:
> 
> What are the members of the structure <mtd/flashchip.h>
> struct flchip {
> ...
> 	int word_write_time;
> 	int buffer_write_time;
> 	int erase_time;
> }
> used for ?

I don't know, but you can figure it out yourself. Try
http://lxr.linux.no/

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
