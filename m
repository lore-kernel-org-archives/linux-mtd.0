From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41597C0B.7040607@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
	<41597498.7090704@yandex.ru>
	<1096382241.30942.81.camel@hades.cambridge.redhat.com>
	<41597C0B.7040607@yandex.ru>
Content-Type: text/plain
Message-Id: <1096383873.30942.88.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 16:04:33 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-28 at 18:58 +0400, Artem B. Bityuckiy wrote:
> What would you say if somebody offer you a patch with such optimization 
> ? Would you reject it? Or you would accept it and rename JFFS2 to JFFS3 
> :-) ?

I'd probably reject it unless I was completely convinced it was
necessary, and it was the only way to do it. We're not ready for JFFS3
yet.

How about introducing a new node type which can be ignored by older
JFFS2 implementations? Consider an 'inode checkpoint' node, which tells
you instantly the state of all the nodes with versions smaller than it,
so you don't have to check all those. You only have to read and check
the CRC on the nodes _newer_ than the checkpoint.

Then you can write these whenever you feel like it, to large files. 

> Anyway, the complex solution with partial fragtrees is the potential 
> source of new bugs, etc.

True. It took long enough to get the first fragtree stuff right, and I
still have the mental scars :)

-- 
dwmw2
