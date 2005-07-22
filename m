Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvwcG-0004F9-44
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2005 08:27:36 -0400
Date: Fri, 22 Jul 2005 14:27:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050722122704.GB941@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>
	<20050722115939.GA941@wohnheim.fh-wedel.de>
	<42E0E2C8.7090304@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42E0E2C8.7090304@yandex.ru>
Cc: zhao_fusheng@hotmail.com, tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 July 2005 16:12:56 +0400, Artem B. Bityuckiy wrote:
> Jörn Engel wrote:
> >
> >Sevenfold indentation is not what I call good coding style.  Try to
> >make this stuff simpler.  Use "if (!...) continue" and similar
> >constructs.
> >
> Agree, although it is how JFFS2 is written. Let's not worsen it, but 
> instead, make it tidier. Please, if you don't mind, reformat the whole 
> function, you may split it on shorter sub-functions, etc.

Yep.  You should send two (or more) seperate patches then.  First for
cleanup of existing function, second for actual changes.

> BTW, IMO the Summary patch of Ferenc Havasi is not yet in CVS (even 
> though it greatly helps with mount time) because he didn't bothered 
> making it cute. He just took messy JFFS2 code, and made it even messier. 
> I'd be glad to see Ferenc's patch nice and in CVS.

Same here.

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
