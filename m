Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E38Rv-0001Ti-RP
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 04:30:15 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Alex Karev <lineum@mail.ru>
In-Reply-To: <42FB0734.7050304@mail.ru>
References: <42FAFEC9.1090306@mail.ru>
	<1123745980.16052.48.camel@sauron.oktetlabs.ru>
	<42FB0734.7050304@mail.ru>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 12:29:30 +0400
Message-Id: <1123748971.16052.65.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 and nand mtd
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 12:07 +0400, Alex Karev wrote:
> We don't know how to find real date of snapshot but
> we follow stages for 2.4 kernels mentioned in 
> http://www.linux-mtd.infradead.org/source.html#kernelversions
> 
> /...
> cd mtd/
> /cvs update -dP -D 2005-03-04
> 
> And then apply some patch which we found at list archive to make  
> *getlink* works for JFFS2.
> 
Well, there is a note that this snapshot doesn't have to work:

"NOTE: That is just a snapshot. It isn't a release version or a branch;
it's known to be broken in ways which will corrupt data, and we don't
care. The bugs got fixed later but the patches will never be backported.
The date quoted just happens to be the date at which the unstable
development tree was last observed to compile for the ancient 2.4
kernel. You should not use it, and you should not expect it to work."

Gaps in files sound very odd - I didn't ever observe this. If you're
able to:

1. enable JFFS3 debugging level 1
2. copy as few as possible files to your flash which is enough just to
reproduce the problem.
3. mount / umount
4. gather *all* the JFFS2 output, not just the last messages (from
dmesg).


I'll glance at this. But in general me (and most MTD folks I know) are
*not* interested in digging old MTD/JFFS2.

The best would be if you would adopt the *latest* MTD snapshot to your
kernel. Martin Egholm Nielsen <martin@egholm-nielsen.dk> recently ported
the latest MTD snapshot to a 2.4 kernel. You may ask him for a
patch/help.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
