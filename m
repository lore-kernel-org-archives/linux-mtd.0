From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@oktetlabs.ru
In-Reply-To: <416122A1.4060302@oktetlabs.ru>
References: <416122A1.4060302@oktetlabs.ru>
Content-Type: text/plain
Message-Id: <1096885344.30942.559.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 11:22:25 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 14:14 +0400, Artem Bityuckiy wrote:
> Wha do JFFS2 folks think about the idea?

It seems to make a lot of sense. We could write such checkpoints only on
files which are large enough to warrant them, and we could tune the
frequency of such checkpoints. 

Of course as with many cute ideas it may turn out to be utterly
impractical when we implement it :) It does look sane though.

-- 
dwmw2
