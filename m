Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Cdyu-0005pl-00
	for <linux-mtd@lists.infradead.org>; Sat, 08 Dec 2001 09:41:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <D9223EB959A5D511A98F00508B68C20C1F9639@ORSMSX108> 
References: <D9223EB959A5D511A98F00508B68C20C1F9639@ORSMSX108> 
To: "Carlson, Kristen" <kristen.carlson@intel.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: caching questions with jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 08 Dec 2001 09:51:48 +0000
Message-ID: <19171.1007805108@redhat.com>
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

kristen.carlson@intel.com said:
> Can someone describe to me the algorithm used for freeing memory that
> has been cached due to file activity in jffs2?  Is this done as part
> of the garbage collector?  How long does the cached memory stay
> around?  Is this tunable?

At all times while mounted, JFFS2 keeps a list of the offsets of each 
physical node belonging to each inode.

On read_inode(), it reads each physical node and builds up a full map of 
where data are found for each range of bytes in the file. 

On read(), it just reads data into the page cache. Normal Linux cache 
eviction rules apply to data pages.

On clear_inode(), the extra stuff allocated in read_inode() is freed.

The paper linked from http://sources.redhat.com/jffs2/ may help to shed 
light on this.

--
dwmw2
