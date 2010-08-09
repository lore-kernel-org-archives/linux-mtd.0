Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiSFY-00080T-Cr
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 13:18:45 +0000
Message-ID: <4C60002E.5070704@parrot.com>
Date: Mon, 9 Aug 2010 15:18:38 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/7] UBIFS: recent patches
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> Hi,
> 
> Matthieu, I failed to figure out how gc_lnum can become -1 in the master node.
> Most probably I'll have to create a debugging patch and ask you to reproduce
> the error again, but do not thing I'll have time for this in August. So, you
> could try to look at the code and put more printk's in interesting places
> yourself, and find when exactly it becomes -1, and then how it ends up in the
> master node. That would be helpful.
Ok,

I will try to see what can I do.


Matthieu
