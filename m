Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cm8fZ-0007tG-Fu
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 05:45:39 -0500
Message-ID: <41DBC52E.9020500@yandex.ru>
Date: Wed, 05 Jan 2005 13:45:02 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <20040113125031.GA5146@angel.research.nokia.com>
	<41DAAF79.8020401@imc-berlin.de>
In-Reply-To: <41DAAF79.8020401@imc-berlin.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Try JFFS3 with "summaries" enabled or Ferenc Havasi's JFFS2 "summary" 
patch. The mount speed should be increased with it.

Note: JFFS3 development is in progress so be ready if it has bugs.

Steven Scholz wrote:
> Hi,
> 
>> Is there anything that could be done to reduce the mount time of large
>> JFFS2 partitions?  Lazy mounting with prioritized scanning?
> 
> 
> I wonder if the current CVS head is much better (i.e. faster) in 
> mounting a JFFS2 root fs then linux-2.6.10?
> 
> Or in other words: does it make sense to use the current CVS instead of 
> the code in linux-2.6.10?
> 
> -- 
> Steven
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
