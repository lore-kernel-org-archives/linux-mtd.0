Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jooj-0003U4-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 22:23:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <4.1.20010918183424.00a8fc20@mail.arc.nasa.gov> 
References: <4.1.20010918183424.00a8fc20@mail.arc.nasa.gov> 
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: New interface to (old) JEDEC chips 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Sep 2001 22:28:58 +0100
Message-ID: <7576.1000934938@redhat.com>
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

ehildum@mail.arc.nasa.gov said:
> 1. I ran into a case where the code returned zeroes for both the
> manufacturer ID and the chip ID

> 2. The 'retried' variable is never incremented.

Your fix for both was correct. Stupid dwmw2. Thanks.



--
dwmw2
