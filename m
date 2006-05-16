Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fg0Vw-0006g5-4N
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 10:27:12 -0400
Date: Tue, 16 May 2006 16:26:18 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: syed khader <sk.syed@yahoo.com>
Message-ID: <20060516142618.GB11656@wohnheim.fh-wedel.de>
References: <20060516061354.GA18958@wohnheim.fh-wedel.de>
	<20060516124046.35261.qmail@web37910.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060516124046.35261.qmail@web37910.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CRC errors when continuous fseek/fputs on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2006 05:40:46 -0700, syed khader wrote:
> 
>   when I removed fseek/fwrite in the test case I am
> not seeing any CRC errors. The modified code goes like
> this :
> 
> int main()
> {
>    int fd;
>    int i;
>    char buf[SIZE];
> 
>    strcpy(buf, "abcdefg\r\n");
>    printf("%s", buf);
>    fd = open("testfile",O_RDWR|O_CREAT);
>    for(i =0 ; i < 10 ; i++)
>    {
>       write(fd, buf, sizeof(buf));
>       lseek(fd, -4, SEEK_CUR);
>   }
> }
>    Why does CRC errors occur when I use fseek/fwrite
> and not when I use plain system calls write/lseek??

Because it doesn't do the same thing.  But what did the fseek/fwrite
version do?

Can you run the old testcase with strace?  Something like

$ strace -v 1>1 2>2 your_testcase

Then send us the contents of 2.

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
