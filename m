Subject: Re: (sorted, thanks David) Re: The NFS mounting jffs2 filesystem
	with errors
From: David Woodhouse <dwmw2@infradead.org>
To: zheng xin <zhx821223@hotmail.com>
In-Reply-To: <BAY129-F1855E44FF857C578CBC023AD790@phx.gbl>
References: <BAY129-F1855E44FF857C578CBC023AD790@phx.gbl>
Content-Type: text/plain
Date: Fri, 09 Mar 2007 00:00:36 +0000
Message-Id: <1173398436.3461.533.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 23:50 +0000, zheng xin wrote:
> Thanks a lot David. I applied the two patches you gave and my NFS mounting 
> is currently working properly now. 

Bear in mind that the get_parent() bit is entirely untested. If you're
going to use it in anger, you should test it by unmounting and
remounting the JFFS2 file system (to force the inode cache to be
cleared) while it's mounted by a remote machine, then accessing
subdirectories, etc. Maybe put some printk into get_parent() to make
sure you see when it's being called and check it's returning the right
thing.

You'll need to unexport the filesystem before you unmount it, of course,
and re-export it after you remount it. But you mustn't unmount or
remount on the NFS client -- the whole point is that it stays mounted on
the _client_ while the server loses its cache.

-- 
dwmw2
