Date: Wed, 16 Feb 2005 07:57:38 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <cuutan$jl7$2@sea.gmane.org>
Message-ID: <Pine.LNX.4.58.0502160756520.30538@phoenix.infradead.org>
References: <004a01c512c2$60b92930$6ffea8c0@banana>
	<1108454688.26412.18.camel@sauron.oktetlabs.ru>
	<cuutan$jl7$2@sea.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in jffs2/scan.c re: incorrect assumption of "all clean"block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 Feb 2005, Martin Egholm Nielsen wrote:

> >>>>I believe there is a bug in fs/jffs2/scan.c that causes it to 
> === 8< 8< 8< ===
> >>>Is your flash NOR or NAND?
> >>The part is NOR flash (Intel 28F320C3).
> So will this bug effect NAND users, as well?
> 
No, it is NOR specific.
We'll commit the fix.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
