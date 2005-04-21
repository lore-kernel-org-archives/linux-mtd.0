Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOdes-0000PG-7L
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 11:32:03 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <4267B8EF.6000803@inf.u-szeged.hu>
References: <loom.20050413T142519-107@post.gmane.org>
	<425E3174.4030308@inf.u-szeged.hu>
	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
	<loom.20050420T165531-253@post.gmane.org>
	<4267B8EF.6000803@inf.u-szeged.hu>
Content-Type: text/plain
Date: Thu, 21 Apr 2005 19:31:30 +0400
Message-Id: <1114097490.21485.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ferenc,

> Yes, that is the CRC checking time.

I doubt that actual CRC checking takes so much time. It is mainly *read*
operation.

> P.s.: Artem: you wrote that you don't think that swithing off the CRC 
> checking of summarized node is safe. Can you explain why? (I don't
know 
> the behavior of NAND deeply) Becuse it may help for Sergei...

Because what your option does is

+#ifdef CONFIG_JFFS2_SUMMARY_NOCRCCHECK	
+	ic->state = INO_STATE_CHECKEDABSENT;
+#endif

which is incorrect. You should not skip the checking process for inodes.
When I proposed not to check CRCs I meant another thing. And now I'm
uncertain that what I proposed is absolutely correct.

Please, bear in mind that the primary goal of the checking process is
not to check CRCs but rather to detect which nodes are valid, which are
obsolete. This is done by building fake fragtrees.

Correct me if I'm wrong.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
