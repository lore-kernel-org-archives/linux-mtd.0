Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AbNwJ-0001xj-UB
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2003 17:45:56 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: thomaspang@shaw.ca
In-Reply-To: <357032fbc0.2fbc035703@shaw.ca>
References: <357032fbc0.2fbc035703@shaw.ca>
Content-Type: text/plain
Message-Id: <1072805520.21490.682.camel@tubarao>
Mime-Version: 1.0
Date: 30 Dec 2003 10:32:00 -0700
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Unable to access JFFS2 filesystem
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-12-23 at 12:25, thomaspang@shaw.ca wrote:
> I repost this message as I do not get any response.

> Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)

It appears that you are using cfi_cmdset_0002.  Please try David
Vrabel's patches and let me know if things change.

http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html
http://lists.infradead.org/pipermail/linux-mtd/2003-December/009009.html

-- 
Thayne Harbaugh
Linux Networx
