Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CV4wP-0000oG-LU
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2004 04:20:36 -0500
Message-ID: <419DBAA4.4070207@yandex.ru>
Date: Fri, 19 Nov 2004 12:19:32 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: 419cf994+419d3f9e@tempmail.wgz.org, bwarden@wgz.com
References: <Pine.LNX.4.44.0411181209170.27784-100000@localhost.localdomain>
	<1100810691.31062.22.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1100810691.31062.22.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Determining actual flash usage of a particular file
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



jdub@us.ibm.com wrote:
> On Thu, 2004-11-18 at 14:15, 419cf994@tempmail.wgz.org wrote:
> 
>>I've been reading through the archives for several days, so I hope I 
>>haven't missed an answer somewhere.
>>
>>Is there a way to determine the actual flash space occupied by a 
>>particular file on a JFFS2 partition?  'ls' and 'du' report number of 
>>bytes of the content of the file, but of course compression and other 
>>factors affect that greatly.
>>
>>My definition of actual space is flexible...  could be number of blocks or 
>>pages occupied, or something similar.  I just need a metric that's more 
>>closely related to storage space than uncompressed size.
> 
> 
> I don't know of a way to get this info on a running system.  If you can
> pull the binary filesystem image off of the board you might be able to
> hack jffs2dump.c in the util directory to give you that info.
> 
> Or maybe there are other ways that I don't know about.
> 
> josh

You may write some fctl which does this. In the kernel space, it is very 
easy to calculate th actual size of the file on flash (just go through 
node_refs and summ the ref->totlen).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
