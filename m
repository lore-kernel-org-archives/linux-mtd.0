Subject: Re: JFFS2 wrong data CRC message
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <46385786.5020804@nokia.com>
References: <46385786.5020804@nokia.com>
Content-Type: text/plain
Date: Wed, 02 May 2007 13:23:24 +0100
Message-Id: <1178108604.2875.182.camel@pmac.infradead.org>
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

On Wed, 2007-05-02 at 12:19 +0300, Adrian Hunter wrote:
> Can someone explain why this message is not an error?
> 
> JFFS2 notice: (17573) read_dnode: wrong data CRC in data node at
> 0x07e85800: read 0x86c6656c, calculated 0xaf4f2bc5. 

Because it's almost certainly harmless. It usually just means that you
rebooted or reset without cleanly unmounting -- and thus without the
writebuffer getting flushed to finish the node it was writing at the
time. So the data CRC fails, and the node is ignored.

-- 
dwmw2
