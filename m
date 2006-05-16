Received: from web37910.mail.mud.yahoo.com ([209.191.124.105])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfyxU-0004eO-TY
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 08:47:38 -0400
Message-ID: <20060516124046.35261.qmail@web37910.mail.mud.yahoo.com>
Date: Tue, 16 May 2006 05:40:46 -0700 (PDT)
From: syed khader <sk.syed@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20060516061354.GA18958@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: CRC errors when continuous fseek/fputs on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi 
  when I removed fseek/fwrite in the test case I am
not seeing any CRC errors. The modified code goes like
this :

int main()
{
   int fd;
   int i;
   char buf[SIZE];

   strcpy(buf, "abcdefg\r\n");
   printf("%s", buf);
   fd = open("testfile",O_RDWR|O_CREAT);
   for(i =0 ; i < 10 ; i++)
   {
      write(fd, buf, sizeof(buf));
      lseek(fd, -4, SEEK_CUR);
  }
}
   Why does CRC errors occur when I use fseek/fwrite
and not when I use plain system calls write/lseek??

Regards
Syed



--- J�rn Engel <joern@wohnheim.fh-wedel.de> wrote:

> On Mon, 15 May 2006 21:58:47 -0700, syed khader
> wrote:
> > 
> >   My question is not how the test case  should be
> > written, why would CRC errors appear when I never
> > powered off my system while it is writing into
> jffs2.
> >   I would like to ask what would happen if a
> integer
> > overflow occurs: does it result in crc error?
> 
> Anything resulting in a crc error is a bug.  But I
> cannot tell you
> much more with your current testcase.  fwrite() is
> implemented by the
> libc and does buffering.  Therefore it is impossible
> to tell when libc
> actually calls the kernel and which functions it
> calls with which
> parameters.  And that makes debugging fairly hard.
> 
> So a temporary question is indeed how the testcase
> should be written.
> Please replace the f* functions so we can remove
> libc from the
> picture.
> 
> J�rn
> 
> -- 
> Invincibility is in oneself, vulnerability is in the
> opponent.
> -- Sun Tzu
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
