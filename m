From: David Woodhouse <dwmw2@infradead.org>
To: Artem Bityuckiy <dedekind@infradead.org>
In-Reply-To: <E1CdAeF-0007RX-Fq@phoenix.infradead.org>
References: <E1CdAeF-0007RX-Fq@phoenix.infradead.org>
Content-Type: text/plain
Date: Sat, 11 Dec 2004 18:05:49 +0000
Message-Id: <1102788349.7231.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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

On Sat, 2004-12-11 at 17:03 +0000, Artem Bityuckiy wrote:
> Remove headers frome here. Instead join them and use one <linux/jffs3.h>
> header.

No. Keep it in the fs/jffs3 directory not in include/linux/

-- 
dwmw2
