Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D11F0-0001Kn-AD
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 06:51:44 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <4211DFBC.2080901@imc-berlin.de>
References: <1107439704.32168.66.camel@fuzzie.sanpeople.com>
	<4211DFBC.2080901@imc-berlin.de>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 14:51:07 +0300
Message-Id: <1108468267.26412.28.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2_FS_WRITEBUFFER config option
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-15 at 12:40 +0100, Steven Scholz wrote:
> Hi,
> 
> > As per discussions on IRC, this patch replaces the current
> > CONFIG_JFFS2_FS_NAND, CONFIG_JFFS2_FS_NOR_ECC and
> > CONFIG_JFFS2_FS_DATAFLASH with a single configuration option - 
> > CONFIG_JFFS2_FS_WRITEBUFFER.
> 
> IIUC than I dont need to enable this option for plain old NOR flash. Right?

Hi, Right
