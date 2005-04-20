Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOH0Q-0001Fx-Jw
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 11:20:47 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050420T165531-253@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<425E3174.4030308@inf.u-szeged.hu>
	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
	<loom.20050420T165531-253@post.gmane.org>
Content-Type: text/plain
Date: Wed, 20 Apr 2005 19:20:17 +0400
Message-Id: <1114010417.32582.30.camel@sauron.oktetlabs.ru>
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

On Wed, 2005-04-20 at 14:59 +0000, Sergei Sharonov wrote:
> Hmm.. then what improvement does summary patch provide? In my case mount
> returns in 1.5 minutes but then I cannot do anything to flash for
> another 20+ minutes.
Poor poor you :-)

Summary should accelerate mounting but leave the other characteristics 
inact in theory.

If you see that mount time only grows, that's a bug.

Read the chapter I referred you to - it will help you to understand the
nature of JFFS2 limitations.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
