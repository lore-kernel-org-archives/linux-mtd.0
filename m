From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41597498.7090704@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
	<41597498.7090704@yandex.ru>
Content-Type: text/plain
Message-Id: <1096382241.30942.81.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 15:37:22 +0100
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

On Tue, 2004-09-28 at 18:26 +0400, Artem B. Bityuckiy wrote:
> Yes, you are right. But we may handle this situation. Suppose we've 
> found that the last node is bad. In this can we write new node 
> containing the same data area (the area range is known since the header 
> CRC is good). Thus, that last bad node will be obsoleted and the new 
> last node will be good. If there are will be new unclean reboot, we will 
> have two bad nodes at the end.
> Only after obsoleting last bad node we allow new writes.
> 
> What do you think now? :-)

It doesn't work unless you _know_ that the last time the fs was mounted
it was with this new code instead of with the old code which _doesn't_
do that. Unless you call it JFFS3 it doesn't seem like the answer :)

> I'm really going to do such the optimization and your idea is 
> complicated enough. I'd like to find easier solution and don't introduce 
> additional complicated things to the already complicated file system :-) 
> Ok, I'll think on this problem.

The file system is simple -- in fact it's _trivial_. Only the
optimisations are complex. It's a bit like chess. :)

-- 
dwmw2
