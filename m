Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182fnD-0006La-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 23:40:31 +0100
Message-ID: <3DB08F54.7070104@redswitch.com>
Date: Fri, 18 Oct 2002 15:46:44 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: check disk usage
References: <Pine.LNX.4.44.0210181121090.20473-100000@filer.marasystems.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

> b) Do not use a real /etc/mtab. Link it to /proc/mounts. For details and
> limitations of not using a mtab see the mount(1) man page.. almost all
> setups can work just fine without a real mtab.
Thanks a lot. I did in this way to solve the problem.

Shawn.
