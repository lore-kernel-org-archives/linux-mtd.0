Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G4xxT-0005L7-Uh
	for linux-mtd@lists.infradead.org; Mon, 24 Jul 2006 06:46:46 -0400
Subject: Re: how to use jff2 on UBI layer?
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060720094558.GA30897@wohnheim.fh-wedel.de>
References: <1152536472.6066.28.camel@localhost.localdomain>
	<004601c6aba6$14554050$c7a3580a@swcenter.sec.samsung.co.kr>
	<20060720094558.GA30897@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 24 Jul 2006 14:46:08 +0400
Message-Id: <1153737968.16170.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: haver@vnet.ibm.com, linux-mtd@lists.infradead.org,
	'Marteo Tim' <tim.marteo@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-07-20 at 11:45 +0200, Jörn Engel wrote:
> As of now, it is impossible, sorry.  UBI exports an interface
> completely different from MTD, so JFFS2 cannot work on UBI.  What I
> used was a glue layer, called gluebi, that converts the UBI interface
> into an MTD interface.  But in its current form, that is still
> unacceptable, so I'm working on changing the code.

IMO, it would be much saner to do the following:

Change JFFS2 and introduce I/O abstraction to it. E.g., add an io.c file
with basic I/O functions like
jffs2_read()/jffs2_write()/jffs2_point()/jffs2_erase(). Then you could
add different I/O back-ends, like UBI. Note, even now we already have 2
I/O back-ends: MTD and eCos. Then it would be a matter of adding one
more I/O back-end - UBI.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
