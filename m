Received: from mta072d.interbusiness.it ([85.37.17.72])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiZsQ-0000Ci-4v
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 12:09:39 -0500
Message-ID: <4554B076.5010705@eptar.com>
Date: Fri, 10 Nov 2006 18:01:42 +0100
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: mount costs too long
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>		<1163159781.19697.24.camel@crusty.rchland.ibm.com>		<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>		<1163174898.3925.13.camel@sauron>
	<4554A592.5000308@ru.mvista.com>	<1163176000.3925.15.camel@sauron>
	<4554AA07.5020204@ru.mvista.com>
In-Reply-To: <4554AA07.5020204@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vitaly Wool <vwool@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:
> B/c due to the MTD layer rework, there's no way now to use custom
> oobinfo in yaffs.
> Therefore, as yaffs1 presumes the SmartMedia OOB layout one can either
> read/write raw OOB but that will most probably break the bad block
> handling, or implement a small shim layer putting spare OOB area into
> SmartMedia OOB layout or back. Any other way will result in
> incompatibility with the older version of yaffs1.
>   
Is there a way to specify SmartMedia OOB layout in the board
driver?
Also ssfdc.c needs SmartMedia OOB layout to work.

Cheers,
Claudio Lanconelli
