Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hGoE-0006uj-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 22:45:06 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Cc: "'Jamey Hicks'" <jamey.hicks@hp.com>,
	"'David Woodhouse'" <dwmw2@infradead.org>,
	"'Conn Clark'" <clark@esteem.com>,
	"'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: RE: How does one mount an existing jffs2 partition so it is writeable?
Date: Tue, 20 Aug 2002 14:45:42 -0700
Message-ID: <004801c24892$eead6000$7800000a@derelict>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020820192408.GA19731@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> If this is a problem (feature/whatever) of one flash type, why not
> encapsulate it in the low level driver? It would keep the jffs2 code
> clean of what could be considered a bugfix.

That was my first thought. I submitted such a patch (-- it should be in
the archives), but IIRC David didn't want it applied to CVS.  He
suggested that I move this to the SA-1100 partition code.   I did that,
but that has its own ugliness.

-ch
