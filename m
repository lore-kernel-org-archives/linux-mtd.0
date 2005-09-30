Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELPN6-0005q7-Av
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 14:12:44 -0400
Message-ID: <433D8010.1090701@ru.mvista.com>
Date: Fri, 30 Sep 2005 22:12:32 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
References: <20050930121741.GA5506@elf.ucw.cz>	
	<433D482A.1000708@ru.mvista.com>
	<1128089827.3111.2.camel@windu.rchland.ibm.com>
In-Reply-To: <1128089827.3111.2.camel@windu.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	kernel list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch] switch mtd to new driver model & cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As far as I've heard, there's gonna be a megre quite soon... :)
Anyway, I guess it'd be better if Pavel ntroduced the new patch against 
the latest linux-mtd code.

Best regards,
   Vitaly

Josh Boyer wrote:

>On Fri, 2005-09-30 at 18:14 +0400, Vitaly Wool wrote:
>  
>
>>Hi Pavel,
>>
>>it looks like your patch is not against the latest linux-mtd CVS sources 
>>since there's no such things as mtd_pm_dev in the current one. Please 
>>correct me if I'm mistaken.
>>    
>>
>
>I'm assuming Pavel is just fixing up what's in the mainline kernel.
>This happens quite often, since MTD doesn't sync all too much for
>various reasons.
>
>When a sync is done, stuff like this usually gets picked up in some form
>for the MTD CVS tree.  See the commit messages that say things like
>"Merge with upstream".
>
>josh
>
>
>  
>
