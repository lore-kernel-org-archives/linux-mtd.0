From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4177A468.2030605@yandex.ru>
References: <4176449B.4090706@yandex.ru>
	<1098270013.3872.83.camel@baythorne.infradead.org>
	<4176493A.5080003@yandex.ru>
	<1098271310.3872.87.camel@baythorne.infradead.org>
	<4177A468.2030605@yandex.ru>
Content-Type: text/plain
Message-Id: <1098360517.13633.1238.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 21 Oct 2004 13:08:37 +0100
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

On Thu, 2004-10-21 at 15:58 +0400, Artem B. Bityuckiy wrote:
> Hello,
> 
> In the JFFS2, there is place where both c->erase_completion and 
> c->inocache spinlocks are held. But the c->erase_completion is locked 
> first. This fact does not highlighted in the README.Locking file.
> 
> I propose to metnion it there. (i.e., that if both locks are needed, the 
> c->erase_completion must be locked first).

Well spotted; thanks.

-- 
dwmw2
