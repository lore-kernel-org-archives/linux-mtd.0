From: David Woodhouse <dwmw2@infradead.org>
To: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
In-Reply-To: <20060523094607.5B30C8B3@arbetsmyra.dyndns.org>
References: <20060502214507.C56443DC@arbetsmyra.dyndns.org>
	<20060510122626.GB31935@wohnheim.fh-wedel.de>
	<20060523094607.5B30C8B3@arbetsmyra.dyndns.org>
Content-Type: text/plain
Date: Tue, 23 May 2006 12:05:49 +0100
Message-Id: <1148382349.12285.124.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] for passing JFFS2 options at mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-23 at 11:44 +0200, Ronny L Nilsson wrote:
> 
> Here's an update for my JFFS2 mount option patch. It allow users to 
> control runtime options on a per mounted fs basis.
>         mount -t jffs2 mtd1 /flash -o compressor=none
>         mount -t jffs2 mtd1 /flash -o compressor=priority 

That's not per-fs. That's per-mount. Like whatever it was Artem was
trying to do last week, this _also_ wants to be stored on the medium
rather than provided every time as a mount option.

-- 
dwmw2
