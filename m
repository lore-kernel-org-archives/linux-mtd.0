From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0411161405080.27293@phoenix.infradead.org>
References: <Pine.LNX.4.58.0411161316390.25950@phoenix.infradead.org>
	<1100613327.8191.6954.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0411161405080.27293@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1100615381.8191.6957.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 16 Nov 2004 14:29:41 +0000
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: your mail
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-11-16 at 14:21 +0000, Artem B. Bityuckiy wrote:
> I dreamed about checkpoints which we may write only once for constant 
> files (for example, glibc libraries) ....
> 
> So, this problem is solvable I believe, but no I'm not quite sure are 
> checkpoints will be so useful as I thought ... 

Hm. I was imagining that we'd read in the information from the
checkpoint, and then pull in anything _new_ -- which would include any
nodes which weren't included in the checkpoint.

-- 
dwmw2
