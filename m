Date: Sat, 11 Dec 2004 18:21:17 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1102788349.7231.0.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.58.0412111816440.15928@phoenix.infradead.org>
References: <E1CdAeF-0007RX-Fq@phoenix.infradead.org>
	<1102788349.7231.0.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: mtd/fs/jffs3 jffs3.h, 3.1, NONE jffs3_fs_i.h, 3.1, NONE
 jffs3_fs_sb.h, 3.1, NONE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 11 Dec 2004, David Woodhouse wrote:

> On Sat, 2004-12-11 at 17:03 +0000, Artem Bityuckiy wrote:
> > Remove headers frome here. Instead join them and use one <linux/jffs3.h>
> > header.
> 
> No. Keep it in the fs/jffs3 directory not in include/linux/
> 
> -- 
> dwmw2
>
Ok, but just interesting why? 
:-)

You may not commit it to BK. patchin.sh doesn't install it unles it was 
explicitly asked...

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
