Received: from kynes.gatewest.net ([198.163.227.7])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1v7Y-0004Fr-SJ
	for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2003 22:54:57 +0100
From: Cam Mayor <cmayor@iders.ca>
To: "Steve Brockway" <steve@str8line.com>, <linux-mtd@lists.infradead.org>
Date: Tue, 23 Sep 2003 16:54:36 -0500
References: <00a601c37ec3$46b95760$b670a8c0@laptoplukkino>
	<005201c381f9$25660a70$b670a8c0@laptoplukkino>
	<01ba01c38202$644206a0$0800000a@qwest.net>
In-Reply-To: <01ba01c38202$644206a0$0800000a@qwest.net>
MIME-Version: 1.0
Message-Id: <03092316543605.28719@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: mounting mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 23 September 2003 13:42, Steve Brockway wrote:
> Hello All, I am new to this type of mailing list.
>
> I need help mounting a JFFS2. Not sure of the correct steps. The underlying
> MTD structure is working.
>
> Below is a part of a boot sequence and the the output of
> cat /proc/mtd.
>
> What is the next step to mount a JFFS2?

1) read through mtd-jffs-HOWTO.txt for the answer
2) beware using more than 8 (ie. 0-7) mtd partitions.  mtdblock devices don't 
go higher than that.  (or so it seems)
3) for new questions, start a new subject line without hitting the reply 
button

-- 
Cameron Mayor
Iders Incorporated
