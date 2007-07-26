Received: from web57911.mail.re3.yahoo.com ([68.142.236.104])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IE1nA-0003dt-TM
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 07:46:06 -0400
Date: Thu, 26 Jul 2007 04:39:23 -0700 (PDT)
From: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <46A80A01.6010108@ak.jp.nec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <79400.65645.qm@web57911.mail.re3.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

KaiGai Kohei <kaigai@ak.jp.nec.com> wrote:

> > Maybe it causes timing differences just by it being compiled in?
> 
> Is it means there are differences of kernels between flash case and
> NFS one? We can confirm it using binary hash such as md5sum

No, it's the same kernel. See the cat /proc/version output in the
previous logs.

> In the tail of jffs2-dbg-flashboot.log.gz, it shows you can execute
> 'df' and
> 'ls' command, although 'ls' reported EIO.

Actually, it was the OS trying to fetch 'ls' from the filesystem that
returned EIO. 'ls' doesn't run at all. Using the following:-

cd /bin
./<TAB><TAB>

to have the shell's auto-completion list the directory contents, 'ls'
is missing. When trying to manually create the link to busybox, it
claims 'ls' already exists. So I create it in /usr/bin instead and then
'ls' works as expected.

> However, success of 'df' means it can open and read /etc/mtab, at
> least.
> Is it installed in /dev/mtdblock2 ?

It is symlinked to /proc/mounts

> Is it possible to send the following logs?
> - "ls /" after "dmesg -n 8"
>  It seems to me that some warnning or notice messages from kernel are
> filtered
>  due to log message level configuration.

I'll need to set the debug level early at boot since the EIO errors
come from the system failing to load 'ls' not the 'ls' executable
itself.

Paul



       
____________________________________________________________________________________
Be a better Heartthrob. Get better relationship answers from someone who knows. Yahoo! Answers - Check it out. 
http://answers.yahoo.com/dir/?link=list&sid=396545433
