Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JAoU3-0004fF-0C
	for linux-mtd@lists.infradead.org; Fri, 04 Jan 2008 15:29:25 +0000
Message-ID: <477E4FB6.1060000@nokia.com>
Date: Fri, 04 Jan 2008 17:24:38 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Nancy <nancydreaming@gmail.com>
Subject: Re: UBIFS: copy file error
References: <bae050c10801040120u5d2379aak666c76f99443ef7a@mail.gmail.com>
In-Reply-To: <bae050c10801040120u5d2379aak666c76f99443ef7a@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

ext Nancy wrote:
> Hi,
>    As you can see at last, copy file failed. I use ubifs-olpc-2.6.22 version.
>    How can I make it right?
> 

It may be this bug:

http://git.infradead.org/?p=users/dedekind/ubifs-2.6.git;a=commitdiff;h=313ae7e3fd310930971334cf7f735d272d6e797e

Otherwise try cherry picking the latest patches from:

git://git.infradead.org/users/dedekind/ubifs-2.6.git
