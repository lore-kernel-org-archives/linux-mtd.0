Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATsIK-0006iu-SA
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 00:33:37 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Joshua Wise <joshua@joshuawise.com>,
	linux-mtd@lists.infradead.org
Date: Wed, 10 Dec 2003 13:38:48 +1300
References: <200312091440.22926.joshua@joshuawise.com>
In-Reply-To: <200312091440.22926.joshua@joshuawise.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20031210003150.631E116BB2@desire.actrix.co.nz>
Subject: Re: nand: oob question
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 10 December 2003 08:40, Joshua Wise wrote:
> Hi all,
>
> I've been porting Linux to the iPAQ h1910. I'm having lots of issues
> mounting jffs2 partitions that I've traced down to there only being 16
> bytes of nand oob, not the 32 bytes that jffs2 seems to be expecting.
>
> Is my flash weird, or am I just dense?

Hopefully neither :-).

NAND typically has pages with 512bytes data + 16 bytes oob.  The newer 
(larger) stuff has 2kB data + 64bytes OOB per page.

Why do you think jffs2 wants 32bytes of OOB?

-- Charles
