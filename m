Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cs7Y3-0003nd-Nm
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 17:46:38 -0500
Received: by wproxy.gmail.com with SMTP id 68so52254wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Jan 2005 14:46:32 -0800 (PST)
Message-ID: <6934efce050121144619d2899d@mail.gmail.com>
Date: Fri, 21 Jan 2005 14:46:32 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

New idea.

Why should we waste time compressing the uncompressable?  JFFS2
actually spent alot of time compressing.

I can think of a few possible mechanisms:
a) extension based
        -Don't compress files with .mpg, .jpg, .avi, .gz, etc.  User
defined list?
b) test first data
         Compress the first X sized chunk of data to determine if the
file is compressable.  Make  determination and write data.
c) test node by node
          If the last node didn't compress, stop compressing file.
