From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <419870D4.4050703@yandex.ru>
References: <419870D4.4050703@yandex.ru>
Content-Type: text/plain
Date: Mon, 15 Nov 2004 09:18:08 +0000
Message-Id: <1100510289.8015.65.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: remove the 'totlen' field from node_ref
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-15 at 12:03 +0300, Artem B. Bityuckiy wrote:
> Hello,
> 
> I see there were efforts to remove the 'totlen' field from the 
> jffs2_raw_node_ref structure. But it is not done yet.
> 
> As I understand, in order to succesfullt done this improvements, all the 
> space in flash must be represented by means of nodes. This means, we 
> should keep padding node references (jffs2_raw_node_ref for paddigs) 
> in-core too.

Correct.

> Why is this work not done yet? Are there some difficulties? May be some 
> problems arise when we pad to the end of NAND page/Flash block but the 
> padding length is not sufficient to write the padding node and we just 
> write some pattern?

No, that's not a problem. We can quite happily keep a raw_node_ref which
describes that, and we can do so at mount time too. Mostly we just need
to fix the mount code to generate obsolete node refs for dirty space
rather than just ignoring it and moving on.

Doing that alone is fairly simple. The main reason I haven't done it yet
is because it would need a _lot_ of testing, probably with a period of
checking against the real __totlen field and complaining if they differ.
I haven't really had enough time to do the amount of testing I'd like
before I release such a change.

-- 
dwmw2
