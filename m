Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t9kZ-0005wP-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 17:06:11 +0100
Date: Thu, 4 Apr 2002 18:05:51 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: John Hall <John.Hall@optionexist.co.uk>
Cc: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>,
        David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] drivers/mtd/nand/Config.in
Message-ID: <20020404180551.A13187@wohnheim.fh-wedel.de>
References: <541025071C7AC24C84E9F82296BB9B950804DF@OPTEX1.optex.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950804DF@OPTEX1.optex.local>; from John.Hall@optionexist.co.uk on Thu, Apr 04, 2002 at 04:44:34PM +0100
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

On Thu, 4 April 2002 16:44:34 +0100, John Hall wrote:
> I found a small typo in the NAND Config.in that prevented the JFFS2 OOB
> option from being displayed. The patch is against the latest cvs.
> 
> -   if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m"]; then
> +   if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ]; then

A real no-brainer. Thanks!
David, any objections against application?

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
