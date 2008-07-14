Received: from qw-out-1920.google.com ([74.125.92.147])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KIMaW-0002vv-JE
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 11:51:28 +0000
Received: by qw-out-1920.google.com with SMTP id 5so105288qwf.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jul 2008 04:51:27 -0700 (PDT)
Subject: Re: About mkfs.jffs2
From: Josh Boyer <jwboyer@gmail.com>
To: Qiang Wang <rurality.linux@gmail.com>
In-Reply-To: <71413c850807132338q38849e5egd49631295f3105f3@mail.gmail.com>
References: <71413c850807132338q38849e5egd49631295f3105f3@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 14 Jul 2008 07:51:20 -0400
Message-Id: <1216036280.14579.39.camel@weaponx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-07-14 at 15:38 +0900, Qiang Wang wrote:
> hello, everyone
> 
> I use mkfs,jffs2 tools to make my jffs2 filesystem.
> I found that it apply some compress logic, result the data is compressed.
> How can I remove the compressing function from the tools?
> 
> my command is as below:
> ./mkfs.jffs2 -r fs -o root.jffs2 -e 0x20000 -s 0x20000 -l -p

Add '-m none'.  And you could have figured that out pretty easily by
doing --help or reading the code.

josh
