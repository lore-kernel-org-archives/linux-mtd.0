Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfHJc-0008Cb-Lp
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 09:06:53 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id D4CF4229A6
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Jun 2005 17:06:18 +0400 (MSD)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
References: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Mon, 06 Jun 2005 17:06:18 +0400
Message-Id: <1118063178.5629.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS3 superblock search
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> in order not to lose your attention I decided to announce that the JFFS3
> design document (v0.1) now has a description of the Superblock
> management scheme. It allows to solve the slow mount problem and admits
> of locating the position of the Superblock for < 2ms (you'll find some
> digits in the document). Any suggestions, criticism etc are appreciated.

The document is here:
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf
