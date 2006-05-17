Received: from web37904.mail.mud.yahoo.com ([209.191.124.99])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgEQk-00026o-Mt
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 01:18:45 -0400
Message-ID: <20060517051201.33135.qmail@web37904.mail.mud.yahoo.com>
Date: Tue, 16 May 2006 22:12:01 -0700 (PDT)
From: syed khader <sk.syed@yahoo.com>
To: "Jörn" Engel <joern@wohnheim.fh-wedel.de>, syed khader <sk.syed@yahoo.com>
In-Reply-To: <20060516153131.GD11656@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Hi 

   I am sending the log file after doing a fresh test.
Here is the link to the log:

http://rapidshare.de/files/20655260/jffs2crclog.txt.html


--- Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:

> On Tue, 16 May 2006 08:01:54 -0700, syed khader
> wrote:
> > 
> > jffs2_read_inode_range: offset 139961, end 143360
> > Reading 139961-139964 from node at 0x0017c9e4 (3)
> > Node read from 0017c9e4: node_crc 57239698,
> calculated
> > CRC 57239698. dsize 4, csize 4, offset 222b9, buf
> > 00c972b9
> > Read 4 bytes to 00c09b60
> > Data CRC 675ef222 != calculated CRC 83b8ee96 for
> node
> > at 0017c9e4
> > node read done
> 
> This is the only mismatch I could find in your log. 
> What I couldn't
> find was the matching write to 0x0017c9e4.  Still
> unable to see the
> actual bug.  Hmm.
> 
> Can you start out with a fresh image, run your
> testcase and get a
> complete log?  I hope that it contains both a crc
> mismatch like this
> and the write of the node before.
> 
> Quite likely the log will be too large for this
> list.  A link to a
> webpage would be sufficient, if that is possible.
> 
> Jörn
> 
> -- 
> I don't understand it. Nobody does.
> -- Richard P. Feynman
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
