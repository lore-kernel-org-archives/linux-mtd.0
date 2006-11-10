Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiZot-0008Rr-Ls
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 12:05:45 -0500
Message-ID: <4554B16C.2020303@ru.mvista.com>
Date: Fri, 10 Nov 2006 20:05:48 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Claudio Lanconelli <lanconelli.claudio@eptar.com>
Subject: Re: mount costs too long
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>		<1163159781.19697.24.camel@crusty.rchland.ibm.com>		<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>		<1163174898.3925.13.camel@sauron>
	<4554A592.5000308@ru.mvista.com>	<1163176000.3925.15.camel@sauron>
	<4554AA07.5020204@ru.mvista.com> <4554B076.5010705@eptar.com>
In-Reply-To: <4554B076.5010705@eptar.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Claudio Lanconelli wrote:

>Is there a way to specify SmartMedia OOB layout in the board
>driver?
>  
>
Yes. Still I'm not sure if you need to hack nand_base or not.

>Also ssfdc.c needs SmartMedia OOB layout to work.
>
>  
>
It's a separate case AFAIK.

Vitaly
