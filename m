From: David Woodhouse <dwmw2@infradead.org>
To: superlidu@vip.sina.com
In-Reply-To: <20060524034656.74939.qmail@vip3-160.sinamail.sina.com.cn>
References: <20060524034656.74939.qmail@vip3-160.sinamail.sina.com.cn>
Content-Type: text/plain
Date: Wed, 24 May 2006 08:33:42 +0100
Message-Id: <1148456022.12285.215.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: fdisk problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-24 at 11:46 +0800, superlidu@vip.sina.com wrote:
> fdisk /dev/sbulla 

What provides /dev/sbulla? Why are you trying to use ext2fs on NAND
flash instead of a flash file system?

-- 
dwmw2
