Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K35Kf-0002t2-3z
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 08:23:57 +0000
Date: Mon, 2 Jun 2008 10:23:47 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: big flash disks?
Message-ID: <20080602082346.GB20259@logfs.org>
References: <20080601184239.GA11135@shareable.org>
	<1212386359.31023.154.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1212386359.31023.154.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 June 2008 08:59:19 +0300, Artem Bityutskiy wrote:
> cheap. SSD is a completely different area and irrelevant to UBIFS. The
> same applies for LogFS and YAFFS IMO. Talking about using these FS-es on
> SSD is just silly (again IMHO).

While I don't want to change your opinion, people may misunderstand it
if I ignore this comment.

>From day one, I've wanted to use logfs in my laptop.  If it is useful
for embedded devices, that is nice and may have the benefit of paying my
bills.  But the real price I'm after is getting rid of hard disks and
have a decent filesystem on top of whatever flash I can attach to my
notebook.

At the moment, the flash one can sensibly attach to a notebook is an
SSD with SATA interface.  It has a bunch of disadvantages and there is
no point in listing them all.  But it is the reality and denying it
doesn't change that.  And this reality is the reason why logfs needs
another format change and Linus doesn't want to have it merged yet.
Making it perform well on SSDs comes first. :)

Jörn

-- 
Joern's library part 4:
http://www.paulgraham.com/spam.html
