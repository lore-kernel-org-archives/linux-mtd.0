Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0bO0-0000bi-Ne
	for linux-mtd@lists.infradead.org; Wed, 12 Jul 2006 05:53:25 -0400
Date: Wed, 12 Jul 2006 11:52:05 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Han Chang <posaune@hotmail.com>
Subject: Re: File size limitation on JFFS2.
Message-ID: <20060712095205.GC14333@wohnheim.fh-wedel.de>
References: <BAY110-F38A943ADF26D7AEF738A26BC680@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY110-F38A943ADF26D7AEF738A26BC680@phx.gbl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 July 2006 15:32:08 -0700, Han Chang wrote:
> 
> I'm trying to put a file of size 1G on the JFFS2/NAND. I got "Out of Memory" 
> error. Looks like the max size of file I can put on it is 500M, though my 
> NAND has 2G space. This is on Linux. I noticed JFFS2 is using filemap in the 
> Linux mm, where it crashed. Any help?

Just out of curiosity: how much memory does the machine have?

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
