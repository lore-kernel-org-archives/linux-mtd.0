Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sXYu-0003Q9-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 00:19:36 +0100
Date: Wed, 3 Apr 2002 01:19:30 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: fyaowen <fyaowen@sina.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Re: problem with build jffs2 filesystem
Message-ID: <20020403011930.B13772@wohnheim.fh-wedel.de>
References: <20020331023459.8404.qmail@sina.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020331023459.8404.qmail@sina.com>; from fyaowen@sina.com on Sun, Mar 31, 2002 at 10:34:58AM +0800
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

On Sun, 31 March 2002 10:34:58 +0800, fyaowen wrote:
> ls -l /dev
> brw-r--r--    1 root     root      31,   7 Jan 28 14:16 mtd7
> 
> I have no mtdblocks, only mtd* instead. The major number of mtd7
> is 31. So mtd7 is a block device, isn't it?

It is, although the name is confusing. Usually, mtd7 is a char device
(major 90, minor 14) and mtdblock7 is the name for your mtd7.

Jörn

-- 
When your language is nowhere near Turing-complete, syntactic sugar
can be your friend.
-- Eric Raymond in "The cathedral and the bazaar"
