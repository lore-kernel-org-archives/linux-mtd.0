From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4176493A.5080003@yandex.ru>
References: <4176449B.4090706@yandex.ru>
	<1098270013.3872.83.camel@baythorne.infradead.org>
	<4176493A.5080003@yandex.ru>
Content-Type: text/plain
Message-Id: <1098271310.3872.87.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Wed, 20 Oct 2004 12:21:50 +0100
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

On Wed, 2004-10-20 at 15:17 +0400, Artem B. Bityuckiy wrote:
> > By writing nodes which don't cover a full 4KiB and hence aren't
> > pristine.
> Thanks.
> 
> By the way, what do you (and other JFFS2 folks) think about very big 
> nodes of size = block size? I'm going to create such a big inode 
> checkpoints. Is it OK? Are there some reasons not to do so and split 
> them into several smaller nodes?

Other than the fact that it doesn't pack well, not really. If they're
that large are they _really_ an effective use of space? 

-- 
dwmw2
