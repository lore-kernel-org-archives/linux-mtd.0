Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E39bi-0002uv-JG
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 05:44:19 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1E39aq-0004YQ-TE
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 11:43:20 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2005 11:43:20 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2005 11:43:20 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Thu, 11 Aug 2005 11:42:20 +0200
Message-ID: <ddf6hr$pfn$1@sea.gmane.org>
References: <42FAFEC9.1090306@mail.ru>	<1123745980.16052.48.camel@sauron.oktetlabs.ru>	<42FB0734.7050304@mail.ru>
	<1123748971.16052.65.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
In-Reply-To: <1123748971.16052.65.camel@sauron.oktetlabs.ru>
Sender: news <news@sea.gmane.org>
Subject: Re: jffs2 and nand mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex,

>>We don't know how to find real date of snapshot but
>>we follow stages for 2.4 kernels mentioned in 
>>http://www.linux-mtd.infradead.org/source.html#kernelversions
>>
>>/...
>>cd mtd/
>>/cvs update -dP -D 2005-03-04
>>
>>And then apply some patch which we found at list archive to make  
>>*getlink* works for JFFS2.
> Well, there is a note that this snapshot doesn't have to work:
--- 8< 8< 8< ---
> I'll glance at this. But in general me (and most MTD folks I know) are
> *not* interested in digging old MTD/JFFS2.

> The best would be if you would adopt the *latest* MTD snapshot to your
> kernel. Martin Egholm Nielsen <martin@egholm-nielsen.dk> recently ported
> the latest MTD snapshot to a 2.4 kernel. You may ask him for a
> patch/help.
I'll help - I don't think I can create a patch that'll work directly, so 
let's see if we can get CVS HEAD up and running - step by step...

1 )Start by fetching the source from CVS 
(http://www.linux-mtd.infradead.org/source.html)

2) Patch it in - enter the patches directory and run the patchin.sh 
script...

3) Configure the kernel for JFFS2

( 3½) If "non-standard" board, change the "proper" (vague - I know) mtd 
Makefile to include the flash-driver for your system...)

4) Try making a new kernel - this will certainly fail, since many of the 
macro's checking (and fixing) for kernel less than 2.6 has been removed...

To fix the many errors in 4), you can actually compare the complaining 
files from HEAD with the ones from 2005-03-04. Many, if not all, the 
required macro's are there.
Otherwise, I can try to see if I can create a patch/diff output stating 
the differences.
Or, finally, you can post the errors here, or privately (not so noisy, 
but others may benefit - even if 2.4 is abandoned :-)), and we can 
fix'em together...

BR,
  Martin
