From: Russ.Dill@asu.edu (Russ Dill)
Date: Thu, 13 Mar 2003 00:26:46 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047539833.23182.20.camel@imladris.demon.co.uk>
References: <20030312102735.U1745@brecis.com>
 <002701c2e8ba$8690e8c0$1200a8c0@JOHNB> <20030312154316.X1745@brecis.com>
 <1047539833.23182.20.camel@imladris.demon.co.uk>
Message-ID: <1047540371.1673.1.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2003-03-13 at 00:17, David Woodhouse wrote:
> On Wed, 2003-03-12 at 21:43, Steve Wahl wrote:
> 
> > Note that cfiflash below does not handle interleave nor bit
> > endianness, so you can't adopt it directly.
> 
> And under what licence is it available?

here is some GPL code written by someone who's never looked at the AMD
code (until the previous email)

http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/blob/blob/src/blob/amd32.c?rev=1.6&content-type=text/vnd.viewcvs-markup

its a little complex because it handles two chips in an interleaved
configuration.
