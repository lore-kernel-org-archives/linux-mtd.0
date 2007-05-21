Subject: Re: jffs2 : duplicate node
From: David Woodhouse <dwmw2@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4651A1E2.60206@parrot.com>
References: <4651A1E2.60206@parrot.com>
Content-Type: text/plain
Date: Mon, 21 May 2007 11:53:06 -0400
Message-Id: <1179762786.2771.18.camel@shinybook.infradead.org>
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

On Mon, 2007-05-21 at 15:42 +0200, Matthieu CASTET wrote:
> 
> With jffs2 from 2.6.20 with summary enabled, I manage to get duplicate 
> inode node : there have the same (same header, crc, ...) [1]
> 
> Is that normal ?

Yes. See how we garbage collect nodes marked REF_PRISTINE.

-- 
dwmw2
