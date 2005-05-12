Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWGny-0006IN-3b
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 12:44:59 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ralph Walden <ralphw@everest-co.com>
In-Reply-To: <81772B4336DEC14EBB8C519C4EC21051F80D9C@pe2650.everest-co.com>
References: <81772B4336DEC14EBB8C519C4EC21051F80D9C@pe2650.everest-co.com>
Content-Type: text/plain
Date: Thu, 12 May 2005 20:44:22 +0400
Message-Id: <1115916262.27158.65.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: kernel BUG at fs/jffs2/gc.c:190!
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I have not.  I didn't know about that one.  What would we expect to
> prove?
Nothing to prove. The idea is to make everyone able to reproduce it. I
may then debug the problem, for example.

> I'm not sure I understand.  All console messages go to the same serial
> line (it's an embedded system with no "real" console.)  I do have the
> log in a text file (with the split-up messages as I described.)  Would
> you like me to send it to you?
I meant that if your messages go to console synchronously (not via Xlogd),
you'll have full log without "splits".

Yes, I'd like to have log.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
