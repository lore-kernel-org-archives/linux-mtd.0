Subject: Re: getdents64 problem in 2.6.23
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1193233660.23075.31.camel@gentoo-jocke.transmode.se>
References: <1193233660.23075.31.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Fri, 26 Oct 2007 15:13:55 -0400
Message-Id: <1193426035.16168.41.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-10-24 at 15:47 +0200, Joakim Tjernlund wrote:
> started to use 2.6.23 in our development system a few days ago and
> now I got problems when deleting files from a large directory
> structure. A rm -rf does not delete all files.
> 
> Did a strace and found that some files does not appear in the
> strace, the same ones that doesn't get deleted.

Following up on the IRC conversation... the problem here is the horrid
readdir() interface, and how it interacts with f_pos on the directory's
file descriptor. The file position simply represents the offset within
the linked list of dirents -- which used to be fairly safe, because when
we unlinked something, we'd write out a 'deletion dirent', which would
serve as a placeholder in the list.

Someone changed that code recently though, and those deletion dirents
are no longer written on NOR flash.... :)

The answer is probably to keep a 'deletion dirent' in the f->dents list
of jffs2_full_dirents, but with NULL for the 'raw' field. I think that
shouldn't break any other part of the code. Then you'd want to remove
those dummy dirents when the filedescriptor for the directory in
question is closed.

-- 
dwmw2
