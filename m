Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EXGIG-0005nN-0n
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2005 05:56:41 -0500
Message-ID: <43689B3F.2000401@yandex.ru>
Date: Wed, 02 Nov 2005 13:55:59 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY113-F27F5FC3289B97BC33017FBE86F0@phx.gbl>
In-Reply-To: <BAY113-F27F5FC3289B97BC33017FBE86F0@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header support in JFFS2(revision 6)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> Hi,
> 
> This is the 6th version of the patch.
> The only change compared with 5th version is:
> I replace jffs2_cleanmarker_oob() with jffs2_ebh_oob() to
> avoid confusion since cleanmarker is gone.
> 
> The patch is at:
> http://www.infradead.org/~forrest/eraseblock_header_r6.patch
> 
I wonder, did you try this on NOR or mtdram?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
