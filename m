Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlYDl-0004Jv-D9
	for linux-mtd@lists.infradead.org; Sat, 27 Oct 2007 00:04:08 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: getdents64 problem in 2.6.23
Date: Sat, 27 Oct 2007 01:03:37 +0200
Message-ID: <023b01c81824$71647f40$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1193426035.16168.41.camel@shinybook.infradead.org>
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org] 
> Sent: den 26 oktober 2007 21:14
> To: joakim.tjernlund@transmode.se
> Cc: Linux-MTD Mailing List
> Subject: Re: getdents64 problem in 2.6.23
> 
> On Wed, 2007-10-24 at 15:47 +0200, Joakim Tjernlund wrote:
> > started to use 2.6.23 in our development system a few days ago and
> > now I got problems when deleting files from a large directory
> > structure. A rm -rf does not delete all files.
> > 
> > Did a strace and found that some files does not appear in the
> > strace, the same ones that doesn't get deleted.
> 
> Following up on the IRC conversation... the problem here is the horrid
> readdir() interface, and how it interacts with f_pos on the 
> directory's
> file descriptor. The file position simply represents the offset within
> the linked list of dirents -- which used to be fairly safe, 
> because when
> we unlinked something, we'd write out a 'deletion dirent', which would
> serve as a placeholder in the list.
> 
> Someone changed that code recently though, and those deletion dirents
> are no longer written on NOR flash.... :)

Yeah, I wonder who that was. Can't really recall :)

> 
> The answer is probably to keep a 'deletion dirent' in the 
> f->dents list
> of jffs2_full_dirents, but with NULL for the 'raw' field. I think that
> shouldn't break any other part of the code. Then you'd want to remove
> those dummy dirents when the filedescriptor for the directory in
> question is closed.

Is this what you mean(just a stupid hack for now)?
          //*prev = this->next;
            jffs2_mark_node_obsolete(c, (this->raw));
            this->raw = NULL;
          //jffs2_free_full_dirent(this);

Perhaps add a jffs2_add_fd_to_list(c, this, &dir_f->dents)?

How do I find where the filedescriptor is closed?

 Jocke
