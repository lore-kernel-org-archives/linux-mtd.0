Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEH8J-0000CY-7A
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 20:27:35 -0500
Received: by wproxy.gmail.com with SMTP id 37so292437wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2005 17:27:36 -0800 (PST)
Message-ID: <6934efce0503231727f7234f6@mail.gmail.com>
Date: Wed, 23 Mar 2005 17:27:36 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0503221406120.5581@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0503221406120.5581@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & deletion dirents RFC
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Forgive me if my ignorance is obvious...
Are there any implications to non-dirent nodes?  Shouldn't this speed
up the GC, mount time for any node?  If not then the version field for
non-dirent nodes is utterly wasted, right?  If the version field is
wasted for all non-dirent nodes (in other words, most nodes) then it
seems like a bad idea to add a WORD or DWORD to each node. If there is
a way to make version field only apply to dirent nodes then it would
be much better, of course that sounds ugly without even thinking it
through too far.
