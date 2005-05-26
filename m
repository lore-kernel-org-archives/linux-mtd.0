Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbM8A-0007EH-PL
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 13:26:51 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id EAC232F016
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 17:34:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 521C211C51
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 19:26:49 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 9B3A29BD9
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 19:26:48 +0200 (CEST)
Message-ID: <429606D3.3050704@imc-berlin.de>
Date: Thu, 26 May 2005 19:26:43 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050526152256.GS6681@pengutronix.de>	<4295ED9E.6000508@arcom.com>
	<4295EE70.8000608@imc-berlin.de>	<4295F3A4.70303@arcom.com>
	<20050526164635.GT6681@pengutronix.de>	<4295FF42.9090300@imc-berlin.de>
	<20050526171750.GW6681@pengutronix.de>
In-Reply-To: <20050526171750.GW6681@pengutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert Schwebel wrote:

> On Thu, May 26, 2005 at 06:54:26PM +0200, Steven Scholz wrote:
> 
>>You could {g,b}zip it. The many 0xFF should compress quite nice... ;-)
> 
> 
> Yes, but is there a way to decompress gzip/bzip in u-boot? 

Sure.
But maybe not yet as a user command. But the code is there. I use it to 
unzip boot logos at start up.

--
Steven
