From: David Woodhouse <dwmw2@infradead.org>
To: syed khader <sk.syed@yahoo.com>
In-Reply-To: <20060517134838.73136.qmail@web37913.mail.mud.yahoo.com>
References: <20060517134838.73136.qmail@web37913.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Wed, 17 May 2006 15:28:33 +0100
Message-Id: <1147876113.3875.10.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?Q?J=EF=BF=BDrn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: zlib compression is failing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-17 at 06:48 -0700, syed khader wrote:
>   yeah that is an option. but till the time we move to
> 2.6 we should support 2.4 and have to resolve this
> problem.
>   Probably looking into the changes would help.
> Thanks
> syed 

Please stop top-posting. Read http://david.woodhou.se/email.html
and please also trim your quotations appropriately.

You seem to have a hybrid of old, relatively stable code (2.4) with
newer, 'exciting' JFFS2 -- but not even the _current_ JFFS2 code; older
code in which we _know_ we've fixed bugs since then. That isn't really
something we can support you with.

If you want the stability of 2.4, then _use_ 2.4, and deal with the fact
that its JFFS2 is slow.

If you want the improvements which are in 2.6, then just switch to it
and don't attempt to mix and match.

Mixing the 2.4 kernel with a JFFS2 snapshot from CVS is entirely
unsupportable and basically gets you the worst of both worlds.

-- 
dwmw2
