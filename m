From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4176449B.4090706@yandex.ru>
References: <4176449B.4090706@yandex.ru>
Content-Type: text/plain
Message-Id: <1098270013.3872.83.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 12:00:13 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 4K block size question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-20 at 14:57 +0400, Artem B. Bityuckiy wrote:
> Hello,
> 
> In case of 2MiB NAND flash (with 256-byte page) the sector size is 4KiB. 
> The JFFS2 virtual block size is also 4KiB.
> 
> The size of pristine node is 4KiB data + node header. So, in 
> uncompressed form, the pristine node can't fit into JFFS2 block if the 
> compression is disabled. So, how does JFFS2 work on such flash :-) ?

By writing nodes which don't cover a full 4KiB and hence aren't
pristine.

-- 
dwmw2
