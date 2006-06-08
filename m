Received: from mail.dsa-ac.de ([62.112.80.99])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoJ9w-0006Up-Cm
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 07:58:58 -0400
Date: Thu, 8 Jun 2006 13:58:10 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: pxa2xx-flash again, please?
In-Reply-To: <20060608115208.GA4155@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
References: <Pine.LNX.4.63.0606080916491.1760@pcgl.dsa-ac.de>
	<20060608073632.GA12338@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606080955050.1760@pcgl.dsa-ac.de>
	<20060608115208.GA4155@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="497817361-694138833-1149767890=:1760"
Cc: tpoynor@infradead.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--497817361-694138833-1149767890=:1760
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 8 Jun 2006, Jörn Engel wrote:

> On Thu, 8 June 2006 09:59:10 +0200, Guennadi Liakhovetski wrote:
>>
>> Sorry. This patch has been committed to mtd CVS (I think so, as it
>> appeared on mtd-cvs ML:
>> http://lists.infradead.org/pipermail/linux-mtd-cvs/2005-December/005252.html)
>> and I asked this question already a few weeks ago, so, I thought it might
>> ring the bell... The problem is - the patch has been submitted last
>> December still it is not in stock kernel nor in 2 mtd git-trees on
>> kernel.org/git, so...
>
> Well, the cvs has basically been abandoned.  There was some effort to
> pull the important patches from cvs into git, but as you noticed,
> things were lost.
>
> Not sure whether the patch makes sense or not.  Maybe Todd can comment
> that.

I think it does. It makes one file per (pxa) platform fewer.

Thanks
Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
--497817361-694138833-1149767890=:1760--
