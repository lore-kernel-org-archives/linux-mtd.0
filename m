Received: from mail07.svc.cra.dublin.eircom.net ([159.134.118.23])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BsHqB-0003BC-Tm
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2004 05:13:45 -0400
Date: Wed, 04 Aug 2004 09:55:41 +0100
To: =?utf-8?Q?J=C3=B6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
References: <20040731135955.GA10803@wohnheim.fh-wedel.de>
From: "Dermot McGahon" <dermot@dspsrv.com>
Content-Type: text/plain; format=flowed; delsp=yes; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opsb69q3lv3ertue@mail.dspsrv.com>
In-Reply-To: <20040731135955.GA10803@wohnheim.fh-wedel.de>
Cc: 
Subject: Re: [RFC] Volatile data device vor jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 31 Jul 2004 15:59:55 +0200, Jörn Engel  
<joern@wohnheim.fh-wedel.de> wrote:

> With a ram based volatile device, there is danger of data loss, so
> garbage collection would have to be forced from time to time, similar
> to the current wbuf approach for nand.

[-]

> Comments?

Well, it still needs to be flushed to something non-volatile at
some point.

You can vary the time between flushes. It depends on how valuable
that data is to you. With an approach such as this you are really
deciding how big of a window for data loss you are willing to put
up with.

The approach I took while doing this a couple of years ago was not
to erase blocks until absolutely necessary and then do all the
garbage collection/file system reorganisation once. This took time
to do though, was suitable for the device in question (a KVM), but
possibly not for a general filesystem.


Dermot.
--
