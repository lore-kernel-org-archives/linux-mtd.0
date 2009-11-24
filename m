Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCxIv-0006OY-4J
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 15:27:49 +0000
Subject: Re: [PATCH] enable erase-suspend-program for CFI cmdset_0002
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4B0BF9D9.8070408@aimvalley.nl>
References: <200911191101.nAJB1wwH000784@linpc062.aimsys.nl>
	<1259073406.29118.17.camel@localhost> <4B0BF7CE.3040106@aimvalley.nl>
	<1259075746.29118.22.camel@localhost> <4B0BF9D9.8070408@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Nov 2009 17:26:35 +0200
Message-Id: <1259076395.29118.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	Nicolas Pitre <nico@fluxnic.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-24 at 16:20 +0100, Norbert van Bolhuis wrote:
> Artem Bityutskiy wrote:
> 
> > 
> > If you just modify slightly, I can just make Joakim the author, which
> > sounds fair. And put a not that you tweaked it - this is the common
> > practice. Is this ok with you?
> > 
> 
> yes.
> 
> > No need to re-send, I can do these things myself.
> > 
> 
> ok, good.

Pushed the patch to my l2 tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/6c8793f0c4eae1ce45f654a0fb6cf0b94d7061d6

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
