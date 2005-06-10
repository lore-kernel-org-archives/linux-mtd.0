Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dgeep-0005Fz-Kx
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 04:14:34 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <42A9496D.9020806@yandex.ru>
References: <BAY2-F11432519227105B42F84CDDAFF0@phx.gbl>
	<42A9496D.9020806@yandex.ru>
Content-Type: text/plain
Date: Fri, 10 Jun 2005 16:14:21 +0800
Message-Id: <1118391261.11408.110.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tong changda <tongcd@hotmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-06-10 at 12:03 +0400, Artem B. Bityuckiy wrote:
> tong changda wrote:
> > hello
> >     I am new to jffs2, Now we apply it on linux phone with Intel Xscale 
> > and arm-linux 2.4.20, Very rarely , We can't access one or more file on 
> > jffs2, ls the file shows:
> 
> Hello,
> 
> Many fixes were made since the time of 2.4.20. So, use newer MTD.
> 
I am also working on jffs2 and have been advised to update mtd. but I am
afraid that keeping the kernel same and updating the mtd may result in
some incomapatibility.

Any comments?
> 
-- 
Munira Ahmed
