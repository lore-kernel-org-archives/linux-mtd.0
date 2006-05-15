Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FffM1-0003s1-CW
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 11:51:32 -0400
Date: Mon, 15 May 2006 17:46:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: syed khader <khader_s_s@yahoo.com>
Message-ID: <20060515154606.GB10730@wohnheim.fh-wedel.de>
References: <20060515151556.21775.qmail@web37902.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060515151556.21775.qmail@web37902.mail.mud.yahoo.com>
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

On Mon, 15 May 2006 08:15:56 -0700, syed khader wrote:
>
>    I am finding this strange problem.
> I am running the following piece of code :
> 
> int main()
> {
>    FILE *fp;
>    int i;
>    fp = fopen("/var/mnt/testfile","w");
>    for(i =0 ; i < 100000 ; i++)
>    {
>    fputs("xxxx", fp);
>    fseek(fp, -4, SEEK_CUR);
               ^^
>    fputs("xx", fp);
>   }
>    fclose(fp);
> }
> 
>   JFFS2 is mounted on /var/mnt. While the program is
> running I am getting CRC errors like this:
> 
> Data CRC 6c48916e != calculated CRC 11ebde1b for node
> at 000e0a68
>   
>    If  I am not doing fseek above and just add writing
> to file in the loop I dont see any CRC errors.
>    Pleae let me know what is happening here. Is JFFS2
> running out of buffers or something?

fopen(...,"w") will set fpos to 0.  fseek(..., -4, SEEK_CUR) then sets
it _back_.  I would assume that an integer underflow happens next and
fpos is close to 2^31, 2^32, 2^63 or 2^64.  What is certain is that
your testcase is not a valid piece of code.

Can you try to change your testcase in two ways:
o replace fopen/fseek/fwrite etc. with open/seek/write etc.
o seek to something large directly after open
and retest with that?

"something large" should be one of 2^31-1, 2^32-1, 2^63-1 or 2^64-1, I
believe.

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
