Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3E5X-0008DB-KT
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 08:59:04 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Narinder Kumar <narinder@kritikalsolutions.com>
In-Reply-To: <4219E20F.80908@kritikalsolutions.com>
References: <4219E20F.80908@kritikalsolutions.com>
Content-Type: text/plain
Date: Mon, 21 Feb 2005 16:58:30 +0300
Message-Id: <1108994310.13420.50.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-21 at 18:58 +0530, Narinder Kumar wrote:
> mkfs.jffs2 -e 0x420 -d /tmp/Application

0x420 is strange size. I believe it is wrong, try to look at your Flash
specification closer. 
