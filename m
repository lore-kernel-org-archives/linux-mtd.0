Received: from mail1.danielvalve.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15REiL-000453-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2001 16:12:13 +0100
Message-ID: <3B657B7F.E01BB17B@daniel.com>
Date: Mon, 30 Jul 2001 10:21:35 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Jan Debiec <jan.debiec@jurca.de>
CC: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>,
 	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS and RTLinux
References: <30724FF712DFD2119E6200104B244892011974BC@mail1> <3B6571F2.6258156D@jurca.de>
Content-Type: text/plain; charset=us-ascii
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

Jan Debiec wrote:

> Thanks Vipin,
>
> I've installed RTAI-1.6 as UP with Arcom-2.2.17 kernel (by RTAI
> configuration, you don't need to set SMP flag) and the Arcom board is
> running. Not only board, the RTAI tests are running on Arcom too
>
> Jan
>
> P.S. But the question is still open, why has MTD and JFFS problems with
> SMP flag set in kernel config.

If I was forced to make a single guess, I would say that spin locks are probably
not being properly handled somewhere.
I cannot speak more intelligently beyond this :)

Vipin
