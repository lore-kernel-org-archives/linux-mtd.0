Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqKYt-0004FE-E1
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2012 08:20:04 +0000
In-Reply-To: <4F206D8F.5010206@flatfrog.com>
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
 <4F206D8F.5010206@flatfrog.com>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
To: Orjan Friberg <of@flatfrog.com>
Message-ID: <OF0111198C.16CD12BA-ONC1257991.002D7AD9-C1257991.002DC3EB@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 26 Jan 2012 09:19:52 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> On 01/25/2012 08:53 PM, Orjan Friberg wrote:
> > I've boiled it down to whether CONFIG_PREEMPT (bug happens) or
> > CONFIG_PREEMPT_VOLUNTARY (bug doesn't happen) is selected.
>
> No, I haven't.  The problem disappeared only for
>
>    while :; do dd if=/dev/zero of=file bs=800 count=1; done
>
> That one-liner was boiled down from the following program, which still
> oopses instantly:
>
>    #include <stdio.h>
>    #include <unistd.h>
>    #include <sys/types.h>
>    #include <sys/stat.h>
>    #include <fcntl.h>
>
>    int main()
>    {
>      int fd;
>      struct stat st;
>      char buf[800];
>
>      do {
>        unlink("file2");
>        fd = open("file1", O_RDWR|O_CREAT|O_TRUNC, 0666);
>        stat("file1", &st);
>        lseek(fd, 0, SEEK_SET);
>        write(fd, buf, 800);
>        close(fd);
>        rename("file1", "file2");
>      } while (1);
>
>      return 0;
>    }

Works for me on PowerPC, 2.6.35, NOR flash

 Jocke
