Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgQZT-00011R-Dt
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 11:39:45 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <41C6F923.20609@inf.u-szeged.hu>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C19118.1020407@inf.u-szeged.hu>
	<1103558464.10788.44.camel@squizzey.bult.co.uk>
	<41C6F923.20609@inf.u-szeged.hu>
Content-Type: multipart/alternative; boundary="=-CuyNBbcYnX/fJHyEYdcm"
Date: Mon, 20 Dec 2004 16:39:48 +0000
Message-Id: <1103560788.10797.47.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CuyNBbcYnX/fJHyEYdcm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Yup,

I've cvs'd the latest source and patched ... kernel seems to build Ok ..
Just trying a full build from clean to make sure, then I'll give it a
go ..

Is there an example of how to use sumtool anywhere ?

If I eraseall the flash then mount JFFS2 and copy files on, do I need to
use sumtool ?

Gareth.

On Mon, 2004-12-20 at 17:09 +0100, Ferenc Havasi wrote:

> Hi Gareth,
> 
> > I'm afraid this patch seems to be quite a long way from applying cleanly
> > to my source. I'm using 2.6.9 .. at least half a dozen failures or
> > more ...
> 
> It works with JFFS2 in the latest MTD CVS.
> 
> JFFS3 will contains this feature soon.
> 
> Regards,
> Ferenc

--=-CuyNBbcYnX/fJHyEYdcm
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.2.3">
</HEAD>
<BODY>
Yup,<BR>
<BR>
I've cvs'd the latest source and patched ... kernel seems to build Ok ..<BR>
Just trying a full build from clean to make sure, then I'll give it a go ..<BR>
<BR>
Is there an example of how to use sumtool anywhere ?<BR>
<BR>
If I eraseall the flash then mount JFFS2 and copy files on, do I need to use sumtool ?<BR>
<BR>
Gareth.<BR>
<BR>
On Mon, 2004-12-20 at 17:09 +0100, Ferenc Havasi wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#000000">Hi Gareth,</FONT>

<FONT COLOR="#000000">&gt; I'm afraid this patch seems to be quite a long way from applying cleanly</FONT>
<FONT COLOR="#000000">&gt; to my source. I'm using 2.6.9 .. at least half a dozen failures or</FONT>
<FONT COLOR="#000000">&gt; more ...</FONT>

<FONT COLOR="#000000">It works with JFFS2 in the latest MTD CVS.</FONT>

<FONT COLOR="#000000">JFFS3 will contains this feature soon.</FONT>

<FONT COLOR="#000000">Regards,</FONT>
<FONT COLOR="#000000">Ferenc</FONT>
</PRE>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-CuyNBbcYnX/fJHyEYdcm--
