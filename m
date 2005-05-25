Received: from cipe.mpl.ch ([195.134.130.77] helo=mail.mpl.ch)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Daqpo-0006fa-4m
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 04:01:51 -0400
Message-ID: <429430F1.2080208@elsoft.ch>
Date: Wed, 25 May 2005 10:01:53 +0200
From: =?ISO-8859-15?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
	<d.mueller@elsoft.ch>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <429320D1.2060003@elsoft.ch>
	<1116944005.16577.23.camel@sauron.oktetlabs.ru>
In-Reply-To: <1116944005.16577.23.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 access delay
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

Artem B. Bityuckiy wrote:
>> During this delay, "jffs2_gcd_mtd1" is consuming a large amount of
>> CPU time but the rest of the system seems to be well.

"ls" delay time goes up to over 6 minutes for a tar file containing 1000
files.

> This is normal JFFS2 behaviour (unfortunately). Just after mount
> JFFS2 starts checking process which consumes resources.

This is a little bit of a problem if your system's root file system is
on this partition, blocking the whole boot process :-(

What puzzles me is the fact that the tar file building process
triggers this "weak" point in JFFS2. Tar simply concatenates its input
files together and writes them to the output file (at least this is my
idea of how tar works). So on the file system level, i don't see much
of a difference between a functionality used by "tar" or by "cp". What
is so special about tar?

> What is the size of your flash?

The JFFS2 partition has 126MiB, the whole NAND flash has a size of 128MiB.


Dave
