Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoPz-0003bU-Ix
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:33:49 -0400
Message-ID: <4337B241.3090300@cetrtapot.si>
Date: Mon, 26 Sep 2005 10:33:05 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <4337A604.6050204@cetrtapot.si> <4337AE41.3040807@yandex.ru>
In-Reply-To: <4337AE41.3040807@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: fragtree method?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> 
> So, what you see is the JFFS2's feature. One way to relax that bad 
> property is to use the latest JFFS2 with EBS enabled. You'll mount much 
> faster. But it is worth noting that this does not radically change the 
> situation with JFFS2 as it still stays linearly scalable (O(N)).

Thank you for prompt answer. We were aware of the slow-mount-feature of 
JFFS2 but your explaination cleared some stuff for us though.

> 
> It is already in the CVS. And yes, it reduces the backgroung CPU load 
> (the checking process) considerably.

Ah, great. That would explain some of the patch problems I've been 
having while trying to apply the fragtree patch (although it doesn't 
apply cleanly on july CVS checkout either).

Will post comments on using new CVS in respect to the one we were using 
until recently.

regards,
hinko k
