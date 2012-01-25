Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rq9xq-0007By-9p
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2012 21:01:08 +0000
Message-ID: <4F206D8F.5010206@flatfrog.com>
Date: Wed, 25 Jan 2012 22:01:03 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 oops when writing to two partitions simultaneously
References: <4F1E802D.5010402@flatfrog.com> <4F1EE749.6020801@flatfrog.com>
 <4F1F004C.6040501@flatfrog.com> <4F205DBA.2090103@flatfrog.com>
In-Reply-To: <4F205DBA.2090103@flatfrog.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/25/2012 08:53 PM, Orjan Friberg wrote:
> I've boiled it down to whether CONFIG_PREEMPT (bug happens) or
> CONFIG_PREEMPT_VOLUNTARY (bug doesn't happen) is selected.

No, I haven't.  The problem disappeared only for

   while :; do dd if=/dev/zero of=file bs=800 count=1; done

That one-liner was boiled down from the following program, which still 
oopses instantly:

   #include <stdio.h>
   #include <unistd.h>
   #include <sys/types.h>
   #include <sys/stat.h>
   #include <fcntl.h>

   int main()
   {
     int fd;
     struct stat st;
     char buf[800];

     do {
       unlink("file2");
       fd = open("file1", O_RDWR|O_CREAT|O_TRUNC, 0666);
       stat("file1", &st);
       lseek(fd, 0, SEEK_SET);
       write(fd, buf, 800);
       close(fd);
       rename("file1", "file2");
     } while (1);

     return 0;
   }


(Apologies for spamming.)

-- 
Orjan Friberg
FlatFrog Laboratories AB
