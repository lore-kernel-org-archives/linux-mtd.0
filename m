Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbLcw-0006mw-CB
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 12:54:35 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id BF2992F016
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 17:02:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 2845011C51
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 18:54:32 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 70DDF9BD9
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 18:54:31 +0200 (CEST)
Message-ID: <4295FF42.9090300@imc-berlin.de>
Date: Thu, 26 May 2005 18:54:26 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20050526152256.GS6681@pengutronix.de>	<4295ED9E.6000508@arcom.com>
	<4295EE70.8000608@imc-berlin.de>	<4295F3A4.70303@arcom.com>
	<20050526164635.GT6681@pengutronix.de>
In-Reply-To: <20050526164635.GT6681@pengutronix.de>
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

> On Thu, May 26, 2005 at 05:04:52PM +0100, David Vrabel wrote:
> 
>>Since I happened to have an image lying around I checked and it does
>>place the clean markers at the start of every erase zone.
> 
> 
> Hmm, sounds good, but that probably means that the jffs2 images have to
> be the full flash size (which is 32 MB in my case) compared to about 8
> MB at the moment? 

You could {g,b}zip it. The many 0xFF should compress quite nice... ;-)

--
Steven
