Received: from fmr17.intel.com ([134.134.136.16] helo=orsfmr002.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EkcwG-00047W-NO
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2005 02:45:10 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: Nikhil <nikhils@cdac.in>
In-Reply-To: <twig.1134109865.32513@cdac.in>
References: <twig.1134109865.32513@cdac.in>
Content-Type: text/plain
Date: Fri, 09 Dec 2005 15:39:24 +0800
Message-Id: <1134113964.4740.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd_debug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-12-09 at 12:01 +0530, Nikhil wrote:
> Hi all,
> 
> i just wanted to know if there is any utility to see how the JFFS2
> filesystem is written on the flash. Places where inode structures are
> stored when a new file is created or if a file has been modified where
> actually on the flash this part is written is a new inode created or the
> same inode is re-written to some another location along with the data
> node.
> 
> i tried to view the flash layout using the "mtd-debug read" utility and i
> can view part of the data nodes but i am not able to view what exactly is
> written as the metadata of the file. Is there any way of getting the
> information of the metadata stored on the flash. 
> 
> thanks in advance  
> 

Not sure if jffs2dump can meet your requirement......
It can dump the meta data of each node on the flash.

Thanks,
Forrest
