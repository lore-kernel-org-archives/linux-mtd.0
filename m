From: David Woodhouse <dwmw2@infradead.org>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <3F94FA47.7020805@egholm-nielsen.dk>
References: <3F94FA47.7020805@egholm-nielsen.dk>
Content-Type: text/plain
Message-Id: <1066728627.6744.1529.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 21 Oct 2003 10:30:28 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Mount-failure (jffs2_scan_empty()) mounting SmartMedia with
	jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-21 at 11:20 +0200, Martin Egholm Nielsen wrote:
> And now I'm lost... Any ideas of how to get any further?

Can you read back the contents of the flash after writing, and compare
with the image you attempted to write?

-- 
dwmw2
