Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EhNwf-00025Q-00
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2005 09:08:09 +0000
Date: Wed, 30 Nov 2005 10:08:10 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Bernhard Priewasser <priewasser@gmail.com>
Message-ID: <20051130090810.GA25101@wohnheim.fh-wedel.de>
References: <438C7B0C.5040001@gmail.com> <438C94BD.8020300@inf.u-szeged.hu>
	<438C98EA.70105@gmail.com>
	<625fc13d0511291107t3495a41byae11ba1832657291@mail.gmail.com>
	<438CA82F.50600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <438CA82F.50600@gmail.com>
Cc: Josh Boyer <jwboyer@gmail.com>,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND write buffering
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 November 2005 20:12:47 +0100, Bernhard Priewasser wrote:
> 
> Hehe... I'd say: rather use the flash unefficiently (sizeof(header) >> 
> sizueof(data)) than loose data!

But remember to do your own math.  Once your flash usage is
inefficient enough, you'll simply burn through the vendor-guaranteed
erase cycles and permanently lose data. ;)

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
