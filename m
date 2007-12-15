Received: from nz-out-0506.google.com ([64.233.162.234])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J3LLj-000681-D6
	for linux-mtd@lists.infradead.org; Sat, 15 Dec 2007 00:57:57 +0000
Received: by nz-out-0506.google.com with SMTP id z3so711785nzf.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Dec 2007 16:57:50 -0800 (PST)
Message-ID: <6934efce0712141657t462b4b7frdc151effab5ae133@mail.gmail.com>
Date: Fri, 14 Dec 2007 16:57:50 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [GIT PULL] cache invalidation error, unlock blocks on power up,
	point hack
In-Reply-To: <6934efce0712131716x662f1f4k829a0d5bc396f25e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0712131716x662f1f4k829a0d5bc396f25e@mail.gmail.com>
Cc: Justin Treon <justin_treon@yahoo.com>, massimo cirillo <maxcir@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> (3) Physical address from ->point() from Jared Hulbert

Nick Piggin may have made this last patch unnecessary today.  I
removed it from my git tree.  Please pull to get the other two.
