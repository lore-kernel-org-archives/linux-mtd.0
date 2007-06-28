Subject: Re: [PATCH] support zlib decompression in flashcp
From: David Woodhouse <dwmw2@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20070521074826.GA31844@cloud.net.au>
References: <20070521074826.GA31844@cloud.net.au>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 20:39:29 +0100
Message-Id: <1183059569.1170.202.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-05-21 at 17:48 +1000, Hamish Moffatt wrote:
> I shouldn't really use <asm/byteorder.h>, but I need __le32_to_cpu
> or an equivalent. Is there a better approach? 

See how mkfs.jffs2 does it.

-- 
dwmw2
