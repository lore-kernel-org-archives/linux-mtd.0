Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CX7dm-0007vF-7M
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 19:37:43 -0500
Message-ID: <41A52950.4070600@mvista.com>
Date: Wed, 24 Nov 2004 16:37:36 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
	<1101301663.22829.3.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1101301663.22829.3.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Tue, 2004-11-23 at 16:25, Todd Poynor wrote:
> 
> <snip>
> 
>>If anyone has any suggestions or comments as to why this wouldn't work
>>for their device or usage model or why this isn't the right way to go
>>about things then I'd appreciate it, thanks. -- Todd
> 
> 
> Not everyone uses mtd partitions...

Unfortunately options for doing anything terribly intelligent about it 
seem to be few in such a case.  If somebody wants MTD to automatically 
figure out what the proper locking status is for these chips then the 
partition map is the only thing we've got to go on (at present anyhow). 
  So it could be argued that by not using partitions you've decided to 
handle it yourself (such as explicit flash_unlock of needed ranges after 
userspace startup).  I'm guessing that some new way of specifying what 
areas of flash are intended to be writeable vs. read-only, apart from 
the existing partition maps, would not be well received.  But if there 
is some nifty way of doing this outside the partition framework then I'm 
interested.  And doing nothing or doing something simplistic are 
certainly options as well.  Thanks,

-- 
Todd
