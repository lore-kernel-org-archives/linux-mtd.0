Received: from smtprelay02.ispgateway.de ([62.67.200.157])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C27UE-0005ll-LD
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2004 08:11:44 -0400
Received: from unknown (HELO xpc823) (183433@[82.82.34.26])
	(envelope-sender <tmbinc@elitedvb.net>)
	by smtprelay02.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 31 Aug 2004 12:11:40 -0000
Message-ID: <41346BB0.6030107@elitedvb.net>
Date: Tue, 31 Aug 2004 14:14:40 +0200
From: Felix Domke <tmbinc@elitedvb.net>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <41345F58.4000206@elitedvb.net>
	<1093953527.25339.70.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1093953527.25339.70.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Incomplete nodes written to flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:

>Have you actually lost data?  I have seen the case where GC nodes don't
>get flushed to the medium on my board, but I haven't lost data.
>  
>
u-boot's jffs2_1pass ignores CRCs (i know, bad behaviour. I should fix 
that, or is there any other jffs2 reader avaiable?), and thus prefers 
the latest, incomplete version of the file.

>pdflushd will write out non-GC nodes.  GC nodes aren't flushed because
>of wasted space with padding I suppose.
>  
>
Ok, that sounds good.

I now see that the garbage collection is done to fill up write buffers, 
i.e. flush the important data to flash.

Felix
