Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NW8bU-0007kj-8f
	for linux-mtd@lists.infradead.org; Sat, 16 Jan 2010 13:22:16 +0000
Received: by ewy21 with SMTP id 21so2590303ewy.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Jan 2010 05:22:10 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com, dwmw2@infradead.org
Subject: Re: ubiattach fails with "bad image sequence number"
References: <4B2FF7CF.7040401@theptrgroup.com>
	<1263081089.7315.119.camel@localhost.localdomain>
	<1263081191.7315.121.camel@localhost.localdomain>
	<4B4D3D61.2020305@theptrgroup.com> <1263575708.2969.1.camel@localhost>
Date: Sat, 16 Jan 2010 14:22:00 +0100
In-Reply-To: <1263575708.2969.1.camel@localhost> (Artem Bityutskiy's message
	of "Fri, 15 Jan 2010 19:15:08 +0200")
Message-ID: <874ommp4lj.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Jeff Angielski <jeff@theptrgroup.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

Hi,

 >> > P.S. when we fix this, we'll have to tag a new mtd-utils version, since
 >> > this is a very bad bug.
 >> 
 >> This patch worked for me.

 Artem> Ok, pushed them.

David, could we have a 1.3.1 tarball on
ftp://ftp.infradead.org/pub/mtd-utils/ as well?

Thanks.

-- 
Bye, Peter Korsgaard
