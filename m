Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LU55B-0001F6-UI
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2009 20:07:52 +0000
Date: Mon, 2 Feb 2009 20:07:43 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: Regarding UBI scalability
Message-ID: <20090202200743.GF28129@shareable.org>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4986D677.3020500@nokia.com>
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"brij.singh@samsung.com" <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You might also look at the method LogFS uses.  LogFS claims to be
scalable and very fast for large flashes already.

-- Jamie
