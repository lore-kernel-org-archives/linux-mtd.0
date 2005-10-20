Received: from tyo201.gate.nec.co.jp ([202.32.8.214])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESPl1-0003TK-Tz
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 22:02:17 -0400
Message-ID: <4356FA80.8000803@ak.jp.nec.com>
Date: Thu, 20 Oct 2005 11:01:36 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>
	<433A57D8.9030501@ak.jp.nec.com>	<20050929074500.GA16687@wohnheim.fh-wedel.de>	<435647A8.6090103@ak.jp.nec.com>
	<20051019142438.GA32362@wohnheim.fh-wedel.de>
In-Reply-To: <20051019142438.GA32362@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: James Morris <jmorris@redhat.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Lack of time.  I still have your patch and some from Forrest lingering
> in my inbox.  They all should receive a thorough line-by-line review -
> not necessarily by me, but by someone with enough knowledge.

Sorry for hastening.

> If it helps you, your patches are already in a relatively good state.
> I cannot easily find problems with it.

Thanks, I was hesitating whether I should begin to develop the ACL
features based on XATTR.
If XATTR would be in a good state, I'm willing to begin the design
and implementation.

-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
