From: David Woodhouse <dwmw2@infradead.org>
To: Pete Popov <pete_popov@yahoo.com>
In-Reply-To: <20040302054544.49317.qmail@web80207.mail.yahoo.com>
References: <20040302054544.49317.qmail@web80207.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1078217654.17069.59.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 02 Mar 2004 08:54:15 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: CONFIG_FS_JFFS2_NAND bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-01 at 21:45 -0800, Pete Popov wrote:
> It looks like in the cvs tree, the fs/Kconfig sets
> CONFIG_JFFS2_FS_NAND, if the option is selected.
> However, there are a couple of harmless references in
> the fs/jffs2 code to CONFIG_FS_JFFS2_NAND. 

Fixed, thanks.

-- 
dwmw2
