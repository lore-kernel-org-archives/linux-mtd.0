Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iXZ7-00032A-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 09:18:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203060847.g268lKv09419@localhost.localdomain> 
References: <200203060847.g268lKv09419@localhost.localdomain> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fwd: jffs2 & new linux zlib 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Mar 2002 09:29:36 +0000
Message-ID: <23140.1015406976@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

cdavies@altera.com said:
> What, no comments at all? Shall I just check this in then? - it works
> for me.

Sorry, I missed this one, possibly due to it mentioning 2.5, or the 
combination of https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=53659
and iso8859-15 mails. Neither of which are your fault.

The code against which your patch was made never existed in my CVS tree. It 
was fundamentally broken, as you observed. Whoever did the zlib changes in 
2.5 evidently didn't verify that _either_ jffs2 or ppp_deflate were still 
working. Both are now fixed in Linus' tree, and I've also back-ported the 
(fixed) shared zlib code to 2.4, so that I can import the changes into CVS 
without breaking the 2.4 build. Now, we allocate the workspaces once at 
init time, rather than doing it each time we need to compress/decompress 
something.

2.4 zlib backport patch at ftp.kernel.org:/pub/linux/kernel/people/dwmw2
or in BK tree at http://linux-mtd.bkbits.net:8080/zlib-2.4 (note jffs2-2.4 
tree sitting beside it).

That tree differs from the jffs2-2_4-branch only in the zlib changes, which 
will make their way onto the jffs2-2_4-branch when the zlib changes get 
into 2.4.x.

> I'm not sure that this is the best approach., maybe it would be better
> to try and reduce the size of the deflate_workspace & inflate
> workspace in zlib? (This might be a ridiculous idea, I haven't a clue
> how zlib works) Any suggestions?

The inflate workspace is OK - that's only about 40KiB. If we could reduce 
the deflate workspace from its current 400-odd, that would be useful.

--
dwmw2
