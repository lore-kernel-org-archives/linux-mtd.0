Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIjvy-0001Bc-KA
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 05:33:44 -0400
Message-ID: <4333CBCE.5000406@yandex.ru>
Date: Fri, 23 Sep 2005 13:33:02 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <BAY17-F141EA92F45DB70328CE1C5E8960@phx.gbl>
	<4333CAF3.3070004@inf.u-szeged.hu>
In-Reply-To: <4333CAF3.3070004@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Erase block header(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> I have only one big problem with this patch. I'm strongly against to
> introduce INCOMPAT nodes JFFS2_NODETYPE_DIRENT_EBH and
> JFFS2_NODETYPE_INODE_EBH just to make unusable new JFFS2 images for old
> JFFS2 code on NAND devices, too. Do I understand well: is this the only
> reason?
Haven't we already noted/agreed that JFFS2_NODETYPE_DIRENT_EBH is ugly 
and should go away???


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
