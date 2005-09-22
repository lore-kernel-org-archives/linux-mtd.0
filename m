Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIRXu-00075f-Vp
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 09:55:42 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050922134811.GA6854@wohnheim.fh-wedel.de>
References: <20050922122052.GB4548@wohnheim.fh-wedel.de>
	<1127394310.3229.8.camel@windu.rchland.ibm.com>
	<20050922132104.GA6354@wohnheim.fh-wedel.de>
	<1127396504.28625.7.camel@sauron.oktetlabs.ru>
	<20050922134811.GA6854@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 22 Sep 2005 17:54:58 +0400
Message-Id: <1127397298.28625.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-22 at 15:48 +0200, Jörn Engel wrote:
> Can you explain "when JFFS2 has detected that the image is an old
> image" in C?
Well, we may even do better. Scan FS. If we meet any node which crosses
the eraseblock boundary - bye bye. That must be easy to implement as
node headers contain the total node length.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
