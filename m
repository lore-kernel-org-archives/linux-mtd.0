Received: from [200.53.172.215] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aHev-0003Dd-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 15:10:08 +0100
Message-ID: <20010824131854.1607.qmail@qis>
References: <20010824023928.3168.qmail@qis>
            <10297.998637309@redhat.com>
In-Reply-To: <10297.998637309@redhat.com> 
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdchar major , 90 or 91?
Date: Fri, 24 Aug 2001 13:18:54 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse writes: 

> 
> niko@isl.net.mx said:
>>  Why in MAKEDEV the char device has major 90 and in mtdchar.c it has
>> redefined from 90 to 91 in one of the first lines of code: 
> 
> Eep, sorry. That was a local hack which shouldn't have escaped my tree. 
> Reverted. 
> 

that's what I tought, last question, do you think I can use the lastest cvs 
for production, or I should stay on 20000704.....  (It's just I wanted to 
use Ollie Who's new DoC millenium driver and be up to date.....) 


Nikolai
