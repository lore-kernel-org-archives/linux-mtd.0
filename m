From: David Woodhouse <dwmw2@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20041118163528.GA9471@synertronixx3>
References: <20041118163528.GA9471@synertronixx3>
Content-Type: text/plain
Date: Sat, 20 Nov 2004 13:57:14 +0000
Message-Id: <1100959034.8600.33.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 Oops on 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-18 at 17:35 +0100, Konstantin Kletschke wrote:
> Well I tried out the jffs2 which is in 2.6.10-rc2 vanilla and
> experienced the same:

Is this with an SMP or preemptable kernel? If so, I think I see the
problem. Does it also fix it if you wrap the code you disabled with 
	spin_lock(&c->erase_completion_lock);
	<...>
	spin_unlock(&c->erase_completion_lock);
?

-- 
dwmw2
